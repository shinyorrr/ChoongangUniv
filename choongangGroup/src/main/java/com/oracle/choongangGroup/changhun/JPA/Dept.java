package com.oracle.choongangGroup.changhun.JPA;

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

	private String dname;
	
	@Column(name = "up_deptno")
	private int upDeptno;
	
	@OneToMany(mappedBy = "deptno")
	private List<Member> members = new ArrayList<>();
}