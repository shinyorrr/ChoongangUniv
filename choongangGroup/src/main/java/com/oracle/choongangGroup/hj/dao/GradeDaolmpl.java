package com.oracle.choongangGroup.hj.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.hj.model.GradeVo;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class GradeDaolmpl implements GraderDao {
	private final SqlSession session;
	
	//성적조회 
		@Override
		public GradeVo gradeList(String userid) {
			System.out.println("MemberDaoImpl gradeList start. . . ");
			
			GradeVo grade = new GradeVo();
			try {
				grade = session.selectOne("hjGradeSelOne", userid);
				System.out.println("EmpDaoImpl MemberDaoImpl name-> "+grade );
				
				
			} catch (Exception e) {
				System.out.println("GradeDaolmpl gradeList Exception-> "+e.getMessage());
			}
			
			return null;
		}
	
}
