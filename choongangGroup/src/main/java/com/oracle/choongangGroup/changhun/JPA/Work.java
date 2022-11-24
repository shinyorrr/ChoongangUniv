package com.oracle.choongangGroup.changhun.JPA;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.DynamicUpdate;

import lombok.Data;

@Entity
@DynamicUpdate
@Data
@IdClass(WorkPK.class)
public class Work {
	
	@Id
	@Column(name = "work_date")
	private String workDate;
	
	@Id
	private String userid;
	
	@ManyToOne(fetch = FetchType.LAZY,
			   cascade = CascadeType.ALL)
	@JoinColumn(name = "userid", insertable = false, updatable = false)
	private Member member;
	private String attOnTime;
	private String attOffTime;
	private Long vacation;
	
	@Enumerated(EnumType.STRING)
	private WorkStatus attStatus;
	
}
