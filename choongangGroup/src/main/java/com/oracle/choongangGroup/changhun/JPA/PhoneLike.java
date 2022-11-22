package com.oracle.choongangGroup.changhun.JPA;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Entity
@IdClass(PhoneLikePK.class)
@Table(name = "phonelike")
public class PhoneLike{
	
	@Id
	private String userid;
	
	
	@Id
	@Column(name = "mem_favorite")
	private String memFavorite;
	
	@ManyToOne(fetch = FetchType.LAZY,
			cascade = CascadeType.ALL)
	@JoinColumn(name = "userid", insertable = false, updatable = false)
	private Member member;
	
	public static PhoneLike createLike(String userid ,Member member) {
		
		PhoneLike phoneLike = new PhoneLike();
		phoneLike.setUserid(userid);
		phoneLike.setMember(member);
		phoneLike.setMemFavorite(member.getUserid());
		
		return phoneLike;
	}
}
