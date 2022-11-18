package com.oracle.choongangGroup.domain.jpa.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.oracle.choongangGroup.domain.jpa.professor.Lecture;

import lombok.Data;

@Entity
@Data
public class Subject {
	
	@Id
	@JoinColumn(name = "subject_num")
	private Lecture lecture;
	
	@Column(name = "s_gubun")
	private String sgubun;
	
	@Column(name = "m_gubun")
	private String mgubun;
}

