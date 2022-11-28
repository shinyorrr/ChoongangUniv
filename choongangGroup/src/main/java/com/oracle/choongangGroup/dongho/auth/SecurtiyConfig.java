package com.oracle.choongangGroup.dongho.auth;

import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.ServletListenerRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.session.HttpSessionEventPublisher;

import com.oracle.choongangGroup.dongho.auth.CustomAuthenticationProvider;
import com.oracle.choongangGroup.dongho.auth.CustomSuccessHandler;
import com.oracle.choongangGroup.dongho.auth.PrincipalDetailsService;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurtiyConfig {
	private final PrincipalDetailsService principalDetailsService;
	private final SecurityService securityService;
    private final JwtTokenProvider jwtTokenProvider;
    private final HttpServletResponse response;
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration)
            throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }
	
	@Bean
    public SessionRegistry sessionRegistry() {
        SessionRegistry sessionRegistry = new SessionRegistryImpl();
        return sessionRegistry;
    }
	@Bean
	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

		http.csrf().disable()
			.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
			.and()
			.authorizeRequests()
			.antMatchers("/student/**").hasRole("STUDENT")
			.antMatchers("/manager/**").hasRole("MANAGER")
			.antMatchers("/professor/**").hasRole("PROFESSOR")
			.antMatchers("/admin/**").permitAll()//.hasRole("ADMIN")
			.antMatchers("/members/login").permitAll()
            .antMatchers("/members/loginForm", "/members/createMemberForm", "/members/createMember").permitAll()
			.antMatchers("/anonymous/**").permitAll()
			.antMatchers("/repoTest", "/loginForm").permitAll()
			.antMatchers("/main").authenticated()
			.and()
			.addFilterBefore(new JwtAuthenticationFilter(jwtTokenProvider, securityService, response), UsernamePasswordAuthenticationFilter.class)

			//.and()
			.formLogin()
			.loginPage("/").permitAll()
			//.loginProcessingUrl("/login")
			.failureUrl("/loginFail")
			//.defaultSuccessUrl("/main").permitAll()
			//.usernameParameter("securedUsername")
			//.passwordParameter("securedPassword")
			//.successHandler(new CustomSuccessHandler(securityService))
			//.failureHandler(new CustomFailureHandler())
			
			.and()
			.logout()
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true)
			.deleteCookies("JSESSIONID", "RefreshToken", "AccessToken")
			.clearAuthentication(false)
			
			.and()
			.sessionManagement()
			.maximumSessions(1)
			.maxSessionsPreventsLogin(true)
			.expiredUrl("/")
			.sessionRegistry(sessionRegistry());
			
		http.authenticationProvider(new CustomAuthenticationProvider(principalDetailsService , passwordEncoder()));
			;
		return http.build();
			
	}
	@Bean
    public WebSecurityCustomizer webSecurityCustomizer(){
        return web -> {
            web.ignoring()
                    .antMatchers(
                            "/images/**",
                            "/js/**",
                            "/css/**"
                    );
        };
    }
	@Bean
	public ServletListenerRegistrationBean<HttpSessionEventPublisher> httpSessionEventPublisher() {
		return new ServletListenerRegistrationBean<HttpSessionEventPublisher>(new HttpSessionEventPublisher());
	}

}
