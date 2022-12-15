package com.oracle.choongangGroup.sh.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.NamedEntityGraph;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.ToString;

@ToString(exclude = "applicationLec")
@NamedEntityGraph(name = "grade")
@Entity
@Data
@SequenceGenerator(name = "grade_sequence", //객체 seq
				   sequenceName = "grade_sequence",
				   initialValue = 1, 
				   allocationSize = 1)	
public class Grade {
	
	@Id
	@Column(name = "sco_id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,
					generator = "grade_sequence")
	private Long id;
	
	@OneToOne
	@JsonIgnore
	@JoinColumns({@JoinColumn(name  = "lec_id"),
				  @JoinColumn(name = "userid") })
	private ApplicationLec applicationLec; //강의코드
	
	@Column(name = "sco_repo")
	private Long report; //과제점수
	
	@Column(name = "sco_midterm")
	private Long midterm; //중간고사 점수
	
	@Column(name = "sco_final")
	private Long finals; //기말고사 점수 , final 안됨
		
	@Column(name = "sco_attendance")
	private Long attendance; //출석점수
	
//	@Column(name = "sco_status")
//	private Long status; //성적마감상태 -> 강의로 이동
	@Column(name = "sco_credits")
	private String credits; //종합성적 등급 : A,B,C
	
	@Column(name = "sco_total")
	private Double total; //종합성적  : 4.5 / 4.0 / 3.5
}