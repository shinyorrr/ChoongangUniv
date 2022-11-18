package com.oracle.choongangGroup.domain.professor;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.io.Serializable;

import javax.persistence.Column;

@EqualsAndHashCode
@Getter
@AllArgsConstructor
@NoArgsConstructor //기본생성자 생성
public class Lecture_MemberPK implements Serializable {
    @Column(name = "lec_id")
	private  Long   id;
    @Column(name = "userid")
    private  String userid;
}
