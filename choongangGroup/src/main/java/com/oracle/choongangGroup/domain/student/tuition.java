package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.oracle.choongangGroup.domain.Member;

import lombok.Data;

@Entity
@Data
public class tuition {
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid")
	private Member member;
	private String file_dir;
	private String file_name;
	
	
	
}
