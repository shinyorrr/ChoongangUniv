package com.oracle.choongangGroup.changhun.address;


import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.changhun.JPA.Member;

public interface MemberRepository extends JpaRepository<Member, String>{

	Member findByUserid(String userid);

}
