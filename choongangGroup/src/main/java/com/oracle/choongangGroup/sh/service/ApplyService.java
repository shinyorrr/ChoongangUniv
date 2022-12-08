package com.oracle.choongangGroup.sh.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.ApplyTime;
import com.oracle.choongangGroup.sh.domain.Lecture;


public interface ApplyService {

	List<Lecture> 	lectureListAll();
	int 			apply(Long lecId, String userid, Long gubun);
	List<ApplicationLec> likeListAll(String userid);
	int register(ApplyTime applyTime);
	ApplyTime findTime(int year, int month, String select);
	Page<Lecture> pageList(Pageable pageable);
	




	

}
