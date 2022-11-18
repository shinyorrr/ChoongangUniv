package com.oracle.choongangGroup.domain.professor;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.lang.reflect.Member;

@Entity
@Data
@IdClass(LectureMemberPK.class)
public class Score {

    @Id
    @OneToMany
    @JoinColumn(name = "lec_id", nullable = false)
    private  Lecture lecture;

    //    Lecture_MemberPK lectureMemberPK = new Lecture_MemberPK();
    @Id
    @OneToMany
    @JoinColumn(name = "userid")
    private Member member;
    
    @Column(name = "sco_midterm")
    private Long scoMidterm;
    
    @Column(name = "sco_final")
    private Long scoFinal;
    
    @Column(name = "sco_report")
    private String scoReport;
    
    @Column(name = "sco_attendance")
    private Long scoAttendance;
    
    @Column(name = "rep_sco")
    private Long repScore;
    
    @Column(name = "sco_status")
    private String scoStatus;
}
