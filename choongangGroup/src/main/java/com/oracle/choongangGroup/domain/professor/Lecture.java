package com.oracle.choongangGroup.domain.professor;

import javax.persistence.Column;
import javax.persistence.Entity;
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
	private Long    lec_id;
	@ManyToOne
	@JoinColumn(name = "mem_userid")
	private Member  member;
	@ManyToOne
	@JoinColumn(name = "subject_num")
	private Subject subject;
	
	private String  order;
	private String  lec_name;
	private int     lec_target_grade;
	private String  lec_room;
	private String  lec_building;
	private String  lec_day1;
	private String  lec_day2;
	private String  lec_time1;
	private String  lec_time2;
	private int     lec_count_stud;
	private int     lec_max_tud;
	private String  lec_status;
	private int     lec_max_count;
	private String  lec_type;
	private int     lec_unit_score;
	private String  lec_file_path;
	private String  lec_file_name;
	private String  lec_year;
	private String  lec_semester;
	private String  lec_start;
}
