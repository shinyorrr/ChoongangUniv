package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.domain.Member;
import com.oracle.choongangGroup.domain.professor.Lecture;

import lombok.Data;

@Data
@Entity
@IdClass(Application_LecturePk.class)
public class ShoppingLike {
	
	@Id
	@ManyToOne
	@JoinColumn(name = "lec_id")
	private Lecture lecture;
	@Id
	@ManyToOne
	@JoinColumn(name = "mem_userid")
	private Member member;
	//private int lec_id;
	//private String mem_userid;
	private String like_start;
	private String like_end;
}
