package com.oracle.choongangGroup.ry.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.hj.model.GradeVo;
import com.oracle.choongangGroup.hj.model.MemberVo;
import com.oracle.choongangGroup.ry.model.TimeTableVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class TimeTableDaoImpl implements TimeTableDao {
	private final SqlSession session;
	
	
	@Override
	public MemberVo list(String userid) {
		System.out.println("TimeTableDaoImpl MemberVo list start. . . ");
		MemberVo member = new MemberVo();
		
		try {
			member = session.selectOne("hjMemberSelOne", userid);
			System.out.println("TimeTableDaoImpl MemberVo userid-> "+member.getUserid());
		} catch (Exception e) {
			System.out.println("TimeTableDaoImpl list Exception-> "+e.getMessage());
		}
		return member;
	}
	
	
	@Override
	public List<TimeTableVo> timeTableList() {
		System.out.println("EmpDaoImpl listEmpDept Start...");
		List<TimeTableVo> timeTableList = null;
		try {
			timeTableList = session.selectList("rylistEmpDept");
			System.out.println("EmpDaoImpl listEmpDept listEmpDept.size() ->  " + timeTableList.size());
		} catch (Exception e) {
			System.out.println("EmpDaoImpl listEmpDept Exception e.getMessage() -> "+ e.getMessage());
		}
		return timeTableList;
	}



}
