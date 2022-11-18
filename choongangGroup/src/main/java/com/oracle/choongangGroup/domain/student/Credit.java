package com.oracle.choongangGroup.domain.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.domain.Member;

import lombok.Data;

@Data
@Entity
@IdClass(CreditMemberPK.class)
public class Credit {
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid")
	private Member member;
	
	@Id
	@Column(name = "credit_id")
    private String creditId;
	
	@Column(name = "credit_bank")
	private String creditBank;
	
	@Column(name = "credit_date")
	private String creditDate;
	
	
}
