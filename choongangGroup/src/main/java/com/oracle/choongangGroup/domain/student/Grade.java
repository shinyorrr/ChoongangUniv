package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.domain.Member;
import com.oracle.choongangGroup.domain.professor.Lecture;
import com.oracle.choongangGroup.domain.professor.Lecture_MemberPK;

import lombok.Data;

@Data
@Entity
@IdClass(LectureMemberPK.class)
public class Grade {
	
	@Id
	@JoinColumn(name = "lecId")
	@ManyToOne(fetch = FetchType.LAZY)
	private Lecture lecture;
	
	@Id
	@JoinColumn(name = "userId")
	@ManyToOne(fetch = FetchType.LAZY)
	private Member member;
	
	private int sco_midterm;
	private int sco_final;
	private String sco_report;
	private int sco_attendance;
	private int rep_sco;
	private String sco_status;
	
}
