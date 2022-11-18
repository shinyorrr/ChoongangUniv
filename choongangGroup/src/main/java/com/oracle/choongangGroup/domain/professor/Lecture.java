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
	private Long    id;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid")
	private Member  member;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "subject_num")
	private Subject subjectNum;
	
	private String  order;
	
	@Column(name = "lec_name")
	private String  name;
	@Column(name = "lec_target_grade")
	private int     targetGrade;
	@Column(name = "lec_room")
	private String  room;
	@Column(name = "lec_building")
	private String  building;
	@Column(name = "lec_day1")
	private String  day1;
	@Column(name = "lec_day2")
	private String  day2;
	@Column(name = "lec_time1")
	private String  time1;
	@Column(name = "lec_time2")
	private String  time2;
	@Column(name = "lec_count_stud")
	private int     stud;
	@Column(name = "lec_max_stud")
	private int     maxStud;
	@Column(name = "lec_status")
	private String  status;
	@Column(name = "lec_max_count")
	private int     maxCount;
	@Column(name = "lec_type")
	private String  type;
	@Column(name = "lec_unit_score")
	private int     unitScore;
	@Column(name = "lec_file_path")
	private String  filePath;
	@Column(name = "lec_file_name")
	private String  fileName;
	@Column(name = "lec_year")
	private String  year;
	@Column(name = "lec_semester")
	private String  semester;
	@Column(name = "lec_start")
	private String  start;
}
