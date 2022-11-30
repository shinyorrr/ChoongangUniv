package com.oracle.choongangGroup.hj.dao;

import java.util.List;

import com.oracle.choongangGroup.hj.model.GradeVo;
import com.oracle.choongangGroup.sh.domain.Lecture;

public interface GraderDao {

	GradeVo gradeList(String userid);

	List<Lecture> findAll();







}
