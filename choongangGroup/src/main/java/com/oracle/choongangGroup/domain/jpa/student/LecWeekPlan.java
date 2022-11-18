package com.oracle.choongangGroup.domain.jpa.student;

import javax.persistence.Column;
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
	private LecturePlan lecturePlan;
	
	@Id
	@Column(name = "week_order")
	private int weekOrder;
	
	private String weekDetail;
}
