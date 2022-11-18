package com.oracle.choongangGroup.domain.manager;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.domain.Member;

import lombok.Data;

@Data
@Entity
public class PhoneLike {
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	@Id
	private Member member;
	@Id
	@Column(name = "mem_favorite")
	private String favorite;
	

}
