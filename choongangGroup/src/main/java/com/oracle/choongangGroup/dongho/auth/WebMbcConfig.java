package com.oracle.choongangGroup.dongho.auth;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMbcConfig implements WebMvcConfigurer {
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//WebMvcConfigurer.super.addInterceptors(registry);
		registry.addInterceptor(new RsaInterceptor())
		.addPathPatterns("/", "/admin/createMemberForm", "/admin/updatePasswordForm");
	}
}
