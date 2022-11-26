package com.oracle.choongangGroup.hj.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Member;
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

		//이름가져오기
	@Override
	public MemberVo infoList(String userid) {
		
		MemberVo memberinfo = new MemberVo();
		
		try {
			memberinfo = session.selectOne("hjMemberinfoSelOne", userid);
			System.out.println("EmpDaoImpl MemberDaoImpl name-> "+memberinfo.getName());
			
			
		} catch (Exception e) {
			System.out.println("MemberDaoImpl detailList Exception-> "+e.getMessage());
		}
		
		
		
		return memberinfo;
	}

	//이름가져오기
	@Override
	public MemberVo infoList2(String userid) {
	MemberVo memberinfo2 = new MemberVo();
		
		try {
			memberinfo2 = session.selectOne("hjMemberinfo2SelOne", userid);
			System.out.println("EmpDaoImpl MemberDaoImpl name-> "+memberinfo2.getName());
			
			
		} catch (Exception e) {
			System.out.println("MemberDaoImpl detailList Exception-> "+e.getMessage());
		}
		
		
		
		return memberinfo2;
	}

	
	
}
