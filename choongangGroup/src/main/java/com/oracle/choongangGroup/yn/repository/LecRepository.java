package com.oracle.choongangGroup.yn.repository;

import java.util.List;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.yn.domain.AppliLec;
import com.oracle.choongangGroup.yn.domain.Lec;


public interface LecRepository {
	
	List<Lec> lecListAll();

	Member memberFindOne(String userid);

	Lec lectureFindOne(String lecId);

	void apply(AppliLec applyLec);

}
