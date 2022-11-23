package com.oracle.choongangGroup.dongho.auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		Collection<? extends GrantedAuthority> roles = authentication.getAuthorities();
		String targetUrl = "";
		
		if (roles != null && roles.stream().anyMatch(a -> a.getAuthority().equals("ROLE_STUDENT"))) {
			//response.sendRedirect("/student/main");
			targetUrl = "/student/main";
		}
		else if (roles != null && roles.stream().anyMatch(a -> a.getAuthority().equals("ROLE_MANAGER"))) {
			//response.sendRedirect("/manager/main");
			targetUrl = "/manager/main";
		}
		else if (roles != null && roles.stream().anyMatch(a -> a.getAuthority().equals("ROLE_PROFESSOR"))) {
			//response.sendRedirect("/professor/main");
			targetUrl = "/professor/main";
		}
		else if (roles != null && roles.stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
			//response.sendRedirect("/admin/main");
			targetUrl = "/admin/main";
		}
		
		//session에 userid 저장
		String userid = (String) authentication.getPrincipal();
		System.out.println("successHandle userid -> " + userid);
		HttpSession session = request.getSession();
		session.setAttribute("userid", userid);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.append(targetUrl);
		out.close();
		
	}

}
