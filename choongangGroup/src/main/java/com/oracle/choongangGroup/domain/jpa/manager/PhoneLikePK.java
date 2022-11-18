package com.oracle.choongangGroup.domain.jpa.manager;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
public class PhoneLikePK implements Serializable {
	private String member;
	private String favoriteUser;
}
