package com.oracle.choongangGroup.sh.domain;


import javax.persistence.Column;
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
@IdClass(LectureMember.class) 
public class ApplicationLec { 

	@Id  
	@ManyToOne(fetch = FetchType.LAZY)  
	@JoinColumn(name = "userid") 
	private Member member; 
	
	@Id 
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lec_id")
	private Lecture lecture; 
	
	@Column(name = "lec_gubun")
	private int gubun; 
		
	
	public static ApplicationLec apply(Member member, Lecture lecture, int gubun) {
		ApplicationLec applyLec = new ApplicationLec();
		applyLec.setMember(member);
		applyLec.setLecture(lecture);
		applyLec.setGubun(gubun);
		return applyLec;
	}
	
}
