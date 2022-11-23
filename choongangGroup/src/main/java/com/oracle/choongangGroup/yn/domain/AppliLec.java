package com.oracle.choongangGroup.yn.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.Data;

@Entity
@Data
@IdClass(LecMember.class)
public class AppliLec {

	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid")
	private Member member;
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lec_id")
	private Lec lecture;
	
	private int lec_gubun;
	private String register_start;
	private String register_end;
	
	//장바구니
//	public static ApplicationLec likeLec(Member member, Lecture lecture) {
//		ApplicationLec applyLec = new ApplicationLec();
//		applyLec.setMember(member);
//		applyLec.setLecture(lecture);
//		applyLec.setLec_gubun(1);
//		return applyLec;
//	}
	//강의개설
	public static AppliLec createLec(Member member, Lec lecture) {
		AppliLec applyLec = new AppliLec();
		applyLec.setMember(member);
		applyLec.setLecture(lecture);
		applyLec.setLec_gubun(3);
		return applyLec;
	}
	
}
