package com.oracle.choongangGroup.domain.jpa.manager;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Getter
@NoArgsConstructor
@EqualsAndHashCode
public class WorkPK implements Serializable {
	
	private String member;
	private String workDate;
	
}
