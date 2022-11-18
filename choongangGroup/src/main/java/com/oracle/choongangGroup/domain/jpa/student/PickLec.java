package com.oracle.choongangGroup.domain.jpa.student;

import java.lang.reflect.Member;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.oracle.choongangGroup.domain.jpa.professor.Attendance;
import com.oracle.choongangGroup.domain.jpa.professor.Lecture;
import com.oracle.choongangGroup.domain.jpa.professor.LectureMemberPK;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@IdClass(LectureMemberPK.class)
@NoArgsConstructor
@Table
public class PickLec {
	
    @Id
    @JoinColumn(name = "lec_id", nullable = false)
    @ManyToOne(fetch = FetchType.LAZY)
    private  Lecture lecture;

    @Id
    @JoinColumn(name = "userid")
    @ManyToOne(fetch = FetchType.LAZY)
    private Member member;

    @JoinColumn(name="att_status")
    @OneToMany(mappedBy = "attStatus")
    private Attendance attendance;
    
    @JoinColumn(name = "lec_grade")
    @OneToOne(fetch = FetchType.LAZY)
    private Grade grade;
}

