package com.oracle.choongangGroup.dongho.auth;

import java.util.Optional;

import com.oracle.choongangGroup.changhun.JPA.Member;

public interface SecurityService {
	void save(Member member);

	Member findByUserid(String userid);

	Member findByNameAndEmail(String searchId, String searchEmail);

	Optional<Member> findByUseridAndEmail(String userid, String email);
	
}
