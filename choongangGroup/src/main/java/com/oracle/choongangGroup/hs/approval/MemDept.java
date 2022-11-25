package com.oracle.choongangGroup.hs.approval;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemDept {
	// Member
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
	private int deptno;
	private String mem_role;
	private String mem_right;
	
	// dept
	private String dname;
	private int up_deptno;
}
