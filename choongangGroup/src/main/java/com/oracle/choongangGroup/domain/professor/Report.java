package com.oracle.choongangGroup.domain.professor;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.lang.reflect.Member;

@Entity
@Data
@Table(name = "report")
@IdClass(Lecture_MemberPK.class)
public class Report {

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lec_id", nullable = false)
    private  Lecture lecture;

//    Lecture_MemberPK lectureMemberPK = new Lecture_MemberPK();
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userid")
    private Member member;
    
    @Column(name = "rep_sco")
    private String score;
    
    @Column(name = "rep_file_name")
    private String fileName;
    
    @Column(name = "rep_file_path")
    private String filePath;
    
    @Column(name = "rep_submit_date")
    private String submitDate;
    
    @Column(name = "rep_deadline")
    private String deadline;
    
    @Column(name = "rep_whether")
    private String whether;
    
    @Column(name = "rep_grade")
    private String reportGrade;
}
