package com.oracle.choongangGroup.domain.professor;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@EqualsAndHashCode
@Getter
@AllArgsConstructor
@NoArgsConstructor //기본생성자 생성
public class Lecture_MemberPK implements Serializable {
    private  Long   lec_id;
    private  String mem_userId;
}
