package com.oracle.choongangGroup.ry.model;

import lombok.Data;

@Data
public class TimeTableVo {
	
	// lecture 조회용
	private long id;				// 강의코드
	private String name;			// 강의 이름
	private String room;			// 강의실
	private String building;		// 강의동
	private String day1;			// 강의요일1
	private String day2;			// 강의요일2
	private String time1;			// 강의시간1
	private String time2;			// 강의시간2
	private String unitScore;		// 강의학점
	private String subjectGubun;	// 전공 구분
	
	// member 조회용
	private String userid;			// 학번
	private String username;		// 이름
}
