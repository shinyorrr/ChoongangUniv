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
@NoArgsConstructor
public class Report {

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lec_id", nullable = false)
    private  Lecture lecture;

//    Lecture_MemberPK lectureMemberPK = new Lecture_MemberPK();
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mem_userid")
    private Member member;

    private String rep_sco;
    private String rep_file_name;
    private String rep_file_path;
    private String rep_submit_date;
    private String rep_deadline;
    private String rep_whether;
    private String rep_grade;
}
