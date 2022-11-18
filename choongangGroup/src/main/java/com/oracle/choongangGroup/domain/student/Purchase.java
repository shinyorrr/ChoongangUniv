package com.oracle.choongangGroup.domain.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.oracle.choongangGroup.domain.Member;
import com.oracle.choongangGroup.domain.professor.Lecture;
import com.oracle.choongangGroup.domain.professor.LectureMemberPK;

import lombok.Data;

@Data
@Entity
@IdClass(LectureMemberPK.class)
public class Purchase {
	
	@Id
	@ManyToOne
	@JoinColumn(name = "lec_id")
	private Lecture lecture;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "mem_userid")
	private Member member;
	
	@OneToOne
	@JoinColumn(name = "book_id")
	private Book book;
	
	private String deadline;
	private long amount;
	
	@Column(name = "purchase_status")
	private int purchaseStatus;
	
	
}
