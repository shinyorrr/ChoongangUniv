package com.oracle.choongangGroup.domain.jpa.manager;

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

@Entity
@Data
@SequenceGenerator(
					name = "NOTICE_SEQ_GEN",
					sequenceName = "NOTICE_SEQ_GENERATOR",
					initialValue = 1,
					allocationSize = 1
				)
@IdClass(NoticePk.class)
public class Notice {

		@Id
		@GeneratedValue(
						 strategy = GenerationType.SEQUENCE,
						 generator = "NOTICE_SEQ_GEN"
				
					)
		@Column(name = "notice_num")
		private Notice notice;
		@Id
		@ManyToOne
		@JoinColumn(name = "userid")
		private Member member;

		
		@Column(name = "notice_title")
		private String noticeTitle;
		
		@Column(name = "notice_content")
		private String noticeContent;
		
		@Column(name = "notice_type")
		private String noticeType;
		
		@Column(name = "notice_date")
		private String noticeDate;
		
		
}
