package com.oracle.choongangGroup.domain.student;

import javax.persistence.IdClass;

import com.oracle.choongangGroup.domain.Member;
import com.oracle.choongangGroup.domain.professor.Lecture;

import lombok.Data;

@Data

public class Review {
	private Lecture lecture;
	private Member  member;
	private Category category;
	private String score;
	private String review;
}
