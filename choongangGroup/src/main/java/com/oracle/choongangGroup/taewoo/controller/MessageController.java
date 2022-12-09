package com.oracle.choongangGroup.taewoo.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.oracle.choongangGroup.changhun.address.MemberRepository;
import com.oracle.choongangGroup.dongho.auth.GetMember;
import com.oracle.choongangGroup.taewoo.dto.MessageDto;
import com.oracle.choongangGroup.taewoo.service.MessageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MessageController {

	private final MessageService messageService;
	private final MemberRepository memberRepository;
	private final GetMember getMember;
	
	// 쪽지쓰기 화면
	@GetMapping(value =  "/messageWriteForm")
	public String sendMessage(MessageDto messageDto, Model model) {
		log.info("MessageController sendMessage Start....");		
		String userid = getMember.getMember().getUserid();
		model.addAttribute("userid", userid);
		return "/manager/message/createMessageForm";
	}
	
	// 편지함 확인
	@GetMapping(value = "/message/messageList")
	public String messageList() {
		log.info("MessageController messageList Start....");
				
		
		return "/manager/message/messageList";
	}
}
