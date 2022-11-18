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
@IdClass(Lec_id_wee_orderPK.class)
@Data
@Table
public class Lec_week_Plan {
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lec_id")
	private Lecture_Plan lecture_Plan;
	
	@Id
	private int wee_order;
	
	private String wee_detail;
}
