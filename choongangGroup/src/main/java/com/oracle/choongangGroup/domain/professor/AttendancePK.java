package com.oracle.choongangGroup.domain.professor;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@EqualsAndHashCode
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AttendancePK implements Serializable {
	private String attDate;
	private Long lecture;
	private String member;
	
}
