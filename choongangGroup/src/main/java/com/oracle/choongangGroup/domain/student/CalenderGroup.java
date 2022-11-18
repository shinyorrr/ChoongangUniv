package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class CalenderGroup {
	@Id
	private int cal_group;
	private String cal_g_name;
	private String cal_g_color;
}
