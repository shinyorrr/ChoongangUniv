package com.oracle.choongangGroup.taewoo.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.address.MemberRepository;
import com.oracle.choongangGroup.taewoo.domain.Message;
import com.oracle.choongangGroup.taewoo.dto.MessageDto;
import com.oracle.choongangGroup.taewoo.repository.MessageRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class MessageService {
	private final MessageRepository messageRepository;
	private final MemberRepository memberRepository;
	
	public MessageDto write(MessageDto messageDto) {
		System.out.println("MessageService write start....");
		Member receiver = memberRepository.findByUserid(messageDto.getReceiverName());
		Member sender = memberRepository.findByUserid(messageDto.getSenderName());
		
		Message message = new Message();
		message.setReceiver(receiver);
		message.setSender(sender);
		
		message.setMessageTitle(messageDto.getMessageTitle());
		message.setMessageContent(messageDto.getMessageContent());
		message.setDeletedByReceiver(false);
		message.setDeletedBySender(false);
		messageRepository.save(message);
		
		return MessageDto.toDto(message);
	}
	
	

}
