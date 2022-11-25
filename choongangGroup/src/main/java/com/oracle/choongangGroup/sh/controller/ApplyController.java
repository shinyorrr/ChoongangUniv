package com.oracle.choongangGroup.sh.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.oracle.choongangGroup.sh.domain.Lecture;
import com.oracle.choongangGroup.sh.service.ApplyService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ApplyController {
	private final ApplyService as;

	@GetMapping(value = "applyForm")
	public String applyForm( String userid , Model model) {
		/////////접속 아이디 받아서 넘기기////////////
		userid = "1111";
		List<Lecture> lectureList = as.lectureListAll();
		model.addAttribute("list", lectureList);
		model.addAttribute("userid", userid);
		return "student/applyForm";
	}
	
	@GetMapping(value = "apply")
	public String apply(String lecId, String userid, Model model) {
		System.out.println("Applycontroller apply start...");
		as.apply(lecId, userid);
		return "redirect:/";
	}
	
}
