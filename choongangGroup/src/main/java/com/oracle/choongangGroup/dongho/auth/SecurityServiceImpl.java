package com.oracle.choongangGroup.dongho.auth;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.dongho.auth.SecurityRepository;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
//@RequiredArgsConstructor
public class SecurityServiceImpl implements SecurityService {
	private final SecurityRepository securityRepository;
	
	private final AuthenticationManagerBuilder authenticationManagerBuilder;
    
	private final JwtTokenProvider jwtTokenProvider;
   
    public SecurityServiceImpl(SecurityRepository securityRepository, AuthenticationManagerBuilder authenticationManagerBuilder, JwtTokenProvider jwtTokenProvider) {
        this.securityRepository = securityRepository;
        this.authenticationManagerBuilder = authenticationManagerBuilder;
        this.jwtTokenProvider = jwtTokenProvider;
    }
    
    // login method
    public TokenInfo login(String username, String password) {
    	// controller에서 복호화한 username, password
        System.out.println("tokenInfo(login) username -> " + username);
        System.out.println("tokenInfo(login) password -> " + password);
        
        // authentication token 만들기 (JWT아님, spring security의 authentication token)
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
        System.out.println("tokenInfo login authenticationToken -> " + authenticationToken);
        
        Authentication authentication = null;
        try {
        	// authenticationToken 의 정보를 토대로 Authentication manager 의 authenticate method를 통해 유저정보 검증후 authentication 생성, 받기
        	authentication = ((AuthenticationManager)this.authenticationManagerBuilder.getObject()).authenticate((Authentication)authenticationToken);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
        
        // SecurityContextHolder에 authenticaton 저장
        SecurityContextHolder.getContext().setAuthentication(authentication);
        // authentication 의 정보를 토대로 JWT 생성 및 controller에 반환
        TokenInfo tokenInfo = this.jwtTokenProvider.generateToken(authentication);
        return tokenInfo;
    }
    // DB에 refresh Token 저장 method
 	public void saveRefreshToken(String refreshToken, String username) {
 		System.out.println("saveRefreshToken start");
 		System.out.println("saveRefreshToken refreshToken : " + refreshToken);
 		System.out.println("saveRefreshToken memberId : " + username);
 		
 		// 호출한 class에서 받은 memberId로 member받기( JpaRepository 의 save 가 merge하므로 memberId에 해당하는 member를 받아서 save함)
 		Member member = securityRepository.findByUserid(username);
 		System.out.println("saveRefreshToken member.getUserid : " + member.getUserid());
 		member.setRefreshToken(refreshToken);
 		// refresh Token DB에 저장
 		securityRepository.save(member);		
 	}
	@Override
	public void save(Member member) {
		securityRepository.save(member);
	}

	@Override
	public Member findByUserid(String userid) {
		return securityRepository.findByUserid(userid);
	}

	@Override
	public Member findByNameAndEmail(String searchId, String searchEmail) {
		return securityRepository.findByNameAndEmail(searchId , searchEmail);
	}

	@Override
	public Optional<Member> findByUseridAndEmail(String userid, String email) {
		return securityRepository.findByUseridAndEmail(userid, email);
	}




}
