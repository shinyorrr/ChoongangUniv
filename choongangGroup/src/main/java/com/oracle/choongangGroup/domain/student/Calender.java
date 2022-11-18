package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.domain.Member;

import lombok.Data;

@Entity
@Data
@IdClass(CalCalGroupPK.class)
public class Calender {

	@Id
	private Long cal_id;

	@JoinColumn(name="cal_group")
	@ManyToOne(fetch = FetchType.LAZY)
	@Id
	private CalenderGroup calendarGroup;

	@Id
	@JoinColumn(name="userid")
	@ManyToOne(fetch = FetchType.LAZY)
	private Member member;
}
