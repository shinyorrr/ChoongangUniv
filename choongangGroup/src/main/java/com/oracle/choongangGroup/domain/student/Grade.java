package com.oracle.choongangGroup.domain.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.domain.Member;
import com.oracle.choongangGroup.domain.professor.Lecture;
import com.oracle.choongangGroup.domain.professor.LectureMemberPK;

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
	
	@Column(name = "sco_midterm")
	private int scoMidterm;
	
	@Column(name = "sco_final")
	private int scoFinal;
	
	@Column(name = "sco_report")
	private String scoReport;
	
	@Column(name = "sco_attendance")
	private int scoAttendance;
	
	@Column(name = "rep_sco")
	private int repSco;
	
	@Column(name = "sco_status")
	private String scoStatus;
	
}
