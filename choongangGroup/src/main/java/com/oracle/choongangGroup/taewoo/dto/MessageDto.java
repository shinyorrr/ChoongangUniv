package com.oracle.choongangGroup.taewoo.dto;

import com.oracle.choongangGroup.taewoo.domain.Message;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MessageDto {
	private String messageTitle;
	private String messageContent;
	private String senderName;
	private String receiverName;
	
	public static MessageDto toDto(Message message) {
		return new MessageDto(
				message.getMessageTitle(),
				message.getMessageContent(),
				message.getSender().getName(),
				message.getReceiver().getName()				
				);
	}
}
