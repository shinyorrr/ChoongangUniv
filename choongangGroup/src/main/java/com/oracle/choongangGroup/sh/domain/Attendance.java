package com.oracle.choongangGroup.sh.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedEntityGraph;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.Data;
import lombok.ToString;

@ToString(exclude = "applicationLec")
@Entity
@Data
@NamedEntityGraph(name = "attendance")
@SequenceGenerator(name = "attendance_sequence", //객체 seq
						   sequenceName = "attendance_sequence",
						   initialValue = 1, 
						   allocationSize = 1)	
public class Attendance {
	@Id
	@Column(name = "att_id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE,
							   generator = "attendance_sequence")
	private Long id;

	@Column(name = "att_date")
	private String date; //날짜
	
	@OneToOne
	@JoinColumns({@JoinColumn(name = "lec_id"),
				  @JoinColumn(name = "userid")})
	private ApplicationLec applicationLec; //강의코드
		
	@Column(name = "att_status")
	private String status; //출석상태
	
	@Column(name = "att_score")
	private Long score; //출석점수
	
	@Column(name = "lec_order")
	private Long order; //해당강의 차수
	
}
