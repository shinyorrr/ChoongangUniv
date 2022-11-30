package com.oracle.choongangGroup.dongho.auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.RequiredArgsConstructor;
@Transactional
@RequiredArgsConstructor
public class CustomSuccessHandler implements AuthenticationSuccessHandler {
	private final SecurityService securityService;
	
	/**
	 *
	 */
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
		
		//session에 member정보 저장
		String userid = (String) authentication.getPrincipal();
		System.out.println("successHandle userid -> " + userid);
		Member member = securityService.findByUserid(userid);
		
		HttpSession session = request.getSession();
		session.setAttribute("userid", userid);
		
		session.setAttribute("name", member.getName());
		session.setAttribute("email", member.getEmail());
		session.setAttribute("role", member.getMemRole());
		switch (member.getMemRole()) {
		case "ROLE_STUDENT":
			session.setAttribute("major", member.getMajor());
			session.setAttribute("grade", member.getGrade());
			break;
		case "ROLE_PROFESSOR":
			session.setAttribute("major", member.getMajor());
			session.setAttribute("position", member.getPosition());
			break;
		case "ROLE_MANAGER":
			session.setAttribute("position", member.getPosition());
			session.setAttribute("dname", member.getDept().getDname());
			System.out.println(member.getDept().getDname());
			break;
		default:
			break;
		}
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.append(targetUrl);
		out.close();
		
	}
}
