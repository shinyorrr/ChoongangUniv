package com.oracle.choongangGroup.domain.manager;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import com.oracle.choongangGroup.domain.Member;

import lombok.Data;

@Data
@Entity
@SequenceGenerator(
					name = "MAILFILE_SEQ_GEN",
					sequenceName = "MAILFILE_SEQ_GENERATOR",
					initialValue = 1,
					allocationSize = 1
				)
@IdClass(MailFilePk.class)
public class MailFile {

		@Id
		@GeneratedValue(strategy = GenerationType.SEQUENCE,
						generator = "MAILFILE_SEQ_GEN"
					)
		@Column(name = "mail_file_num")
		private MailFile mailFile;
		@Id
		@ManyToOne
		@JoinColumn(name = "mail_num")
		private Mail mail;
		@Id 
		@ManyToOne
		@JoinColumn(name = "userid")
		private Member member;
		@Column(name = "mail_file_name")
		private String mailFileName;
		@Column(name = "mail_file_Path")
		private String mailFilePath;
}
