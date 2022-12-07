package com.oracle.choongangGroup.sh.domain;

import java.io.Serializable;

import javax.persistence.Id;

import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;


@SuppressWarnings("serial")
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class LectureMember implements Serializable {
	private Member member;
	private Lecture lecture;
}
