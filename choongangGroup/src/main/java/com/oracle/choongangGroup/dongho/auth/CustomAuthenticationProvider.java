package com.oracle.choongangGroup.dongho.auth;

import java.security.PrivateKey;

import javax.crypto.Cipher;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Component
@RequiredArgsConstructor
public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	private final PrincipalDetailsService principalDetailsService;
	
	private final PasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = authentication.getName();
		String password = (String) authentication.getCredentials();
		log.info("authentication.getName username : {}" + username);
		PrincipalDetails principalDetails = (PrincipalDetails) principalDetailsService.loadUserByUsername(username);
		if (principalDetails == null) {
			System.out.println("CustomAuthenticationProvider authenticate : principalDetails == null");
			throw new UsernameNotFoundException("아이디가 존재하지 않습니다.");
		}
		
		if (isNotMatches(password, principalDetails.getPassword())) {
			log.info("authenticate : isNotMatches(password, principalDetails.getPassword())");
			throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
		}
		
		return new UsernamePasswordAuthenticationToken(principalDetails.getUsername(), principalDetails.getPassword(), principalDetails.getAuthorities());
		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
	// 비밀번호 비교
	private boolean isNotMatches(String password, String encodePassword) {
		return !passwordEncoder.matches(password, encodePassword);
	}
	
	// RSA decrypt method
    public String decryptRSA(PrivateKey privateKey, String securedValue) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(2, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8");
        return decryptedValue;
    }
    
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0)
            return new byte[0];
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int)Math.floor((i / 2))] = value;
        }
        return bytes;
    }

}
