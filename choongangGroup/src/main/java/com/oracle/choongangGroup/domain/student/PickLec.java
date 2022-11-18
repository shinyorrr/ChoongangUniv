package com.oracle.choongangGroup.domain.student;

import java.lang.reflect.Member;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.oracle.choongangGroup.domain.professor.Lecture;
import com.oracle.choongangGroup.domain.professor.Lecture_MemberPK;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@Table(name = "report")
@IdClass(Lecture_MemberPK.class)
@NoArgsConstructor
public class PickLec {
	
    @Id
    @JoinColumn(name = "lec_id", nullable = false)
    @ManyToOne
    private  Lecture lecture;

    @Id
    @JoinColumn(name = "userid")
    private Member member;

    private String att_status;
    private String lec_grade;
}

