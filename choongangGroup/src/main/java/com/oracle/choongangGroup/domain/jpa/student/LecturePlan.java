package com.oracle.choongangGroup.domain.jpa.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.oracle.choongangGroup.domain.jpa.professor.Lecture;

import lombok.Data;

@Entity
@Data
@Table
public class LecturePlan {
	
	@Id
	@OneToOne
	@JoinColumn(name = "lec_id")
	private Lecture lecture;
	
	@Column(name = "plan_goal")
	private String planGoal;
	
	@Column(name = "plan_way")
	private String planWay;
	
	@Column(name = "plan_book")
	private String planBook;
	
	@Column(name = "plan_midterm_ratio")
	private String planMidtermRatio;
	
	@Column(name = "plan_final_ratio")
	private String planFinalRatio;
	
	@Column(name = "plan_report_ratio")
	private String planReportRatio;
	
	@Column(name = "plan_attendance")
	private String planAttendance;
	
	@Column(name = "plan_eval_category1")
	private String planEvalCategory1;
	
	@Column(name = "plan_eval_category2")
	private String planEvalCategory2;
	
	@Column(name = "plan_eval_detail1")
	private String planEvalDetail1;
	
	@Column(name = "pan_eval_detail2")
	private String panEvalDetail2;
}
