package com.oracle.choongangGroup.sh.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Lecture {
	@Id
	@Column(name = "lec_id")
	private String id;
	
	@Column(name = "lec_name")
	private String name;
	
	@Column(name = "prof_name")
	private String prof;

	@Column(name = "lec_target_grade")
	private int grade;
	
	@Column(name = "lec_room")
	private String room;
	
	@Column(name = "lec_building")
	private String building;
	
	@Column(name = "lec_day1")
	private String day1; //강의요일
	
	@Column(name = "lec_day2") //강의요일
	private String day2;
	
	@Column(name = "lec_time1")
	private String time1;
	
	@Column(name = "lec_time2")
	private String time2;
	
	@Column(name = "lec_count_stud")
	private int studCount; //수강인원
	
	@Column(name = "lec_max_stud")
	private int maxStud; //강의정원
	
	@Column(name = "lec_status")
	private String status;
	
	@Column(name = "lec_max_count")
	private int maxCount; //강의시수
	
	@Column(name = "lec_type")
	private String type; //이수구분
	
	@Column(name = "lec_unit_score")
	private int unitScore; //강의학점
	
	@Column(name = "lec_file_path")
	private String filePath; //강의계획서 파일위치
	
	@Column(name = "lec_file_name")
	private String fileName; //강의계획서 문서이름
	
	@Column(name = "lec_year")
	private String year; //년도
	
	@Column(name = "lec_semester")
	private String semester; //학기
	
	@Column(name = "major_gubun")
	private String major; //과목구분
	
	@Column(name = "subject_gubun")
	private String subjectGubun; //전공구분
	
	
	
	
	
}
