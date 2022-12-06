package com.oracle.choongangGroup.hj.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.hj.model.EvaluationVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor

public class EvaluationDaolmpl implements EvaluationDao {
	
	private final SqlSession session;

	@Override
	public List<EvaluationVo> evaluationList(String userid) {
		System.out.println("evaluationList evaluationList start. . . ");
		
		List<EvaluationVo> evaluation = new ArrayList<EvaluationVo>(); //yj 수정
		
		try {
			System.out.println("userid2"+ userid);
			//evaluation = session.selectOne("hjevaluationSelOne",  userid); //yj 평가 단건아님
			evaluation = session.selectList("hjevaluationSelOne",  userid); // 쿼리도 수정함. 
			System.out.println("EvaluationDaolmpl evaluationList -->" +evaluation.toString()) ;
			
			
		} catch (Exception e) {
			System.out.println("EvaluationDaolmpl evaluationList Exception-> "+e.getMessage());
		}
		
		
		return evaluation;
	}

	@Override
	public List<EvaluationVo> findev(String userid) {
		System.out.println("evaluationList findev start. . . ");
		List<EvaluationVo> evList =  null;
		try {
			
			evList=session.selectList("hjevSelList", userid);
			System.out.println(" findev userid----->"+userid);
			System.out.println("EvaluationDaolmpl evList -->" +evList.toString() ) ;
			
		} catch (Exception e) {
			System.out.println("EvaluationDaolmpl evaluationList Exception-> "+e.getMessage());
		}
		
		
		
		return evList;
	}

	@Override
	public List<EvaluationVo> findcg(String userid) {
		System.out.println("evaluationList findcg start. . . ");
		List<EvaluationVo> cgList = null;

		try {
			cgList=session.selectList("hjcgSelList");
			
			System.out.println("EvaluationDaolmpl findcg -->" +cgList.toString()) ;
			System.out.println(" findcg userid----->"+userid);
			
		} catch (Exception e) {
			System.out.println("EvaluationDaolmpl findcg Exception-> "+e.getMessage());

		}
		
		return cgList;
	}

	@Override
	public int insertscore(EvaluationVo evaluation) {
		int result =0;
		
		try {
			result=session.insert("insertScore", evaluation);
			
			
		} catch (Exception e) {
			System.out.println("EvaluationDaolmpl insertscore Exception-> "+e.getMessage());

			
		}
		
		return result;
	}


}
