package com.oracle.choongangGroup.dongho.auth;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Header;

public class CustomExpiredException extends ExpiredJwtException{

	
	public CustomExpiredException(Header header, Claims claims, String message, Throwable cause) {
		super(header, claims, message, cause);
	}

	@Override
	public synchronized Throwable fillInStackTrace() {
		return this;
	}
}
