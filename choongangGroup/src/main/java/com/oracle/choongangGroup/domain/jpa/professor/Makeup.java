package com.oracle.choongangGroup.domain.jpa.professor;

import javax.persistence.Column;
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
@IdClass(LectureMemberPK.class)
public class Makeup {
	//날짜?
//	@Id
//	private 
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lec_id")
	private Lecture lecture;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid")
	private Member  member;
	
	@Column(name = "mak_date")
	private String makDate;
	
	@Column(name = "mak_status")
	private String makStatus;
	
	@Column(name = "mak_time")
	private String makTime;
	
	@Column(name = "mak_cancle_date")
	private String makCancleDate;
	
	@Column(name = "mak_cancle_time")
	private String makCancleTime;
	
	@Column(name = "mak_lec_room")
	private String makLecRoom;
}
