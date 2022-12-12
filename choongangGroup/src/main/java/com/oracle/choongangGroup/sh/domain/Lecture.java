package com.oracle.choongangGroup.sh.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.GeneratorType;

import lombok.Data;

@Entity
@Data
@SequenceGenerator(name = "lecture_sequence", //객체 seq
					sequenceName = "lecture_sequence",
					initialValue = 1,
					allocationSize = 1)	
public class Lecture {
	@Id
	@Column(name = "lec_id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,
								generator = "lecture_sequence")
	private Long id;
	
	@Column(name = "lec_name")
	private String name;
	
	@Column(name = "prof_name")
	private String prof;

	@Column(name = "lec_target_grade")
	private Long grade; //null 일때 Long으로 바꾸기
	
	@Column(name = "lec_room")
	private String room;
	
	@Column(name = "lec_building")
	private String building;
	
	@Column(name = "lec_day1")
	private String day1; //강의요일
	
	@Column(name = "lec_day2") //강의요일
	private String day2;
	
	@Column(name = "lec_time1")
	private String time1;	// 강의 수업교시 
	
	@Column(name = "lec_time2")
	private String time2;
	
	@Column(name = "lec_hour1")
	private String hour1;	// 강의 수업시간 

	@Column(name = "lec_hour2")
	private String hour2;
	
	@Column(name = "lec_count_stud")
	private Long studCount; //수강인원
	
	@Column(name = "lec_max_stud")
	private Long maxStud; //강의정원
	
	@Column(name = "lec_status")
	private String status; //강의상태 [승인 대기, 승인]
	
	@Column(name = "lec_max_count")
	private Long maxCount; //강의시수
	
	@Column(name = "lec_type")
	private String type; //이수구분, [전필,전선,교양]
	
	@Column(name = "lec_typecode")
	private String typeCode; //이수구분코드
	
	@Column(name = "lec_unit_score")
	private Long unitScore; //강의학점
	
	@Column(name = "lec_file_path")
	private String filePath; //강의계획서 파일위치
	
	@Column(name = "lec_file_name")
	private String fileName; //강의계획서 문서이름
	
	@Column(name = "lec_year")
	private String year; //년도
	
	@Column(name = "lec_semester")
	private String semester; //학기
	
	@Column(name = "major_gubun")
	private String major; //전공구분
	
	@Column(name = "lec_start")
	private String start; // 강의 시작일
	
	@Column(name = "lec_sco_status")
	private String scoreStatus; // 성적입력상태 미입력(기본):0 / 완료:1
	
}