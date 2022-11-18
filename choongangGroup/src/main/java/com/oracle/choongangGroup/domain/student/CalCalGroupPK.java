package com.oracle.choongangGroup.domain.student;

import java.io.Serializable;


import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;


@Getter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class CalCalGroupPK implements Serializable {
	private Long calenderGroup;
	private String member;
}
