package com.oracle.choongangGroup.changhun.JPA;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.oracle.choongangGroup.taewoo.domain.Notice;

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
	private Long    grade;
	private String major;
	private String admType;
	private String account;
	private String bank;
	private String extention;
	private String lab;
	private Long vacation; //연차
	private String subMajor; //부전공
	private String studStatus; //학적상태
	private String mainProf; //지도교수
	private Long count; //신청학점
	
	@JoinColumn(name = "deptno")
	@JsonBackReference
	@ManyToOne
	private Dept dept;
	
	@Column(name = "mem_role")
	private String memRole;
	
	@Column(name = "mem_right")
	private String memRight;
	
	private String refreshToken;
	}
	
