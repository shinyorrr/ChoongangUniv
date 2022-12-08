package com.oracle.choongangGroup.hj.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.hj.model.EvaluationVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor

public class EvaluationDaolmpl implements EvaluationDao {
	
	private final SqlSession session;

	@Override
	public EvaluationVo evaluationList(String userid) {
		System.out.println("EvaluationDaolmpl evaluationList start. . . ");
		EvaluationVo evaluation = new EvaluationVo();
		
		try {
			evaluation = session.selectOne("hjevaluationSelOne",  userid);
			System.out.println("EvaluationDaolmpl evaluationList -->" +evaluation.toString()) ;
			
			
		} catch (Exception e) {
			System.out.println("EvaluationDaolmpl evaluationList Exception-> "+e.getMessage());
		}
		
		
		return evaluation;
	}

}
