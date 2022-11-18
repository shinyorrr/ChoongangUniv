package com.oracle.choongangGroup.domain.manager;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Getter
@NoArgsConstructor
@EqualsAndHashCode
public class WorkId implements Serializable {
	
	private String attDate;
	private String member;
}
