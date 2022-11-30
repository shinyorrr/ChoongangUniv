package com.oracle.choongangGroup.changhun.attManagement;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.changhun.JPA.Work;
import com.oracle.choongangGroup.changhun.JPA.WorkPK;

public interface AttManagementRepository extends JpaRepository<Work, WorkPK>{

	Work findAllBy();

//	Page<Work> findByUserid(String userid, PageRequest pageRequest);

//	Page<Work> findPageByUserid(String userid, PageRequest of);

	List<Work> findByMember_UseridAndWorkDate(String userid, String nowDate);

	Page<Work> findPageByMember_Userid(String userid, PageRequest of);



}
