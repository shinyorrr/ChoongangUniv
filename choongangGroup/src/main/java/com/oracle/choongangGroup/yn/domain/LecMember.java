package com.oracle.choongangGroup.yn.domain;

import java.io.Serializable;

import javax.persistence.Id;

import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;


@SuppressWarnings("serial")
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class LecMember implements Serializable {
	private Member member;
	private Lec lecture;
}
