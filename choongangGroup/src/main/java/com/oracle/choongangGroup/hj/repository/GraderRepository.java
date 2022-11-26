package com.oracle.choongangGroup.hj.repository;

import java.util.List;
import java.util.Set;

import com.oracle.choongangGroup.sh.domain.Grade;
import com.oracle.choongangGroup.sh.domain.Lecture;

public interface GraderRepository {

	//성적조회 할 과목 조회 jpa 
	List<Lecture> findAll();



	List<String> findYear();



	List<String> findsemester();







}
