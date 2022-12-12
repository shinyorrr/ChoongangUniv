package com.oracle.choongangGroup.ry.model;

import java.util.Date;

import lombok.Data;

@Data
public class BookCartVo {
	
	private int cartNum;
	
	private int userId;
	
	private int bookId;
	
	private int cartStock;
	
	private Date addDate;
	
	// List 용 
	private int num;
	private String bookName;
	private int bookPrice;
	private String bookThumbImg;
	
}
