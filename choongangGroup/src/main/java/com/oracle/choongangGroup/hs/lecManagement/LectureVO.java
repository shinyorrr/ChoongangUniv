package com.oracle.choongangGroup.hs.lecManagement;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LectureVO {
	
	private Long   lec_id;
	private String lec_building;
	private String lec_day1;
	private String lec_day2;
	private String lec_file_name;
	private String lec_file_path;
	private Long   lec_target_grade;
	private String major_gubun;
	private Long   lec_max_count;
	private Long   lec_max_stud;
	private String lec_name;
	private String prof_name;
	private String lec_room;
	private String lec_semester;
	private String lec_status;
	private Long   lec_count_stud;
	private String lec_time1;
	private String lec_time2;
	private String lec_type;
	private String lec_typecode;
	private Long   lec_unit_score;
	private String lec_year;
	private String subject_gubun;
	
	// 조회용
	private String year;
	private String semester;
	private String keyword;
	private String status;
	private int start;
	private int end;
	
}
