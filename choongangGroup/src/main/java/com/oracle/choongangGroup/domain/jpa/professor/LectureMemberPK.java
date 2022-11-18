package com.oracle.choongangGroup.domain.jpa.professor;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

import javax.persistence.Column;

import com.oracle.choongangGroup.domain.Member;

@EqualsAndHashCode
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor //기본생성자 생성
public class LectureMemberPK implements Serializable {
	private  Lecture  lecture;
    private  Member member;
}
