package com.oracle.choongangGroup.yn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Grade;

public interface GradeRepository  extends JpaRepository<Grade, String>{

	Grade findByApplicationLec(ApplicationLec applicationLec);

	
}                             
