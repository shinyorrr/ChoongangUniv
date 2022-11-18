package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;

import com.oracle.choongangGroup.domain.Member;
import com.oracle.choongangGroup.domain.professor.Lecture;

import lombok.Data;

@Data
@Entity
@IdClass(EvaluationPk.class)
public class Evaluation {
	
	@Id
	@JoinColumn(name = "lec_id")
	private Lecture lecture;
	
	@Id
	@JoinColumn(name = "mem_userid")
	private Member member;
	
	@Id
	@JoinColumns({
				 @JoinColumn(name = "big_category"),
				 @JoinColumn(name = "small_category")
				})
	private Category category;
	
	private int score;
	private String review;
	
}
