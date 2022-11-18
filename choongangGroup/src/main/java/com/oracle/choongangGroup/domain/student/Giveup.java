package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table
@Data
public class Giveup {
	@Id
	private String dfile_name;
	private String dfile_path;
}
