package com.oracle.choongangGroup.hj.model;

import lombok.Data;

@Data
public class GradeVo {

	private String userid;     //사용자 아이디 
	private String  lec_type; // 구분
	private String lec_name;    //강의명   
    private int lec_id;        //강의코드
	private Long sco_total;	//종합성적 
    private Long lec_unit_score;	//강의학점
    private String lec_year;        //년도
    private String lec_semester;   // 학년
    private String major_gubun;   //전공구분
    private Long sco_attendance;  //출석점수
    
    //조회용 
    private String stotal; //총 토탈 성적
    private String utotal;  //토탈 학점 
    private String subutotal; //교양 총 학점
    private String majorutotal; //전공 총 학점 
    private String avg;       //총성적 평균 
    private String percentile;   //백분율
	private String ptotal;
     

    
          
}
