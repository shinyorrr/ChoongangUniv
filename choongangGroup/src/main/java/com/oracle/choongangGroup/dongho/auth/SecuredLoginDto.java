package com.oracle.choongangGroup.dongho.auth;

import lombok.Data;

@Data
public class SecuredLoginDto {
	private String securedUsername;
	private String securedPassword;
}
