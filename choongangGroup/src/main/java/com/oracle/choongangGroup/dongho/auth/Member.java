//package com.oracle.choongangGroup.dongho.auth;
//
//import java.sql.Timestamp;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.SequenceGenerator;
//import javax.persistence.Table;
//
//import org.hibernate.annotations.CreationTimestamp;
//
//import com.oracle.choongangGroup.changhun.JPA.Dept;
//
//import lombok.Data;
//
//@Entity
//@Data
//@Table(name = "member")
//public class Member {
//	@Id
//	@Column(name = "userid")
//	private String username;
//	@Column(name = "password")
//	private String password;
//	@Column(name = "mem_name")
//	private String memName;
//	@Column(name = "mem_birth")
//	private String memBirth;
//	@Column(name = "mem_image")
//	private String memImage;
//	@Column(name = "mem_phone")
//	private String memPhone;
//	@Column(name = "mem_subphone")
//	private String memSubphone;
//	@Column(name = "mem_email")
//	private String memEmail;
//	@Column(name = "mem_adress")
//	private String memAdress;
//	@Column(name = "mem_nation")
//	private String memNation;
//	@Column(name = "mem_hiredate")
//	private String memHiredate;
//	@Column(name = "mem_admission")
//	private String memAdmission;
//	@Column(name = "mem_graduate")
//	private String memGraduate;
//	@Column(name = "mem_position")
//	private String memPosition;
//	@Column(name = "mem_gender")
//	private String memGender;
//	@Column(name = "mem_grade")
//	private int memGrade;
//	@Column(name = "mem_major")
//	private String memMajor;
//	@Column(name = "mem_adm_type")
//	private String memAdmType;
//	@Column(name = "mem_account")
//	private String memAccount;
//	@Column(name = "mem_bank")
//	private String memBank;
//	@Column(name = "mem_extention")
//	private String memExtention;
//	@Column(name = "mem_lab")
//	private String memLab;
//	@JoinColumn(name = "deptno")
//	@ManyToOne
//	private Dept deptno;
//	@Column(name = "mem_role")
//	private String role;
//}
