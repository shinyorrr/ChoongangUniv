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
@IdClass(WorkId.class)
public class Work {
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "userId")
	private Member member;
	
	@Id
	@Column(name = "att_date")
	private String attDate;
	
	@Column(name = "att_on_date")
	private String attOnTime;
	
	@Column(name = "att_off_date")
	private String attoffTime;
	private String vacation;
	
	@Enumerated(EnumType.STRING)
	private AttendanceStatus status;
}
