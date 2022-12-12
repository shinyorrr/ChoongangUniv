package com.oracle.choongangGroup.hs.managerPage;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.changhun.JPA.Member;

public interface ManagerPageRepository extends JpaRepository<Member, String> {

	Member findByUserid(String userid);

	Page<Member> findByMemRole(String memRole, Pageable pageable);

	Member findByMemRoleAndUserid(String memRole, String userid);

}