package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@IdClass(LecIdWeekOrderPK.class)
@Data
@Table
public class LecWeekPlan {
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lec_id")
	private LecturePlan lecture_Plan;
	
	@Id
	private int wee_order;
	
	private String wee_detail;
}
