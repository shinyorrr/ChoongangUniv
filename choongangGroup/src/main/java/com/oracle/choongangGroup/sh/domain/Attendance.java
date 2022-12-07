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
@Data
@IdClass(AttendLectureMember.class)
public class Attendance {
	
	@Id
	@Column(name = "att_date")
	private String date; //날짜
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY) 
	@JoinColumn(name = "userid")
	private Member member; //사용자코드
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lec_id")
	private Lecture lecture; //강의코드
		
	@Column(name = "att_status")
	private String status; //출석상태
	
	@Column(name = "att_score")
	private Long score; //출석점수
	
	@Column(name = "lec_order")
	private Long order; //해당강의 차수
	
}
