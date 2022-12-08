package com.oracle.choongangGroup.dongho.auth;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.GenericFilterBean;

import io.jsonwebtoken.Claims;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;

@RequiredArgsConstructor
public class JwtAuthenticationFilter extends GenericFilterBean {

    private final JwtTokenProvider jwtTokenProvider;
    private final SecurityService securityService;
    private final HttpServletResponse httpResponse;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        // Request Header cookie 에서 JWT 토큰 추출
        String accessToken = resolveAccessToken((HttpServletRequest) request);
        String refreshToken = resolveRefreshToken((HttpServletRequest) request);

        // validateToken 으로 토큰 유효성 검사
        if (accessToken != null && jwtTokenProvider.validateToken(accessToken)) {
        	System.out.println("JwtAuthenticationFilter val1 start");
            // 토큰이 유효할 경우 토큰에서 Authentication 객체를 가지고 와서 SecurityContext 에 저장
            Authentication authentication = jwtTokenProvider.getAuthentication(accessToken);
            
            SecurityContextHolder.getContext().setAuthentication(authentication);
        // AT 유효기간 지나고 RT가 null이 아니면 RT 검증후 AT,RT 재발급
        } else if (accessToken != null && !jwtTokenProvider.validateToken(accessToken) && refreshToken != null) {
        	System.out.println("JwtAuthenticationFilter val2 start");
        	// AT로부터 memberId 받기
        	Claims claims = jwtTokenProvider.parseClaims(accessToken);
        	String userid = claims.getSubject();
        	System.out.println("JwtAuthenticationFilter val2 userid : " + userid);
        	// AT로부터 authentication 객체 받기
        	Authentication authentication = jwtTokenProvider.getAuthentication(accessToken);
        	System.out.println("JwtAuthenticationFilter val2 getAuthentication Done");
        	// RT 검사
        	boolean validateRefreshToken = jwtTokenProvider.validateToken(refreshToken);
        	System.out.println("JwtAuthenticationFilter val2 validateToken Done : " + validateRefreshToken);
        	// RT db에 있는 RT 와 일치하는지 검사
        	boolean equalRefreshToken = jwtTokenProvider.existsRefreshToken(refreshToken , userid);
        	System.out.println("JwtAuthenticationFilter val2 existsRefreshToken Done : " + equalRefreshToken);
        	if (validateRefreshToken && equalRefreshToken) {
        		System.out.println("validateRefreshToken && equalRefreshToken start");
        		// 새 AT, RT 생성
				TokenInfo newTokenInfo = jwtTokenProvider.generateToken(authentication);
				String newAT = URLEncoder.encode(newTokenInfo.getAccessToken(), "utf-8");
		        String newRT = URLEncoder.encode(newTokenInfo.getRefreshToken(), "utf-8");
		        // AT로부터 authentication 객체 받기
		        Authentication newAuthentication = jwtTokenProvider.getAuthentication(newAT);
		        // 새로운 토큰에서 Authentication 객체를 가지고 와서 SecurityContext 에 저장
		        SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		        // 새 RT db에 저장
		        securityService.saveRefreshToken(newRT, userid);
		        
		        // 쿠키에 새로운 AT , RT 저장
		        Cookie cookieAT = new Cookie("AccessToken","Bearer" + newAT);
		        Cookie cookieRT = new Cookie("RefreshToken", "Bearer" + newRT);
		        //cookie.setMaxAge(7 * 24 * 60 * 60); // 유효시간을 정하지 않으면 session cookie (휘발성. 브라우저종료시 삭제)
		        cookieAT.setPath("/");
		        // httpOnly true -> javascript에 의한 토큰탈취 XSS공격 방지 (Cross Site Scripting)
		        // http통신에서만 사용되게 하므로 클라이언트단 javascript(document.cookie)로 cookie정보 확인 불가
		        cookieAT.setHttpOnly(true);
		        cookieRT.setPath("/");
		        cookieRT.setHttpOnly(true);
		        httpResponse.addCookie(cookieAT);
		        httpResponse.addCookie(cookieRT);
			}
        }
        chain.doFilter(request, response);
    }

    // Request Header (cookie) 에서 access토큰 정보 추출
    private String resolveAccessToken(HttpServletRequest request) {
        Cookie[] list = request.getCookies();
        String bearerToken = "";
        if (list != null) {
        	for (Cookie cookie : list) {
    			if (cookie != null && cookie.getName().equals("AccessToken")) {
    				bearerToken = cookie.getValue();
    				if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer")) {
    					// 쿠키 value에서 bearer 부분 제외한 token만 추출
    		            return bearerToken.substring(6);
    		        }
    			}
    		}
		}
		return null;
    }
    // Request Header (cookie) 에서 refresh토큰 정보 추출
    private String resolveRefreshToken(HttpServletRequest request) {
    	Cookie[] list = request.getCookies();
    	String bearerToken = "";
    	if (list != null) {
    		for (Cookie cookie : list) {
    			if (cookie != null && cookie.getName().equals("RefreshToken")) {
    				bearerToken = cookie.getValue();
    				if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer")) {
    					// 쿠키 value에서 bearer 부분 제외한 token만 추출
    					return bearerToken.substring(6);
    				}
    			}
    		}
    	}
    	return null;
    }
}
