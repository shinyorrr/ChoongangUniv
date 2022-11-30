package com.oracle.choongangGroup.hj.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.hj.model.GradeVo;
import com.oracle.choongangGroup.sh.domain.Lecture;

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

		@Override
		public List<Lecture> findAll() {
			List<Lecture> yearList = null;
			try {
				yearList = session.selectList("hjYearSelect");
				System.out.println("EmpDaoImpl MemberDaoImpl name-> "+yearList );
				
				
			} catch (Exception e) {
				System.out.println("GradeDaolmpl gradeList Exception-> "+e.getMessage());
			}
			
			return yearList;
		}



	
}
