package com.oracle.choongangGroup.taewoo.controller;


import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.address.MemberRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class MessageRestController {
	
	public final MemberRepository memberRepository;
	
	@RequestMapping(value = "addressList")
	public List<Member> addressForm() {
		log.info("addressForm start....");
		List<Member> memberList = memberRepository.findAll();
		return memberList;
	}
	
	


}
