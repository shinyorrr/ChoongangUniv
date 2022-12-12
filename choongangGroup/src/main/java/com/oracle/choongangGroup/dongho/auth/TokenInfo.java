package com.oracle.choongangGroup.dongho.auth;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Builder
@Data
@AllArgsConstructor
public class TokenInfo {
    public TokenInfo() {};
	private String grantType;
    private String accessToken;
    private String refreshToken;
    private String keepToken;
}
