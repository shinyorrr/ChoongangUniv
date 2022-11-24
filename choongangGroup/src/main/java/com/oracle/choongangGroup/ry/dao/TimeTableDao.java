package com.oracle.choongangGroup.ry.dao;

import java.util.List;

import com.oracle.choongangGroup.hj.model.MemberVo;
import com.oracle.choongangGroup.ry.model.TimeTableVo;

public interface TimeTableDao {

	MemberVo list(String userid);


	List<TimeTableVo> timeTableList();

}
