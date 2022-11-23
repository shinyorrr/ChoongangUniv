package com.oracle.choongangGroup.hj.service;

import com.oracle.choongangGroup.hj.model.GradeVo;
import com.oracle.choongangGroup.hj.model.MemberVo;

public interface MemberService {

	//아이디 받아와서 학적 조회 
	MemberVo list(String userid);

	//학적수정
	int updateMember(MemberVo member );

	GradeVo gradeList(String userid);






	

	

}
