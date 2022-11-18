package com.oracle.choongangGroup.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;

@Data
@Entity
public class Member {
	@Id
	private String mem_userid;
	private String mem_name;
	private String mem_password;
	private String mem_birth;
	private String mem_image;
	private String mem_phone;
	private String mem_subphone;
	private String mem_email;
	private String mem_address;
	private String mem_nation;
	private String mem_hiredate;
	private String mem_admission;
	private String mem_graduate;
	private String mem_position;
	private String mem_gender;
	private int    mem_grade;
	private String mem_major;
	private String mem_adm_type;
	private String mem_account;
	private String mem_bank;
	private String mem_extention;
	private String mem_lab;
	
	@ManyToOne
	@JoinColumn(name = "deptno")
	private int    deptno;
	
	private int    mem_role;
	private String mem_right;
}
