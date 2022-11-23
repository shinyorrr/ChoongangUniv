package com.oracle.choongangGroup.changhun.JPA;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.JoinColumn;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class PhoneLikePK implements Serializable {
	
	private String myUserid;
	private String userid;
	
}
