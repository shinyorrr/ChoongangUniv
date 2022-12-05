package com.oracle.choongangGroup.sh.domain;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedEntityGraph;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonIgnoreType;
import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.Data;
@Entity  
@Data 
@IdClass(LectureMember.class)
@JsonIgnoreType
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
	private Long gubun; 
	
	@OneToOne(mappedBy = "applicationLec")
	private Report report;
	
	public ApplicationLec() {}
	
	public static ApplicationLec apply(Member member, Lecture lecture, Long gubun) {
		ApplicationLec applyLec = new ApplicationLec();
		applyLec.setMember(member);
		applyLec.setLecture(lecture);
		applyLec.setGubun(gubun);
		return applyLec;
	}
	
}
