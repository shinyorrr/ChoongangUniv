package com.oracle.choongangGroup.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.Data;

@Entity
@Data
@SequenceGenerator(
					name = "mail_seq_gen",
					sequenceName = "mail_seq_generator",
					initialValue = 1,
					allocationSize = 1
				)
public class Mail {
	
	@Id
	@GeneratedValue(
					strategy = GenerationType.SEQUENCE,
					generator = "mail_seq_gen"
				)
	private int mail_num;
	@ManyToOne
	@JoinColumn(name = "mem_userid")
	private Member member;
	private String mail_title;
	private String mail_content;
	private String mail_gubun;
	private String mail_time;
	private String mail_status;

}
