package com.oracle.choongangGroup.hj.model;

public class GradeVo {
	//조회용
	private  String grade;    //학년
	private String name;        //이름
	private String mem_userid;  //사용자코드
    private int lec_id;        //강의코드
    private int rep_sco;       //과제점수
    private int sco_midterm;   //중간
    private int sco_final;		//기말
    private int sco_attendance;	 //출석점수
    							//종합성적
    private String lec_semester; //학기
    private String lec_year;    //년도
    private int lec_unit_score;	//강의학점
    private String lec_name;    //강의명
    							//전공구분
}
