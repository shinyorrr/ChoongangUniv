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
    private String lec_time1;    //강의시간
    private String lec_time2;    //강의시간
    
	
	private String gubun;  //구분
	private String text;   //평가항목
	
	// evaluation score
	private Long  score1;   // 수업내용 절절
	private Long  score2;   // 수업방법 참고자료
	private Long  score3;   // 수업방법 상호작용
	private Long  score4;   // 수업내용 유익
	private Long  score5;   // 수업유형 체계적
	private Long  score6;   // 수업내용 수업준비 
	public Long scoreList1;  //스코어 다 받아오기 용 

	
	
	
	
}
