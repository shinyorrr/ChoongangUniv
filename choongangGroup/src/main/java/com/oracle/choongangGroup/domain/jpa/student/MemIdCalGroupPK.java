package com.oracle.choongangGroup.domain.jpa.student;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Getter
@NoArgsConstructor
@EqualsAndHashCode
public class MemIdCalGroupPK implements Serializable {
	private Long CalenderGroup;
	private String Member;
	
}
