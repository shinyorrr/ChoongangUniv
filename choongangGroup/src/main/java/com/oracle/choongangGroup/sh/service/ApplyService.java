package com.oracle.choongangGroup.sh.service;

import java.util.List;


import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Lecture;


public interface ApplyService {

	List<Lecture> 	lectureListAll();
	int 			apply(Long lecId, String userid, int gubun);
	List<ApplicationLec> applicationLecList(String userid, int gubun);

	





	

}
