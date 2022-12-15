package com.oracle.choongangGroup.changhun.JPA;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class WorkPK implements Serializable{
	private String workDate;
	private String userid;
//	private Member member;
}
