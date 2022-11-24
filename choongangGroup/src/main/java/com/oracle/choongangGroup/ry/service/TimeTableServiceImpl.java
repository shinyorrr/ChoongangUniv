package com.oracle.choongangGroup.ry.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.hj.dao.MemberDao;
import com.oracle.choongangGroup.hj.model.MemberVo;
import com.oracle.choongangGroup.ry.dao.TimeTableDao;
import com.oracle.choongangGroup.ry.model.TimeTableVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class TimeTableServiceImpl implements TimeTableService {
	
	private final MemberDao md;
	private final TimeTableDao ttd;
	
	
	@Override
	public MemberVo list(String userid) {
		System.out.println("TimeTableServiceImpl list start. . . ");
		MemberVo member = null;
		member = md.detailList(userid);
		
		return member;
	}


	@Override
	public List<TimeTableVo> timeTableList() {
		System.out.println("TimeTableServiceImpl timeTableList start");
		List<TimeTableVo> timeTable = null;
		timeTable = ttd.timeTableList();
		
		return timeTable;
	}

}
