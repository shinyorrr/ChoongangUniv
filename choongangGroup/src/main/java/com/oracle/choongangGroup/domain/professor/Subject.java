package com.oracle.choongangGroup.domain.professor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import lombok.Data;

@Entity
@Data
public class Subject {
	@Id
	@OneToMany
	@JoinColumn(name = "subject_num")
	private String subjectNum;
	@Column(name = "s_gubun")
	private String subjectGubun;
	@Column(name = "m_gubun")
	private String majorGubun;
}
