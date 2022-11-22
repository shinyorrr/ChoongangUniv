package com.oracle.choongangGroup.dongho.auth;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Member;

@Repository
public interface SecurityRepository extends JpaRepository<Member, String> {

	Member findByUserid(String username);

}
