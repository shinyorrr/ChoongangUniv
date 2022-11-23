package com.oracle.choongangGroup.yn.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.choongangGroup.yn.domain.Lec;
import com.oracle.choongangGroup.yn.service.LecService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class LecController {
	private final LecService ls;

	
	
//	@GetMapping(value = "createLecForm")
//	public String createLecForm( String userid , Model model) {
//		/////////접속 아이디 받아서 넘기기////////////
//		userid = "2222";
//		List<Lecture> lectureList = ls.lecCreateListAll();
//		model.addAttribute("list", lectureList);
//		model.addAttribute("userid", userid);
//		return "professor/createLecForm";
//	}
	@RequestMapping(value = "create")
	public String createLecForm() {
		return "professor/createLecForm";
	}
	@RequestMapping(value = "test")
	public String testForm() {
		return "professor/test";
	}
	
	@GetMapping(value = "createLec")
	public String createLec(String lecId, String userid, Model model) {
		System.out.println("LecController apply start...");
		ls.apply(lecId, userid);
		return "redirect:/";
	}

}
