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

   //이름 가져오기
	MemberVo infoList(String userid);

	//년도학기별로 신청한 과목 성적 조회
	List<GradeVo> listgrade(String userid ,String lec_year, String lec_semester );

	//셀렉트바 학기년도 조회 
	List<GradeVo> findys(String userid);

	//학점 조회
	GradeVo sutotal(String userid);




	







		
	}


     



	

