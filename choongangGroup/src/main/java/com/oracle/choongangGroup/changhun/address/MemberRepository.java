package com.oracle.choongangGroup.changhun.address;






import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.MemberMapping;
import com.oracle.choongangGroup.changhun.JPA.PhoneLike;

public interface MemberRepository extends JpaRepository<Member, String>{

	Member findByUserid(String userid);

	Page<Member> findByNameContaining(String name, PageRequest of);

}
