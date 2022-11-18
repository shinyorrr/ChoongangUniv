package com.oracle.choongangGroup.domain.jpa.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.domain.Member;
import com.oracle.choongangGroup.domain.jpa.professor.Lecture;
import com.oracle.choongangGroup.domain.jpa.professor.LectureMemberPK;

import lombok.Data;

@Data
@Entity
@IdClass(LectureMemberPK.class)
public class ShoppingLike {
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lec_id")
	private Lecture lecture;
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid")
	private Member member;
	//private int lec_id;
	//private String mem_userid;
	
	@Column(name = "like_start")
	private String likeStart;
	
	@Column(name = "like_end")
	private String likeEnd;
}
