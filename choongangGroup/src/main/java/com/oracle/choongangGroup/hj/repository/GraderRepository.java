package com.oracle.choongangGroup.hj.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.sh.domain.Lecture;

public interface GraderRepository {

	//성적조회 할 과목 조회 jpa 
	List<Lecture> findAll();

}
