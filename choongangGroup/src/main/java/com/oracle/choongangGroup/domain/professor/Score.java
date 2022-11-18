package com.oracle.choongangGroup.domain.professor;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.lang.reflect.Member;

@Entity
@Data
@IdClass(Lecture_MemberPK.class)
@NoArgsConstructor
public class Score {

    @Id
    @OneToMany
    @JoinColumn(name = "lec_id", nullable = false)
    private  Lecture lecture;

    //    Lecture_MemberPK lectureMemberPK = new Lecture_MemberPK();
    @Id
    @OneToMany
    @JoinColumn(name = "mem_userid")
    private Member member;

    private Long sco_midterm;
    private Long sco_final;
    private String sco_report;
    private Long sco_attendance;
    private Long rep_sco;
    private String  sco_status;
}
