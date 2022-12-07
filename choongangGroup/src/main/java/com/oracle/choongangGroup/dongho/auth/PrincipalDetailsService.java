package com.oracle.choongangGroup.dongho.auth;

import javax.transaction.Transactional;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.dongho.auth.SecurityRepository;
import com.oracle.choongangGroup.changhun.JPA.Member;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class PrincipalDetailsService implements UserDetailsService {
	
	private final SecurityRepository securityRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("====loadUserByUsername start====");
		Member member = securityRepository.findByUserid(username);
		log.info("loadUserByUsername : {}", member.getUserid());
		if (member == null) {return (UserDetails) new UsernameNotFoundException("아이디를 찾을 수 없습니다. : " + username);} 
		else                {return new PrincipalDetails(member);}
	}
	
//	// 해당하는 User 의 데이터가 존재한다면 UserDetails 객체로 만들어서 리턴
//    private UserDetails createUserDetails(Member member) {
//        return User.builder()
//                .username(member.getUserid())
//                .password(passwordEncoder.encode(member.getPassword()))
//                .roles(member.getRoles().toArray(new String[0]))
//                .build();
//    }
}
