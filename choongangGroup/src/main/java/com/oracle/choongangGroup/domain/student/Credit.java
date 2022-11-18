package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import com.oracle.choongangGroup.domain.Member;

import lombok.Data;

@Data
@Entity
@IdClass(Credit_MemberPk.class)
public class Credit {
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	private Member member;
	
	@Id
    private String credit_id;
	private String credit_bank;
	private String credit_date;
	
	
}
