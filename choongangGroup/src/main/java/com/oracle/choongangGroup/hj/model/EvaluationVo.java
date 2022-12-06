package com.oracle.choongangGroup.hj.model;

import lombok.Data;

@Data
public class EvaluationVo {
	//조회용
	private String userid;
	private Long lec_id;  //강의코드
	private String lec_name;    //강의명   
	private String big_category;		//대분류
	private String small_category;		//소분류
	private Long score;			//점수
	private String review;		//수강후기
	private String category_content; //내용
    private String lec_year;        //년도
    private String lec_semester;   // 학년
	private String prof_name;   //교수이름  
	private String selectvalue;  //셀렉트값 
	private String search_category;  //함수추가 
	private String category_content1;
	private String category_content2;
	
	private String gubun;  //구분
	private String text;   //평가항목
	
	
}
