package com.oracle.choongangGroup.domain.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class CalenderGroup {
	
	@Id
	@Column(name = "cal_group")
	private int calGroup;
	
	@Column(name = "cal_g_name")
	private String calGname;
	
	@Column(name = "cal_g_color")
	private String calGcolor;
}
   