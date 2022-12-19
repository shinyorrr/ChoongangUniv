 package com.oracle.choongangGroup.taewoo.dto;

import java.time.LocalDateTime;

import com.oracle.choongangGroup.taewoo.domain.BaseTimeEntity;
import com.oracle.choongangGroup.taewoo.domain.Message;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MessageDto extends BaseTimeEntity {
	private Long messageId;
	private String messageTitle;
	private String messageContent;
	private String senderUserid;
	private String senderName;
	private String receiverUserid;
	private LocalDateTime createdDate;
	
	public static MessageDto toDto(Message message) {
		return new MessageDto(
				message.getMessageId(),
				message.getMessageTitle(),
				message.getMessageContent(),
				message.getSender().getUserid(),
				message.getSenderName(),
				message.getReceiver().getUserid(),
				message.getCreatedDate()
				);
	}
}
