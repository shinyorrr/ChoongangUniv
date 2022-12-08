package com.oracle.choongangGroup.changhun.attManagement;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.changhun.JPA.Work;
import com.oracle.choongangGroup.changhun.JPA.WorkPK;

public interface AttManagementRepository extends JpaRepository<Work, WorkPK>{

	Work findAllBy();
	
	List<Work> findByMember_UseridAndWorkDate(String userid, String nowDate);

	Page<Work> findPageByMember_Userid(String userid, PageRequest of);

	List<Work> findByMember_name(String name);

	List<Work> findByMember_nameAndWorkDateContaining(String name, String month);

	Page<Work> findPageByMember_UseridAndWorkDateContaining(String userid, String nowDate, PageRequest of);



}
