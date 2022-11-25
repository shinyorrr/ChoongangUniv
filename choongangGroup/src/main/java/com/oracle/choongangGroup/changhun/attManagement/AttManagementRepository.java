package com.oracle.choongangGroup.changhun.attManagement;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.changhun.JPA.Work;

public interface AttManagementRepository extends JpaRepository<Work, String>{

	Work findAllBy();

	List<Work> findByUseridAndWorkDate(String userid, String nowDate);

}
