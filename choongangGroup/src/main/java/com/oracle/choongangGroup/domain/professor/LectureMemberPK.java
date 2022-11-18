package com.oracle.choongangGroup.domain.professor;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

import javax.persistence.Column;

@EqualsAndHashCode
@Getter
@AllArgsConstructor
@NoArgsConstructor //기본생성자 생성
public class LectureMemberPK implements Serializable {
	private  Long   lecture;
    private  String member;
}
