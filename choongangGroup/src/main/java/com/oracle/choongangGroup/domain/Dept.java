package com.oracle.choongangGroup.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Data;

@Data
@Entity
public class Dept {
	@Id
	private int deptno;
	@Column(length = 100)
	private String dname;

	@OneToMany(mappedBy = "dept")
	private List<Member> members =new ArrayList<>();
}
