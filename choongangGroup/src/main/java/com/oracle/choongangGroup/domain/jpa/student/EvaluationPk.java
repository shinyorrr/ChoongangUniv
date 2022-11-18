package com.oracle.choongangGroup.domain.jpa.student;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class EvaluationPk implements Serializable {
	private Long lecture;
	private String member;
	private CategoryPK category;
}
