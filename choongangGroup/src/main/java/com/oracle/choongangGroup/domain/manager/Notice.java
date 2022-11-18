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
		@JoinColumn(name = "mem_userid")
		private Member member;
		private String notice_title;
		private String notice_content;
		private String notice_type;
		private String notice_date;
		
		
}
