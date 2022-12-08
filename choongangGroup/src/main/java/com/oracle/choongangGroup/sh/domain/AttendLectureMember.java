package com.oracle.choongangGroup.sh.domain;

import java.io.Serializable;

import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class AttendLectureMember implements Serializable {
	private String date;
	private Member member;
	private Lecture lecture;
}
