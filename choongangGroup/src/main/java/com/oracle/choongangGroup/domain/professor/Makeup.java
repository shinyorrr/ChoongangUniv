package com.oracle.choongangGroup.domain.professor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;

import com.oracle.choongangGroup.domain.Member;

import lombok.Data;


@Entity
@Data
@IdClass(Lecture_MemberPK.class)
public class Makeup {
	//날짜?
//	@Id
//	private 
	
	@Id
	@JoinColumn(name = "lec_id")
	private Lecture lecture;
	
	@JoinColumn(name = "mem_userid")
	private Member  member;
	
	private String mak_date;
	private String mak_status;
	private String mak_time;
	private String mak_cancle_date;
	private String mak_cancle_time;
	private String mak_lec_room;
}
