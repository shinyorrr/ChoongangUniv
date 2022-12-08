package com.oracle.choongangGroup.hj.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.hj.dao.EvaluationDao;
import com.oracle.choongangGroup.hj.model.EvaluationVo;

import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
@Transactional
public class EvaluationServicelmpl implements EvaluationService {

	private final EvaluationDao ed;

	@Override
	public EvaluationVo list(String userid) {
		System.out.println("EvaluationServicelmpl list start. . . ");
		EvaluationVo evaluation =  null;
		evaluation = ed.evaluationList(userid);
		
		return evaluation;
	}
	
}
