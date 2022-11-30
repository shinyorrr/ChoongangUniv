package com.oracle.choongangGroup.ry.model;



import lombok.Data;

@Data
public class Book {
	
	private Long bookid; // 시퀀스 책 코드
	private String bookname; // 책 이름
	private int bookprice; // 책 가격
	private int stockQuantity; // 재고
	
	// 조회용
	private String search;		private String keyword;
	private String pageNum;
	private int		start;		private int end;
}
