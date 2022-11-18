package com.oracle.choongangGroup.domain.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table
@Data
public class Giveup {
	
	@Id
	@Column(name = "dfile_name")
	private String dfileName;
	
	@Column(name = "dfile_path")
	private String dfilePath;
}
