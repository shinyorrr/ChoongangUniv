package com.oracle.choongangGroup.dongho.auth;

import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.dongho.auth.SecurityRepository;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class SecurityServiceImpl implements SecurityService {
	private final SecurityRepository securityRepository;
	
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
