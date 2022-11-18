package com.oracle.choongangGroup.domain.jpa.manager;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import com.oracle.choongangGroup.domain.Member;

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
	private int mailNum;
	@ManyToOne
	@JoinColumn(name = "userid")
	private Member member;
	@Column(name = "mail_title")
	private String mailTitle;
	@Column(name = "mail_content")
	private String mailContent;
	@Column(name = "mail_gubun")
	private String mailGubun;
	@Column(name = "mail_time")
	private String mailTime;
	@Column(name = "mail_status")
	private String mailStatus;

}
