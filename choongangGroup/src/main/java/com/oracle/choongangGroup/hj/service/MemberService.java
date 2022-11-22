package com.oracle.choongangGroup.hj.service;

import com.oracle.choongangGroup.hj.model.MemberVo;

public interface MemberService {

	//아이디 받아와서 학적 조회 
	MemberVo list(String userid);

	int updateMember(MemberVo member );



	//학적수정


	

	

}
