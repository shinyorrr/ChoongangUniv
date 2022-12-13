  package com.oracle.choongangGroup.changhun.JPA;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@IdClass(WorkPK.class)
@NoArgsConstructor
public class Work {
	
	@Id
	@Column(name = "work_date")
	private String workDate;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid" , insertable = false, updatable = false)
	private Member member; 
	
	@Id
	private String userid;
	
	private String attOnTime;
	private String attOffTime;
	private String totalTime;
	
	@Enumerated(EnumType.STRING)
	private WorkStatus attStatus;
	
	public Work(Member member) {
		this.member = member;
	}
	
}
