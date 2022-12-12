package com.oracle.choongangGroup.dongho.professor.makeup;

import lombok.Data;

@Data
public class OrdersDto {
	private Long lec_orders_id;
	private Long lec_id;
	private Long lec_order;
	private String lec_date;
	private String lec_time;
	private String lec_order_status;
	private String lec_order_makeup_status;
	private String lec_order_date;
	private String lec_order_time;
	private String lec_order_hour;
	private String lec_order_room;
	private String lec_order_building;
	private String lec_order_reason;
	
	private String lec_day;
}
