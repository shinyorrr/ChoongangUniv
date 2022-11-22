package com.oracle.choongangGroup.dongho.auth;

import com.oracle.choongangGroup.changhun.JPA.Member;

public interface SecurityService {
	void save(Member member);

	Object findByUserid(String userid);
	
}
