package com.oracle.choongangGroup.changhun.evaluation;

import java.util.List;

public interface EvaDao {

	List<EvaVo> evaList(String pname);

	List<EvaVo> profList(String pname);

	EvaVo total(String pname);

	List<EvaVo> reviewList(String pname);

	List<String> profNameList();

}
