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

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;

@Entity
@Data
@IdClass(WorkPK.class)
public class Work {
	
	@Id
	@Column(name = "work_date")
	private String workDate;
	
	@Id
	@ManyToOne
	@JoinColumn(name = "userid")
	private Member member; 
	
	private String attOnTime;
	private String attOffTime;
	private String totalTime;
	
	@Enumerated(EnumType.STRING)
	private WorkStatus attStatus;
	
}
