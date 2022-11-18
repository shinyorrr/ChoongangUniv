package com.oracle.choongangGroup.domain.professor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;

import com.oracle.choongangGroup.domain.Member;

import lombok.Data;

@Data
@Entity
@IdClass(Lecture_MemberPK.class)
public class Attendance {
	@Id
	private String att_date;
	
	@Id
	@JoinColumn
	private Lecture lecture;
	
	@Id
	@JoinColumn
	private Member member;
	
	private String att_score;
	private String lec_order;
	private String att_status;
}
