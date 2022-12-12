package com.oracle.choongangGroup.ry.model;

import lombok.Data;

@Data
public class OrderDetailVo {

	private int orderDetailsNum;
	private String orderId;
	private int bookId;
	private int cartStock;
}
