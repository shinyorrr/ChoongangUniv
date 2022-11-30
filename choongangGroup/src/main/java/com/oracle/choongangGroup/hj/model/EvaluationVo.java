package com.oracle.choongangGroup.hj.model;

import lombok.Data;

@Data
public class EvaluationVo {
	//조회용
	private String userid;
	private Long lec_id;
	private String big_category;		//대분류
	private String small_category;		//소분류
	private Long score;			//점수
	private String review;		//수강후기
	private String category_content; //내용
	private String lec_name; //강의명
	private String mem_userid;   //교수이름  
	
 
}
