package com.oracle.choongangGroup.hj.service;

import java.util.List;
import java.util.Set;

import com.oracle.choongangGroup.hj.model.GradeVo;
import com.oracle.choongangGroup.hj.model.MemberVo;
import com.oracle.choongangGroup.sh.domain.Grade;
import com.oracle.choongangGroup.sh.domain.Lecture;

public interface MemberService {

	//아이디 받아와서 학적 조회 
	MemberVo list(String userid);

	//학적수정
	int updateMember(MemberVo member );
 
	//성적조회페이지
	GradeVo gradeList(String userid);

	//성적조회 할 과목 조회 jpa 

	List<Lecture> findgrades();

	MemberVo infoList(String userid);


	List<String> findYear();

	List<String> findsemester();

	MemberVo infoList2(String userid);





		
	}


     



	

