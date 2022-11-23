package com.oracle.choongangGroup.dongho.auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.oracle.choongangGroup.dongho.auth.SecurityService;
import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SecurityController {
	
	private final SecurityService securityService;
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	//login성공 후 role 별 main page 연결
	@GetMapping("/student/main")
	public String studentMain() {
		return "/student";
	}
	@GetMapping("/manager/main")
	public String managerMain() {
		return "/manager";
	}
	@GetMapping("/professor/main")
	public String professorMain() {
		return "/professor";
	}
	@GetMapping("/admin/main")
	public String adminMain() {
		return "/admin/contentSample";
	}
	
	// RSA setting 후 loginForm으로 연결
	@GetMapping("/")
    public String loginForm(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) 
    		throws NoSuchAlgorithmException, InvalidKeySpecException {
        return "/loginForm";
    }
	
	// RSA setting 후 createMemberForm으로 연결
	@GetMapping("/admin/createMemberForm")
	public String joinForm(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) 
			throws NoSuchAlgorithmException, InvalidKeySpecException {
		return "/admin/createMemberForm";
	}
	
	@PostMapping("/admin/createMember")
	public void joinProc(Member member, HttpServletResponse response) throws IOException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey)session.getAttribute("__rsaPrivateKey__");

        System.out.println("authenticate privateKey -> " + privateKey);
		String encryptedUsername = member.getUserid();
		System.out.println("encryptedUsername -> " + encryptedUsername);
		String encryptedPassword = member.getPassword();
		String username = null;
		String password = null;
		try {
			username = decryptRSA(privateKey, encryptedUsername);
			System.out.println("username -> " + username);
			password = decryptRSA(privateKey, encryptedPassword);
			System.out.println("password -> " + password);
			
		} catch (Exception e) {
			System.out.println("authenticate decryptRSA exception -> " + e.getMessage());
		}
		String encodedPassword = bCryptPasswordEncoder.encode(password);
		member.setUserid(username);
		member.setPassword(encodedPassword);
		securityService.save(member);
		String targetUrl = "/admin/createMemberForm";
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.append(targetUrl);
		out.close();
	}
	
	// createMemberForm 아이디 중복 체크
	@PostMapping("/admin/idCheck")
	public void idCheck(@RequestParam("userid") String userid , HttpServletResponse response) throws IOException {
		String result = "0";
		if(securityService.findByUserid(userid) != null) {
			result = "0";
		} else {
			result = "1";
		}
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.append(result);
		out.close();
	}
	
	// RSA setting 후 updatePasswordForm으로 연결
	@GetMapping("/admin/updatePasswordForm")
	public String updatePasswordForm(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) 
			throws NoSuchAlgorithmException, InvalidKeySpecException {
		return "/admin/updatePasswordForm";
	}
	
	
	// RSA 복호화 method
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
