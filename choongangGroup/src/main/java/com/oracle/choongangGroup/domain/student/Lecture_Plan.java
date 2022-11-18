package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.oracle.choongangGroup.domain.professor.Lecture;

import lombok.Data;

@Entity
@Data
@Table
public class Lecture_Plan {
	
	@Id
	@OneToOne
	@JoinColumn(name = "lec_id")
	private Lecture lecture;
	
	private String plan_goal;
	private String plan_way;
	private String plan_book;
	private String plan_midterm_ratio;
	private String plan_final_ratio;
	private String plan_report_ratio;
	private String plan_attendance;
	private String plan_eval_category1;
	private String plan_eval_category2;
	private String plan_eval_detail1;
	private String pan_eval_detail2;
}
