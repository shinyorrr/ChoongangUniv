package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.oracle.choongangGroup.domain.professor.Lecture;

import lombok.Data;

@Entity
@Table
@Data
public class Subject {
	
	@Id
	@JoinColumn(name = "subject_num")
	@OneToOne
	private Lecture lecture;
	private String s_gubun;
	private String m_gubun;
}

