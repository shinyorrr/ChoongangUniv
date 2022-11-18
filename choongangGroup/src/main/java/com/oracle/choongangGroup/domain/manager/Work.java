package com.oracle.choongangGroup.domain.manager;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.domain.Member;

import lombok.Data;

@Entity
@Data
@IdClass(WorkPK.class)
public class Work {
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userid")
	private Member member;
	
	@Id
	@Column(name = "work_date")
	private String workDate;
	
	@Column(name = "work_on_date")
	private String workOnTime;
	
	@Column(name = "work_off_date")
	private String workOffTime;
	private String vacation;
	
	@Enumerated(EnumType.STRING)
	private WorkStatus status;
}
