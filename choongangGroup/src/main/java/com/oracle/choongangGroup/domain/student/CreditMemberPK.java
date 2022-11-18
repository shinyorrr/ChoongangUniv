package com.oracle.choongangGroup.domain.student;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@Getter
@NoArgsConstructor
@EqualsAndHashCode
public class CreditMemberPK implements Serializable {
	 private String creditId;
	 private String member;
}
