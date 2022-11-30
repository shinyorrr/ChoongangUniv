package com.oracle.choongangGroup.sh.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Lecture;
import com.oracle.choongangGroup.sh.service.ApplyService;

import lombok.RequiredArgsConstructor;
import lombok.val;

@Controller
@RequiredArgsConstructor
public class ApplyController {
	private final ApplyService as;
	
	//기간안내  & 수강신청,장바구니 선택 페이지 
	@GetMapping(value = "applyIndex")
	public String applyIndex(String userid, Model model) {
		/////////접속 아이디 받아서 넘기기////////////
		userid = "1111";
		model.addAttribute("userid", userid);
		return "student/applyIndex";
	}
	
	//장바구니 메인 [장바구니안내문, 신청, 시간표]
	@GetMapping(value = "likeMain")
	///////////장바구니 기간 넘겨주기///////////
	public String likeMain(String userid, Model model) {
		model.addAttribute("userid", userid);
		return "student/likeMain";
	}
	
	//장바구니 신청 페이지
	@GetMapping(value = "likeForm")
	public String likeForm(String userid, Model model) {	
		List<Lecture> lectureList = as.lectureListAll();
		model.addAttribute("list", lectureList);
		model.addAttribute("userid", userid);	
		return "student/likeForm";
	}
	
	//장바구니 신청
	@ResponseBody
	@GetMapping(value = "like")
	public int like(Long lecId, String userid, Model model) {
		/////////접속 아이디 받아서 넘기기////////////
		System.out.println("ApplyController like lecId-->"+lecId );
		System.out.println("Applycontroller apply start...");
		
		//장바구니 구분
		int gubun = 1;
		int result = as.apply(lecId, userid, gubun);
		System.out.println("----------------result-->"+result);
		return result;
	}
		
	@GetMapping(value = "applyForm")
	public String applyForm( String userid , Model model, @RequestParam("select") String select) {
		/////////접속 아이디 받아서 넘기기////////////
		userid = "1111";
		System.out.println("넘어온 파라미터 ----->"+select);
		List<Lecture> lectureList = as.lectureListAll();
		model.addAttribute("list", lectureList);
		model.addAttribute("userid", userid);
		return "student/applyForm";
	}
	
	@GetMapping(value = "applyList")
	public String applyList(@RequestParam("select") String select) {
		System.out.println("넘어온 파라미터 ----->"+select);
		return "student/applyForm";
			
	}
	
	

	
//	@GetMapping(value = "apply")
//	public String apply(String lecId, String userid, Model model) {
//		System.out.println("Applycontroller apply start...");
//		as.apply(lecId, userid);
//		return "student/apply";
//	}
	

}
