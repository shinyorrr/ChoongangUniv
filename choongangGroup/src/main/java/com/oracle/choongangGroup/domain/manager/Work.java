package com.oracle.choongangGroup.domain.manager;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class Work {
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mem_userid")
	private String mem_userid;
	
	private String attOnTime;
	private String attoffTime;
	private String vacation;
	private String attDate;
	
	@Enumerated(EnumType.STRING)
	private AttendanceStatus status;
}
