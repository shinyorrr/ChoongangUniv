package com.oracle.choongangGroup.hj.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.hj.model.Member;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl implements MemberDao {

	
	private SqlSession Session;

	@Override
	public Member detailList(String mem_userid) {
		System.out.println("MemberDaoImpl detailEmp start. . . ");
		
		Member member = new Member();
		
		try {
			
	  
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		
		
		return member;
		
		
		
	}
	
}
