package com.oracle.choongangGroup.hj.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.hj.dao.MemberDao;
import com.oracle.choongangGroup.hj.model.MemberVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberServiceImpl implements MemberService {

	private final MemberDao md ;
	//아이디 받아와서 학적 조회 
	@Override
	public MemberVo list(String userid) {
		System.out.println("MemberServiceImpl list start. . . ");
		MemberVo member = null;
		member = md.detailList(userid);
		
		
		return member;
	}
	@Override
	public int updateMember(MemberVo member  ) {
		System.out.println(" MemberServiceImpl updateMember Start . . . ");
		int updateMember =0;
		updateMember = md.updateMember(member );
		
		return updateMember;
	}


	

	
}
