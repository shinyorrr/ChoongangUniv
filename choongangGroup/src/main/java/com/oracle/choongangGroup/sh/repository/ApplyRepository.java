package com.oracle.choongangGroup.sh.repository;

import java.util.List;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Lecture;


public interface ApplyRepository {
	
	List<Lecture> lectureListAll();

	Member 	memberFindOne(String userid);

	Lecture lectureFindOne(Long lecId);
	
	int 	apply(ApplicationLec applyLec);








}
