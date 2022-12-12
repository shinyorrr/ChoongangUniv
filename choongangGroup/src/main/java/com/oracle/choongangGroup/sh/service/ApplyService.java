package com.oracle.choongangGroup.sh.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.ApplyTime;
import com.oracle.choongangGroup.sh.domain.Lecture;


public interface ApplyService {

	
	int apply(Long lecId, String userid, Long gubun);	
	int register(ApplyTime applyTime);
	ApplyTime findTime(int year, int month, String select);
	Page<Lecture> lectureList(String year, String semester, Pageable pageable);
	Page<ApplicationLec> likeList(String userid, String year, String semester, Pageable pageable);
	Page<Lecture> findByName(String year, String semester, String lecName, Pageable pageable2);
	




	//List<ApplicationLec> likeListAll(String userid);

}
