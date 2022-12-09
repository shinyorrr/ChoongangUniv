package com.oracle.choongangGroup.dongho.professor.makeup;

import lombok.Data;

@Data
public class InsertLecOrdersDto {
	private Long   lec_id;
	private Long   lec_order;
	private String lec_date;
}
