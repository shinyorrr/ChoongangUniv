package com.oracle.choongangGroup.yn.service;

import java.util.List;

import com.oracle.choongangGroup.yn.domain.Lec;



public interface LecService {

	List<Lec> lecCreateListAll();

	void apply(String lecId, String userid);

	List<Lec> lectureListAll();

	

}
