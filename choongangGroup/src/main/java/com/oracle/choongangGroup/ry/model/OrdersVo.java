package com.oracle.choongangGroup.ry.model;

import java.util.Date;

import lombok.Data;

@Data
public class OrdersVo {
	
	private String orderId;
	private String userId;
	private String orderName;
	private int Phone;
	private int amount;
	private Date orderDate;
	private String state;
	private String billState;
	private String bookLoca;
	
	private int orderDetailsNum;
	private int bookId;
	private int cartStock;
	
	private String bookName;
	private String bookThumbImg;
	private int bookPrice;
	private int bookStock;
	private String type;
	private String keyword;
	
}
