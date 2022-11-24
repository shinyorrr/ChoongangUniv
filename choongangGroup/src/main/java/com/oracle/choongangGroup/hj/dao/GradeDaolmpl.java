package com.oracle.choongangGroup.hj.dao;

import java.util.List;

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

		@Override
		public List<GradeVo> listScore(GradeVo grade) {
			 List<GradeVo> ListScore =  null;
			 System.out.println("GradeDaolmpl listScore Start . . .."); 
			try {
				
				 ListScore= session.selectList("hjListScoreAll", grade);
				 System.out.println("GradeDaolmpl listScore empList.size()->  "+ListScore.size()  );
				
			} catch (Exception e) {
				System.out.println("GradeDaolmpl listScore e.getMessage()->  "+e.getMessage()  );
			}
			 
		
			
			return ListScore;
		}
	
}
