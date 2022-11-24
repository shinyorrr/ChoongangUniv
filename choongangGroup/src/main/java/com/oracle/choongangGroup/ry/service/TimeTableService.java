package com.oracle.choongangGroup.ry.service;

import java.util.List;

import com.oracle.choongangGroup.hj.model.MemberVo;
import com.oracle.choongangGroup.ry.model.TimeTableVo;

public interface TimeTableService {

	MemberVo list(String userid);

	List<TimeTableVo> timeTableList();

}
