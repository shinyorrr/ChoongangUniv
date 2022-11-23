package com.oracle.choongangGroup.hj.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.hj.model.GradeVo;
import com.oracle.choongangGroup.hj.model.MemberVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl implements MemberDao {

	
	private final SqlSession session;

	//아이디 받아와서 학적 조회 
	@Override
	public MemberVo detailList(String userid) {
		System.out.println("MemberDaoImpl detailEmp start. . . ");
		
		MemberVo member = new MemberVo();
		
		
		try {
			member = session.selectOne("hjMemberSelOne", userid);
			System.out.println("EmpDaoImpl MemberDaoImpl name-> "+member.getName());
			
			
		} catch (Exception e) {
			System.out.println("MemberDaoImpl detailList Exception-> "+e.getMessage());
		}
		
		
		
		
		
		return member;
		
		
		
	}

	//아이디 받아와서 원하는 몇개만 학적 수정
	@Override
	public int updateMember(MemberVo member) {
		System.out.println("MemberDaoImpl updateEmp start. . . ");
		int updateCount = 0;
		
		
		try {
			
			updateCount=session.update("hjMemberUpdate" ,member);
			System.out.println("MemberDaoImpl updateMember getEname-> "+member.getName());  
			
			
		} catch (Exception e) {
			System.out.println("MemberDaoImpl updateMember Exception-> "+e.getMessage());
		}
		
		
		
		
		return updateCount;
	}

	
	
}
