package com.oracle.choongangGroup.changhun.JPA;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
public class Member {
	@Id
	private String userid;
	private String name;
	private String password;
	private String birth;
	private String image;
	private String phone;
	private String subphone;
	private String email;
	private String address;
	private String nation;
	private String hiredate;
	private String admission;
	private String graduate;
	private String position;
	private String gender;
	private int    grade;
	private String major;
	private String admType;
	private String account;
	private String bank;
	private String extention;
	private String lab;
	
	@JoinColumn(name = "deptno")
	@ManyToOne
	private Dept deptno;
	
	@Column(name = "mem_role")
	private int    memRole;
	
	@Column(name = "mem_right")
	private String memRight;
}
