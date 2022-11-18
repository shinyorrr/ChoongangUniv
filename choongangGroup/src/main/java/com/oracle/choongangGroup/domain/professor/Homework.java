package com.oracle.choongangGroup.domain.professor;

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
public class Homework {
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lec_id")
	private Lecture lecture;
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mem_userid")
	private Member member;
	
	@Column(name = "rep_sco")
	private String repSco;
	
	@Column(name = "rep_file_name")
	private String repFileName;
	
	@Column(name = "rep_file_path")
	private String repFilePath;
	
	@Column(name = "rep_submit_date")
	private String repSubmitDate;
	
	@Column(name = "rep_deadline")
	private String repDeadline;
	
	@Column(name = "rep_whether")
	private String repWhether;
	
	@Column(name = "rep_grade")
	private String repGrade;
}
