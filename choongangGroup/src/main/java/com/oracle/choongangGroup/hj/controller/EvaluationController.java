package com.oracle.choongangGroup.hj.controller;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.dongho.auth.GetMember;
import com.oracle.choongangGroup.hj.model.EvaluationVo;
import com.oracle.choongangGroup.hj.service.EvaluationService;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Controller
public class EvaluationController {

	private final EvaluationService es;
	private final GetMember gm;
	
	
	//강의평가 버튼
	@RequestMapping(value = "evaluation")
	public String evaluationList(String userid, Model model , HttpServletRequest request) {
		
		//아이디 받아오기 
	     
		
		System.out.println("EvaluationController evaluation start. . .  . . ");
		System.out.println("userid" + userid);
		
		//필요없음_yj
		//List<EvaluationVo> evaluation = es.list(userid);
		//model.addAttribute("evaluation" ,evaluation); 
		model.addAttribute("userid", userid);
		
		return "student/evaluationForm";
		
	}
	
	//강의평가 
	@RequestMapping(value = "evaluationList")
	public String listevaluation(String userid , Model model){
		
		System.out.println("EvaluationController listevaluation start. . .  . . ");
		System.out.println("userid------------------->"+userid);
		//System.out.println("cd--------------->" + cd);
		
		//셀렉트바 강의명 +교수이름 
		List<EvaluationVo> evList = es.findev(userid);
		model.addAttribute( "evList",evList);
		
		//강의평가항목 카테고리
		List<EvaluationVo> cgList = es.findcg(userid);
		model.addAttribute("cgList" ,cgList);
        model.addAttribute("userid", userid);
		return "student/evaluationList";
		
	}
//	@ResponseBody
//	@GetMapping(value = "evaluationDetailList")
//	public String evDetailList(String userid , String lecprof){
//		
//		
//		
//		System.out.println(" EvaluationController evaluationDetailList start. .. ");
//		System.out.println("넘어온 userid *************** >"+userid);
//		System.out.println( "넘어온  prof_name *********** >  "+lecprof );
//
//		
//		
//		return "evDetailList" ;
//		
//	}
//	
//	
//	
	
	//강의평가 했던 과목 선택 못하게 하기 
//	
//	
//	  @RequestMapping(value = "writeEvaluation")
//	  public String writeEvaluation(String userid , Model model ,  String score ,String select){
//	  System.out.println("EvaluationController writeEvaluation start. . .  . . ");
//		System.out.println("넘어온 userid *************** >"+userid);
//		System.out.println("넘어온 select *************** >"+select);
//		System.out.println("넘어온 score *************** >"+score);
//	
//	
//		/*
//		 * if(score > 0){
//		 * 
//		 * 
//		 * 
//		 * String Result = "이미평가함";
//		 * 
//		 * } else { String Result = "평가완료";
//		 * 
//		 * }
//		 */
//	  return "Result";
//	  
//	  }
//	  
	  
	  
	
	 //강의평가 insert 
   	@ResponseBody
	 @PostMapping(value = "saveEvaluation")
	 public  String saveEvaluation(EvaluationVo evaluation, Model model ) {
		  System.out.println("EvaluationController saveEvaluation start. . .  . . ");
		 
		int result = 0;
	
	
		System.out.println("넘어온 getBig_category-->"+evaluation.getBig_category());
		System.out.println("넘어온 getSmall_category-->"+evaluation.getSmall_category());
		System.out.println("넘어온 Score1-->"+evaluation.getScore1());
		System.out.println("넘어온 Score2-->"+evaluation.getScore2());
		System.out.println("넘어온 Score3-->"+evaluation.getScore3());
		System.out.println("넘어온 Score4-->"+evaluation.getScore4());
		System.out.println("넘어온 Score5-->"+evaluation.getScore5());
		System.out.println("넘어온 Score6-->"+evaluation.getScore6());
		System.out.println("넘어온 getLec_id *************** >"+evaluation.getLec_id());
		System.out.println("넘어온 getReview *************** >"+evaluation.getReview());
	


		  //빅,스몰 카테고리짤라주기
		  String[] big = evaluation.getBig_category().split(",");
		  String[] small = evaluation.getSmall_category().split(",");
	
		  
		  //빅,스몰 카테고리짤라준값 보기 
//		  for( int i =0 ; i <big.length ; i++) {
//			  System.out.println( "짜름 ********** getBig_category-->"+big[i]);
//			  System.out.println( "짜름 ********** getSmall_category-->"+small[i]);
//		  }
//		  
		  
		  //점수 list에 담아줌
		  List<Long> scoreList1 = new ArrayList<Long>();
		  scoreList1.add(evaluation.getScore1());
		  scoreList1.add(evaluation.getScore2());
		  scoreList1.add(evaluation.getScore3());
		  scoreList1.add(evaluation.getScore4());
		  scoreList1.add(evaluation.getScore5());
		  scoreList1.add(evaluation.getScore6());
		  
		  System.out.println("scoreList1------***********************>"+scoreList1);
		  
	 	
		  //배열만들어서 체크한 값 한번에 넣어줌 
		  List<EvaluationVo> scoreList = new ArrayList<EvaluationVo>();
		  
		  EvaluationVo ev = null;
		  
		  for( int i =0 ; i <big.length ; i++) {
			 
			  ev = new EvaluationVo();
			  
			  ev.setBig_category(big[i]);
			  ev.setSmall_category(small[i]);
			  ev.setLec_id(evaluation.getLec_id());
			  ev.setUserid(evaluation.getUserid());
			  ev.setReview(evaluation.getReview());
		      ev.setScoreList1(scoreList1.get(i));
			 

			  scoreList.add(ev);
			  
		  }
		

		  
		System.out.println("scoreList----***************>"+scoreList);
		  
		  
		result = es.insertscore(scoreList);
		 	  
		
		return "student/evaluationForm";
		 
		 
		 
	 }
	 
	 
//   	//강의평가 저장
//   	@ResponseBody
//   	@PostMapping(value = "saveEvaluation")
//   	public  int saveEvaluation2(EvaluationVo evaluation, Model model) {
//   		System.out.println("EvaluationController saveEvaluation start. . .  . . ");
//   		
//  		int result = 0;
//   		
//   		System.out.println("넘어온 userid *************** >"+evaluation.getUserid());
//   		System.out.println("넘어온 Selectvalue *************** >"+evaluation.getSelectvalue());
//   		
//   		
//   		//result = es.insertscore(evaluation);
////   		
////   		if(result>0) System.out.println("제출성공");
////   		
////   		else { model.addAttribute("msg","제출실패 확인해보세요");
////   		
////   		
//   	
//   		return result;
//   		
//   		
//   		
//   	}
//   	
//   	
		
	  
	  
		/*
		 * 
		 * @GetMapping(value = "confirm") public String confirm(int score ,Model model)
		 * { // EvaluationVo evaluation = es.fin
		 * 
		 * return "";
		 * 
		 * }
		 */



		}
