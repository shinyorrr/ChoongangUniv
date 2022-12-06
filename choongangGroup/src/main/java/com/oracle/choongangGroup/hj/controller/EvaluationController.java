package com.oracle.choongangGroup.hj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.ognl.Evaluation;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.hj.model.EvaluationVo;
import com.oracle.choongangGroup.hj.service.EvaluationService;

import lombok.RequiredArgsConstructor;
import net.bytebuddy.implementation.bind.annotation.Pipe;

@RequiredArgsConstructor
@Controller
public class EvaluationController {

	private final EvaluationService es;
	
	
	
	//강의평가 버튼
	@RequestMapping(value = "evaluation")
	public String evaluationList(String userid, Model model , HttpServletRequest request) {
		
		//아이디 받아오기 
		HttpSession session = request.getSession();
		userid = (String) session.getAttribute("userid");
		
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
	  
	  
	
	 //강의평가 저장
   	@ResponseBody
	 @PostMapping(value = "saveEvaluation")
	 public  int saveEvaluation(EvaluationVo evaluation, Model model , String selectvalue) {
		  System.out.println("EvaluationController saveEvaluation start. . .  . . ");
		 
		  int result = 0;
	
		 System.out.println("넘어온 userid *************** >"+evaluation.getUserid());
		  System.out.println("넘어온 Selectvalue *************** >"+evaluation.getSelectvalue());


		  result = es.insertscore(evaluation);
		  
		  if(result>0) System.out.println("제출성공");
		  
		  else { model.addAttribute("msg","제출실패 확인해보세요");
			 
			  
		  }
		return result;
		 
		 
		 
	 }
	 
	 
//   	//강의평가 저장
//   	@ResponseBody
//   	@PostMapping(value = "saveEvaluation")
//   	public  int saveEvaluation(EvaluationVo evaluation, Model model) {
//   		System.out.println("EvaluationController saveEvaluation start. . .  . . ");
//   		
//   		int result = 0;
//   		
//   		System.out.println("넘어온 userid *************** >"+evaluation.getUserid());
//   		System.out.println("넘어온 Selectvalue *************** >"+evaluation.getSelectvalue());
//   		
//   		
//   		//result = es.insertscore(evaluation);
//   		
//   		if(result>0) System.out.println("제출성공");
//   		
//   		else { model.addAttribute("msg","제출실패 확인해보세요");
//   		
//   		
//   		}
//   		return result;
//   		
//   		
//   		
//   	}
//   	
//   	
		
	  
	  
	  
	 
	
	
	
}




