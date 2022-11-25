package com.oracle.choongangGroup.dongho.auth;

import javax.transaction.Transactional;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.dongho.auth.SecurityRepository;
import com.oracle.choongangGroup.changhun.JPA.Member;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class PrincipalDetailsService implements UserDetailsService {
	
	private final SecurityRepository securityRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("loadUserByUsername start ");
		Member member = securityRepository.findByUserid(username);
		if (member == null) {return (UserDetails) new UsernameNotFoundException("아이디를 찾을 수 없습니다. : " + username);} 
		else                {return new PrincipalDetails(member);}
	}
	
}
