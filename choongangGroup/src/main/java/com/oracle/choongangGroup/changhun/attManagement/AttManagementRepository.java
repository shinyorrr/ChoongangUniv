package com.oracle.choongangGroup.changhun.attManagement;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.changhun.JPA.Work;

public interface AttManagementRepository extends JpaRepository<Work, String>{

	Work findAllBy();

}
