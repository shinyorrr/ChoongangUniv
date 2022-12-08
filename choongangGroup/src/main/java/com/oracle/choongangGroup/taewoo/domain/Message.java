package com.oracle.choongangGroup.taewoo.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@SequenceGenerator(
					name = "MESSAGE_SEQ_GENERATOR",
					sequenceName = "MESSAGE_SEQ_GEN",
					initialValue = 1,
					allocationSize = 1
					)
public class Message {
	
	@Id
	@GeneratedValue(
					generator = "MESSAGE_SEQ_GENERATOR",
					strategy = GenerationType.SEQUENCE
			)
	private Long messageId;
	private String messageTitle;
	private String messageContent;
	private boolean deletedBySender;
	private boolean deletedByReceiver;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sender_userid")
	private Member sender;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "receiver_userid")
	private Member receiver;
	
	public void deleteBySender() {
		this.deletedByReceiver = true;
	}
	
	public void deletedByReceiver() {
		this.deletedByReceiver = true;
		
	}
	
	public boolean isDeleted() {
		return isDeletedByReceiver() && isDeletedBySender();
	}
	

}
