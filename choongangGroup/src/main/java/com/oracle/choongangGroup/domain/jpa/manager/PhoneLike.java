package com.oracle.choongangGroup.domain.jpa.manager;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import com.oracle.choongangGroup.domain.Member;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
@IdClass(PhoneLikePK.class)
public class PhoneLike {
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid")
	private Member member;
	
	@Id
	@Column(name = "favorite_user")
	private String favoriteUser;
}
