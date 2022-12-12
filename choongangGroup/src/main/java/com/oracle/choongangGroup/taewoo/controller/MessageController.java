package com.oracle.choongangGroup.taewoo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.dongho.auth.GetMember;
import com.oracle.choongangGroup.dongho.auth.SecurityService;
import com.oracle.choongangGroup.taewoo.dto.MessageDto;
import com.oracle.choongangGroup.taewoo.service.MessageService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MessageController {

	private final MessageService messageService;
	private final SecurityService securityService;
	private final GetMember getMember;

	// 쪽지쓰기 화면
	@GetMapping(value = "/messageWriteForm")
	public String sendMessage(MessageDto messageDto, Model model) {
		log.info("MessageController sendMessage Start....");
		String userid = getMember.getMember().getUserid();
		model.addAttribute("userid", userid);
		return "/manager/message/createMessageForm";
	}

	// 쪽지작성
	@PostMapping(value = "messageSave")
	public String messageSave(MessageDto messageDto) {
		log.info("MessageController messageSave Start....");
		String userid = getMember.getMember().getUserid();
		String name = getMember.getMember().getName();
		System.out.println(messageDto.toString());
		messageDto.setSenderUserid(userid);
		messageDto.setSenderName(name);

		messageService.write(messageDto);

		return "redirect:/message/messageList";
	}

	// 받은편지함 확인
	@GetMapping(value = "/message/messageList")
	public String receiveMessageList(Model model) {
		log.info("MessageController messageList Start....");
		String userid = getMember.getMember().getUserid();
		Member member = securityService.findByUserid(userid);
		List<MessageDto> messageList = messageService.receiveMessage(member);
		System.out.println(messageList.size());
		model.addAttribute("messageList", messageList);

		return "/manager/message/messageList";
	}
}
