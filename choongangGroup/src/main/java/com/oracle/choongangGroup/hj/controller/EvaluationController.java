package com.oracle.choongangGroup.hj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.choongangGroup.hj.model.EvaluationVo;
import com.oracle.choongangGroup.hj.service.EvaluationService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class EvaluationController {

	private final EvaluationService es;
	
	
	
	//강의평가 버튼ㄹㄹ
	@RequestMapping(value = "evaluation")
	public String evaluationList(String userid, Model model , HttpServletRequest request) {
		
		//아이디 받아오기 
		HttpSession session = request.getSession();
		userid = (String) session.getAttribute("userid");
		
		System.out.println("EvaluationController evaluation start. . .  . . ");
		EvaluationVo evaluation = es.list(userid);
		System.out.println(evaluation.getUserid() );
		
		model.addAttribute("evaluation" ,evaluation);
		model.addAttribute("userid", userid);
		
		return "student/evaluationForm";
		
	}
	
	//강의평가 
	@GetMapping(value = "evaluationList")
	public String listevaluation(String userid ){
		System.out.println("EvaluationController listevaluation start. . .  . . ");
		System.out.println("userid--->"+userid);
		
		
		
		return "student/evaluationList";
		
	}
	
	
}
