package com.oracle.choongangGroup.dongho.auth;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class WebMbcConfig implements WebMvcConfigurer {
	private final SecurityService securityService;
	//private final Authentication authentication;
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//WebMvcConfigurer.super.addInterceptors(registry);
		registry.addInterceptor(new RsaInterceptor())
				.addPathPatterns("/", "/admin/createMemberForm", "/admin/updatePasswordForm");
		registry.addInterceptor(new LoginSuccessHandler(securityService))
				.addPathPatterns("/login");
	}
}
