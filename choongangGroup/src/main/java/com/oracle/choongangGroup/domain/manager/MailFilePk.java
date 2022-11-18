package com.oracle.choongangGroup.domain.manager;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@EqualsAndHashCode
@NoArgsConstructor
public class MailFilePk implements Serializable {

	private int mailFile;
	private int mail;
	private String member;
}
