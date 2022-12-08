package com.oracle.choongangGroup.hs.managerPage;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.changhun.JPA.Member;

public interface ManagerPageRepository extends JpaRepository<Member, String> {

	Member findByUserid(String userid);
	
}
