package com.oracle.choongangGroup.hj.dao;

import java.util.List;

import com.oracle.choongangGroup.hj.model.GradeVo;

public interface GraderDao {

	GradeVo gradeList(String userid);

	List<GradeVo> listScore(GradeVo grade);

}
