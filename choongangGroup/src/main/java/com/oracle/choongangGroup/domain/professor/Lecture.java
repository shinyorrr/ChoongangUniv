package com.oracle.choongangGroup.domain.professor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.oracle.choongangGroup.domain.Member;

import lombok.Data;

@Entity
@Data
@Table(name = "lecture")
@SequenceGenerator(name = "lecture_seq_gen",
					sequenceName = "lecture_seq_generator",
					initialValue = 1,
					allocationSize = 1)
public class Lecture {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,
					generator = "lecture_seq_gen")
	@Column(name = "lec_id")
	private Long    lecId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid")
	private Member  member;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "subject_num")
	private Subject subjectNum;
	
	private String  order;
	
	@Column(name = "lec_name")
	private String  lecName;
	
	@Column(name = "lec_target_grade")
	private int     lecTargetGrade;
	
	@Column(name = "lec_room")
	private String  lecRoom;
	
	@Column(name = "lec_building")
	private String  lecBuilding;
	
	@Column(name = "lec_day1")
	private String  lecDay1;
	
	@Column(name = "lec_day2")
	private String  lecDay2;
	
	@Column(name = "lec_time1")
	private String  lecTime1;
	
	@Column(name = "lec_time2")
	private String  lecTime2;
	
	@Column(name = "lec_count_stud")
	private int     lecCountStud;
	
	@Column(name = "lec_max_stud")
	private int     lecMaxStud;
	
	@Column(name = "lec_status")
	private String  lecStatus;
	
	@Column(name = "lec_max_count")
	private int     lecMaxCount;
	
	@Column(name = "lec_type")
	private String  lecType;
	
	@Column(name = "lec_unit_score")
	private int     lecUnitScore;
	
	@Column(name = "lec_file_path")
	private String  lecFilePath;
	
	@Column(name = "lec_file_name")
	private String  lecFileName;
	
	@Column(name = "lec_year")
	private String  lecYear;
	
	@Column(name = "lec_semester")
	private String  lecSemester;
	
	@Column(name = "lec_start")
	private String  lecStart;
}
