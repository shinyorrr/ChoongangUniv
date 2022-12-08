package com.oracle.choongangGroup.hj.service;

import java.util.List;

import com.oracle.choongangGroup.hj.model.EvaluationVo;

public interface EvaluationService {

	List<EvaluationVo> list(String userid);

	List<EvaluationVo> findev(String userid);

	List<EvaluationVo> findcg(String userid);


	int insertscore(List<EvaluationVo> scoreList);


	
}
