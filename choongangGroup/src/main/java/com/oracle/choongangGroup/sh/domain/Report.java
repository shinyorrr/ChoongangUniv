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
public class Report {
	@Id
	@ManyToOne(fetch = FetchType.LAZY) 
	@JoinColumn(name = "userid")
	private Member member; //사용자코드
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lec_id")
	private Lecture lecture; //강의코드
	
	@Column(name = "rep_file_name")
	private String fileName; //파일명
	
	@Column(name = "rep_file_path")
	private String filePath; //파일위치
	
	@Column(name = "rep_submit_date")
	private String submitDate; //제출일
	
	@Column(name = "rep_deadline")
	private String deadline; //마감기간
	
	@Column(name = "rep_whether")
	private String whether; //제출여부
	
	@Column(name = "rep_score")
	private String score; //과제점수
	
	@Column(name = "rep_grade")
	private String grade; //등급
}
