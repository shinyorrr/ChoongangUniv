package com.oracle.choongangGroup.hj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.choongangGroup.hj.model.Member;
import com.oracle.choongangGroup.hj.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MemberController {

	private final MemberService ms = null;
	
	@RequestMapping(value="listEmp")
	public String MemberList(String mem_userid , Model model) {
		System.out.println("MemberController MemberList start. . .  . . ");
		Member member = ms.list(mem_userid);
		model.addAttribute("member", member);
		
		
	
		return "detailList";
	}
	
	
	
	
}
