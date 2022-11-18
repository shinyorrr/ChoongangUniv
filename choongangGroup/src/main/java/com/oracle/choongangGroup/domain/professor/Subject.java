package com.oracle.choongangGroup.domain.professor;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Data;

@Entity
@Data
public class Subject {
	@Id
	@OneToMany(mappedBy = "subject")
	private String subject_num;
	private String s_gubun;
	private String m_gubun;
}
