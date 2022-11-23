package com.oracle.choongangGroup.hj.dao;


import com.oracle.choongangGroup.hj.model.MemberVo;

public interface MemberDao {

	//아이디 받아와서 학적 조회 
	MemberVo detailList(String userid);

	//아이디 받아와서 원하는 몇개만 학적 수정
	int updateMember(MemberVo member);

	
  
	
	
}


