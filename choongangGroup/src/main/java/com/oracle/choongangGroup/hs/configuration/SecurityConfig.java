package com.oracle.choongangGroup.hs.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

//제일먼저 실행
@Configuration 			//Ioc 빈(Bean) 을 등록
@EnableWebSecurity //필터 체인 관리 시작 어노테이션
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true) //특정주소 접
public class SecurityConfig {
	@Bean			//비밀번호 암호화 
	public BCryptPasswordEncoder encodePwd() {
		
		return new BCryptPasswordEncoder();
	
	}
	//
	@Bean
	protected SecurityFilterChain securityFilterChain (HttpSecurity http) throws Exception {
		
		http.csrf().disable(); //가로채기 비활성화
		http.authorizeHttpRequests() //인가된 
				.anyRequest()  //어느누구나
				.permitAll();  //접근할수 있다 
		
		return http.build();
		
	}
	

}

