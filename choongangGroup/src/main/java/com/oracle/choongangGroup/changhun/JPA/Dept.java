package com.oracle.choongangGroup.changhun.JPA;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

@Data
@Entity
public class Dept {
	@Id
	private int deptno;

	private String dname;
	
	@Column(name = "up_deptno")
	private Long upDeptno;
	
	@JsonManagedReference
	@OneToMany(mappedBy = "dept")
	private List<Member> members = new ArrayList<>();
}