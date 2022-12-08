package com.oracle.choongangGroup.taewoo.controller;


import java.util.List;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.choongangGroup.changhun.JPA.Dept;
import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.address.MemberRepository;
import com.oracle.choongangGroup.hj.service.MemberService;
import com.oracle.choongangGroup.hs.approval.MemDept;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class MessageRestController {
	
	private final  MemberRepository memberRepository;
		
//	@RequestMapping("/addressList")
//	public List<CreateMemberResponse> addressForm() {
//		System.out.println("addressForm start....");
//		log.info("addressForm start....");
//		List<MemDept> memberList = memberRepository.findAll();
//		List<CreateMemberResponse> memberCollect = memberList.stream()
//				  .map(m -> new CreateMemberResponse(m.getDept(), m.getName() ))	// 람다식 표현
//				  .collect(Collectors.toList());
//
////		for(Member member : memberList) {
////			System.out.println("member->"+member);
////		}
//		memberList.get(0).getName();
//		System.out.println(memberList.get(0).getName());
//		System.out.println("memberList.size()->"+memberList.size());
//		return memberCollect;
//	}
//	
//	@Data
//	@RequiredArgsConstructor
//	class CreateMemberResponse {
//		private  final String dname;
//		private final String name;
//
////		public CreateMemberResponse(Long id) {
////		this.id = id;
////		}
//	}
	

}
