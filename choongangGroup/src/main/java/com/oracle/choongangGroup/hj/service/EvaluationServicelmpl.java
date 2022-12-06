package com.oracle.choongangGroup.hj.service;

import java.util.ArrayList;
import java.util.List;

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
	public List<EvaluationVo> list(String userid) {
		System.out.println("EvaluationServicelmpl list start. . . ");
		List<EvaluationVo> evaluation = null;
		evaluation = ed.evaluationList(userid);

		return evaluation;
	}

	@Override
	public List<EvaluationVo> findev(String userid) {
		System.out.println("EvaluationServicelmpl findev start. . . ");
		List<EvaluationVo> evList = null;

		evList = ed.findev(userid);

		return evList;
	}

	@Override
	public List<EvaluationVo> findcg(String userid) {
		System.out.println("EvaluationServicelmpl findcg start. . . ");
		List<EvaluationVo> cgList = null;
		cgList = ed.findcg(userid);
		
		/* 평가항목 세팅 */
		List <EvaluationVo> rsList = new ArrayList<EvaluationVo>();
		
		for (EvaluationVo newCg : cgList) {
			System.out.println("newCg 시작함.");
			System.out.println("newCg===---------" + newCg);
	
			EvaluationVo rs = null;

			String big = newCg.getBig_category();
			String small = newCg.getSmall_category();
			String content = newCg.getCategory_content();

			if (!small.equals("99")){
				rs = new EvaluationVo(); // 새롭게 만들 배열
				if (big.equals("10")) {
					rs.setGubun("수업내용");
					rs.setText(content);
					rs.setBig_category(big);
					rs.setSmall_category(small);
				} else if (big.equals("20")) {
					rs.setGubun("수업방법");
					rs.setText(content);
					rs.setBig_category(big);
					rs.setSmall_category(small);
				} else if (big.equals("30")) {
					rs.setGubun("수업유형");
					rs.setText(content);
					rs.setBig_category(big);
					rs.setSmall_category(small);
				}
				rsList.add(rs);
			}
		}
		return rsList;
	}

	@Override
	public int insertscore(EvaluationVo evaluation) {
		int result = 0;
		result = ed.insertscore(evaluation);
		System.out.println("result ->" + result);

		return result;
	}

}
