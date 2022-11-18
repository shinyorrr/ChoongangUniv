package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.domain.Member;
import com.oracle.choongangGroup.domain.professor.Lecture;

import lombok.Data;

@Data
@Entity
@IdClass(Application_LecturePk.class)
public class Application {
	@Id
	@ManyToOne
	@JoinColumn(name = "lec_id")
	private Lecture lecture;
	@Id
	@ManyToOne
	@JoinColumn(name = "userid")
	private Member member;
	private String regiser_start;
	private String register_end;

}
