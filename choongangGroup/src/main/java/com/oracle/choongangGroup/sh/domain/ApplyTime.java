package com.oracle.choongangGroup.sh.domain;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;

import org.springframework.util.Assert;

import lombok.Builder;
import lombok.Data;

@Data
@Entity
public class ApplyTime {

	@Id
	@GeneratedValue
	@Column(name = "apply_id")
	private Long id;
	
	@Column(name = "apply_year") @NotEmpty
	private String year; //수강신청 년도
	
	@Column(name = "apply_start") @NotEmpty
	private String start; //시작일
	
	@Column(name = "apply_end") @NotEmpty
	private String end; // 마감일
	
	@Column(name = "apply_semester") @NotEmpty
	private String semester; //수강신청 학기
	
	@Column(name = "apply_select") @NotEmpty
	private String select; //장바구니,수강신청  구분

	//안전한 객체 생성
	@Builder
	public ApplyTime(String select, String year, String semester, String start, String end) {
		//null값 방지
		Assert.hasText(select, "select must not be empty");
		Assert.hasText(year, "year must not be empty");	
		Assert.hasText(semester, "semester must not be empty");
		Assert.hasText(start, "start must not be empty");	
		Assert.hasText(end, "end must not be empty");	
		
		this.select = select;
		this.year = year;
		this.semester = semester;
		this.start = start;
		this.end = end;
		
	}

	public ApplyTime() {
		
	}
	

}
