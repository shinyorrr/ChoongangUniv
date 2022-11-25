package com.oracle.choongangGroup.sh.service;

import java.util.List;


import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.sh.domain.Lecture;


public interface ApplyService {

	List<Lecture> lectureListAll();

	void apply(String lecId, String userid);
	

}
