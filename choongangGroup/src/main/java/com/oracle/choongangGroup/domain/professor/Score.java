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
    private Long midterm;
    
    @Column(name = "sco_final")
    private Long scoreFinal;
    
    @Column(name = "sco_report")
    private String scoreReport;
    
    @Column(name = "sco_attendance")
    private Long scoreAttendance;
    
    @Column(name = "rep_sco")
    private Long reportScore;
    
    @Column(name = "sco_status")
    private String scoreStatus;
}
