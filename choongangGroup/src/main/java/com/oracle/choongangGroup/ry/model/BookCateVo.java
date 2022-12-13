package com.oracle.choongangGroup.ry.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class BookCateVo {
	
	// 카테고리 등급
	private int tier;
	// 카테고리 네임
	private String cateName;
	// 카테고리 코드
	private int cateCode;
	// 받아오는 카테고리 코드
	private int cateParent;
	
}
