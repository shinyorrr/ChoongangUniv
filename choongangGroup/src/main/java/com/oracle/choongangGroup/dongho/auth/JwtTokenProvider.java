package com.oracle.choongangGroup.dongho.auth;


import io.jsonwebtoken.*;

import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.extern.slf4j.Slf4j;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.security.Key;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.stream.Collectors;

@Slf4j
@Component
//@RequiredArgsConstructor
public class JwtTokenProvider {
//	@Autowired
//	private MemberService memberService;
	@Autowired
	private SecurityRepository securityRepository;
    private final Key key;
    
    // yml 에 저장해둔 secret key 가져와서 key 만들기
    public JwtTokenProvider(@Value("${jwt.secret}") String secretKey) {
        byte[] keyBytes = Decoders.BASE64.decode(secretKey);
        this.key = Keys.hmacShaKeyFor(keyBytes);
    }

    // 유저 정보를 가지고 AccessToken, RefreshToken 을 생성하는 메서드
    public TokenInfo generateToken(Authentication authentication) {
    	log.info("===generateToken start===");
    	log.info("generateToken authentication.getName() : {}", authentication.getName());
    	// 권한 가져오기
        String authorities = authentication.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.joining(","));
        // 현재시간 받기
        long now = (new Date()).getTime();
        // Access Token 생성
        // 만료시간 설정 (현재시간 + 만료기간)
        Date accessTokenExpiresIn = new Date(now + 60 * 30 * 1000L); // param * 1000L => param 초 (밀리초 단위이므로 1000으로 나누면 초가 된다)
        Date refreshTokenExpiresIn = new Date(now + 60 * 60 * 1000L); // param * 1000L => param 초 (밀리초 단위이므로 1000으로 나누면 초가 된다)
        // Jwts를 이용하여 토큰 생성
        String accessToken = Jwts.builder()
        		//authentication 으로부터 유저정보를 받아 넣는다. getName => memberId , authorites => roles
                .setSubject(authentication.getName())
                .claim("auth", authorities)
                //만료시간 설정
                .setExpiration(accessTokenExpiresIn)
                //암호화 알고리즘 설정
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();

        // Refresh Token 생성 (토큰 변조 유무 및 db와 일치 여부만 확인하면 되므로 유저정보는 넣지 않는다)
        String refreshToken = Jwts.builder()
                .setExpiration(refreshTokenExpiresIn) // 60분
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
        // TokenInfo dto에 토큰 넣기
        return TokenInfo.builder()
                .grantType("Bearer")
                .accessToken(accessToken)
                .refreshToken(refreshToken)
                .build();
    }

    // JWT 토큰을 복호화하여 토큰에 들어있는 정보를 꺼내는 메서드
    // usernamepasswordAuthenticationToken 형태로 받아서 유저정보를 꺼내쓴다.
    public Authentication getAuthentication(String accessToken) {
        // 토큰 복호화
        Claims claims = parseClaims(accessToken);

        if (claims.get("auth") == null) {
            throw new RuntimeException("권한 정보가 없는 토큰입니다.");
        }

        // 클레임에서 권한 정보 가져오기
        Collection<? extends GrantedAuthority> authorities =
                Arrays.stream(claims.get("auth").toString().split(","))
                        .map(SimpleGrantedAuthority::new)
                        .collect(Collectors.toList());

        // UserDetails 객체(principal)를 만들어서 Authentication 리턴(jwt토큰에 민감한 정보인 비밀번호를 넣을 필요가 없으므로 credential 은 "")
        log.info("getAuthentication claims.getSubject() : {}", claims.getSubject());
        UserDetails principal = new User(claims.getSubject(), "", authorities);
        return new UsernamePasswordAuthenticationToken(principal, "", authorities);
    }

    // 토큰 정보를 검증하는 메서드
    public boolean validateToken(String token) {
    	if(token == null) {
    		log.info("token 이 존재하지 않습니다.");
    		return false;
    	}
        try {
            Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token);
            return true;
        } catch (io.jsonwebtoken.security.SecurityException | MalformedJwtException e) {
            log.info("Invalid JWT Token", e);
        } catch (ExpiredJwtException e) {
        	// 토큰 만료시 Exception catch하면 false 리턴
        	log.info("======토큰 만료======");
            return false;
        } catch (UnsupportedJwtException e) {
            log.info("Unsupported JWT Token", e);
        } catch (IllegalArgumentException e) {
            log.info("JWT claims string is empty.", e);
        }
        return false;
    }
    // 토큰 복호화 (미리 정해둔 개인키로)
    public Claims parseClaims(String accessToken) {
        try {
            return Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(accessToken).getBody();
        } catch (ExpiredJwtException e) {
            return e.getClaims();
        }
    }
    
    // DB refreshToken 비교 method
	public boolean existsRefreshToken(String refreshToken, String userid) {
		//클라이언트로부터 받은 accessToken 에 포함된 유저정보 memberId 와 refresh 토큰을 받아와서
		//memberId 해당하는 member의 refresh 토큰(DB)과 클라이언트로부터 받은 refresh 토큰과 비교한다.
		
		log.info("====existsRefreshToken start====");
		// 받은 memberId로 DB의 refresh 토큰 받기
		String DbRrefreshToken = securityRepository.findByUserid(userid).getRefreshToken();
		log.info("existsRefreshToken DbRrefreshToken : {}", DbRrefreshToken);
		log.info("existsRefreshToken refreshToken : {}", refreshToken);
		if (refreshToken.equals(DbRrefreshToken)) {
			// 비교후 같다면 true를 리턴
			log.info("refreshToken equals DbRrefreshToken");
			return true;
		}
		return false;
	}
}
