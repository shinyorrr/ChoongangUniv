package com.oracle.choongangGroup.sh.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.Data;

@Entity
@IdClass(LectureMember.class)
@Data
public class Grade {
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY) 
	@JoinColumn(name = "userid")
	private Member member;
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lec_id")
	private Lecture lecture;
	
	@Column(name = "sco_repo")
	private Long report; //과제점수
	
	@Column(name = "sco_midterm")
	private Long midterm; //중간고사 점수
	
	@Column(name = "sco_final")
	private Long finals; //기말고사 점수 , final 안됨
		
	@Column(name = "sco_attendance")
	private Long attendance; //출석점수
	
	@Column(name = "sco_status")
	private Long status; //성적마감상태
	
	@Column(name = "sco_total")
	private Long total; //종합성적
	
	

}
