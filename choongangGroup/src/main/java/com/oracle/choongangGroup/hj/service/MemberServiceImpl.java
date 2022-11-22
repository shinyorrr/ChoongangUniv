package com.oracle.choongangGroup.hj.service;

import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.hj.dao.MemberDao;
import com.oracle.choongangGroup.hj.model.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberDao md = null;

	@Override
	public Member list(String mem_userid) {
		Member member = null;
		member = md.detailList(mem_userid);
		
		
		return member;
	}
	

	
}
