package com.oracle.choongangGroup.domain.professor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.domain.Member;

import lombok.Data;

@Data
@Entity
@IdClass(LectureMemberPK.class)
public class Attendance {
	@Id
	@Column(name = "att_date")
	private String attDate;
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lec_id")
	private Lecture lecture;
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid")
	private Member member;
	
	@Column(name = "att_score")
	private String attScore;
	@Column(name = "lec_order")
	private String lecOrder;
	@Column(name = "att_status")
	private String attStatus;
}
