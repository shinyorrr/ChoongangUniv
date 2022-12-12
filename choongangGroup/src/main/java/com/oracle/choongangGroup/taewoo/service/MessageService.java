package com.oracle.choongangGroup.taewoo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
		Member receiver = memberRepository.findByUserid(messageDto.getReceiverUserid());
		Member sender = memberRepository.findByUserid(messageDto.getSenderUserid());
		
		Message message = new Message();
		message.setReceiver(receiver);
		message.setSender(sender);
		message.setSenderName(messageDto.getSenderName());
		message.setMessageTitle(messageDto.getMessageTitle());
		message.setMessageContent(messageDto.getMessageContent());
		message.setDeletedByReceiver(false);
		message.setDeletedBySender(false);
		messageRepository.save(message);
		
		return MessageDto.toDto(message);
	}

	public List<MessageDto> receiveMessage(Member member) {
		   List<Message> messages = messageRepository.findAllByReceiver(member);
	        List<MessageDto> messageDtos = new ArrayList<>();

	        for(Message message : messages) {
	            // message 에서 받은 편지함에서 삭제하지 않았으면 보낼 때 추가해서 보내줌
	            if(!message.isDeletedByReceiver()) {
	                messageDtos.add(MessageDto.toDto(message));
	            }
	        }
	        return messageDtos;
	}


	
	

}
