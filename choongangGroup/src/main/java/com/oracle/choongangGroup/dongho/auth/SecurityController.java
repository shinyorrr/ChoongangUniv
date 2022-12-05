package com.oracle.choongangGroup.dongho.auth;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.Optional;

import javax.crypto.Cipher;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.oracle.choongangGroup.dongho.auth.SecurityService;
import com.oracle.choongangGroup.dongho.auth.SecuredLoginDto;
import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.RequiredArgsConstructor;
import oracle.jdbc.proxy.annotation.GetProxy;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequiredArgsConstructor
public class SecurityController {
	
	private final SecurityService securityService;
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	private final PasswordEncoder passwordEncoder;
	private final JavaMailSender mailSender;
	
	@Value("${spring.mail.username}")
	private String MAIL_USERNAME;
	
	//login성공 후 role 별 main page 연결
	@GetMapping("/student/main")
	public String studentMain() {
		return "/student";
	}
	@GetMapping("/manager/main")
	public String managerMain() {
		return "/manager/test";
	}
	@GetMapping("/professor/main")
	public String professorMain() {
		return "/professor/main";
	}

	@GetMapping("/admin/main")
	public String adminMain() {
		return "/admin/contentSample";
	}
	
	// InterCeptor RSA setting 후 loginForm으로 연결
	@GetMapping("/")
    public String loginForm(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) 
    		throws NoSuchAlgorithmException, InvalidKeySpecException {
        return "/loginForm";
    }
	
	//로그인 요청
    @PostMapping("/login")
    public void login(@RequestParam(value = "securedUsername") String securedUsername, @RequestParam(value = "securedPassword") String securedPassword, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
    	// session에서 개인키 받기(loginForm 요청시 session에 저장해둔 개인키)
    	HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey)session.getAttribute("__rsaPrivateKey__");
        System.out.println("login privateKey -> " + privateKey);
        // loginForm에서 DTO를 통해 암호화된 아이디, 비밀번호 받기
        //String securedUsername = securedLoginDto.getSecuredUsername();
        System.out.println("login : " + securedUsername);
        //String securedPassword = securedLoginDto.getSecuredPassword();
        String username = null;
        String password = null;
        
        // 복호화 try
        try {
        	username = decryptRSA(privateKey, securedUsername);
            System.out.println(username);
            password = decryptRSA(privateKey, securedPassword);
            System.out.println(password);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // 복호화된 아이디와 비밀번호로 토큰 생성(memberService의 login은 generateToken method를 통해 TokenInfo(토큰dto)를 리턴한다. )
        // 토큰dto에는 타입,refreshToken,accessToken이 들어있음
        TokenInfo tokenInfo = this.securityService.login(username, password);
        String accessToken = URLEncoder.encode(tokenInfo.getAccessToken(), "utf-8");
        String refreshToken = URLEncoder.encode(tokenInfo.getRefreshToken(), "utf-8");
        
        // DB에 Refresh Token 저장( 추후 Access Token의 유효기간이 끝났을 때 Refresh Token 검증을 위함)
        securityService.saveRefreshToken(refreshToken, username);
        
        // session 에 넣어줄 username setting
        request.setAttribute("userid", username);
        
        // 클라이언트의 쿠키에 넣을 토큰 setting
        Cookie cookieAT = new Cookie("AccessToken","Bearer" + accessToken);
        Cookie cookieRT = new Cookie("RefreshToken", "Bearer" + refreshToken);
        // cookie.setMaxAge(7 * 24 * 60 * 60); // 유효시간을 정하지 않으면 session cookie (휘발성. 브라우저종료시 삭제)
        cookieAT.setPath("/");
        cookieAT.setHttpOnly(true);
        cookieRT.setPath("/");
        cookieRT.setHttpOnly(true);
        // response에 담아 쿠키 전송,저장
        response.addCookie(cookieAT);
        response.addCookie(cookieRT);
    }
	
	
	// InterCeptor RSA setting 후 createMemberForm으로 연결
	@GetMapping("/admin/createMemberForm")
	public String joinForm(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) 
			throws NoSuchAlgorithmException, InvalidKeySpecException {
		return "/admin/createMemberForm";
	}
	
	@PostMapping("/admin/createMember")
	public void joinProc(Member member, HttpServletResponse response) throws IOException {
		System.out.println("joinProc start");
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey)session.getAttribute("__rsaPrivateKey__");
        System.out.println("joinProc privateKey -> " + privateKey);
		
        String encryptedUsername = member.getUserid();
		System.out.println("encryptedUsername -> " + encryptedUsername);
		String encryptedPassword = member.getPassword();
		System.out.println("encryptedPassword -> " + encryptedPassword);
		String username = null;
		String password = null;
		try {
			username = decryptRSA(privateKey, encryptedUsername);
			System.out.println("username -> " + username);
			password = decryptRSA(privateKey, encryptedPassword);
			System.out.println("password -> " + password);
			
		} catch (Exception e) {
			System.out.println("joinProc decryptRSA exception -> " + e.getMessage());
		}
		String encodedPassword = passwordEncoder.encode(password);
		member.setUserid(username);
		member.setPassword(encodedPassword);
		securityService.save(member);
		String targetUrl = "/admin/createMemberForm";
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.append(targetUrl);
		out.close();
	}
	
	// createMemberForm 아이디 중복 체크(id 존재 유무) 존재하면 0, 아니면 1
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
	
	// createMemberForm 현재비밀번호 체크
	@PostMapping("/admin/pwCheck")
	public void pwCheck(@RequestParam("password") String password ,HttpServletRequest request, HttpServletResponse response) throws IOException {
		String result = "0";
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		Member member = securityService.findByUserid(userid);
		String dbPassword = member.getPassword();
		System.out.println("dbPassword -> " + dbPassword);
		if(member != null && passwordEncoder.matches(password, member.getPassword())) {
			result = "1";
		} else {
			result = "0";
		}
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.append(result);
		out.close();
	}
	
	// RSA setting 후 updatePasswordForm으로 연결
	// @Secured({"ROLE_STUDENT", "ROLE_MANAGER", "ROLE_PROFESSOR", "ROLE_ADMIN"})
	// @PreAuthorize("isAuthenticated()")
	@GetMapping("/updatePasswordForm")
	public String updatePasswordForm(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) 
			throws NoSuchAlgorithmException, InvalidKeySpecException {
		return "/admin/updatePasswordForm";
	}
	// @PreAuthorize("isAuthenticated()")
	@PostMapping("/updatePassword")
	public void updatePassword(@RequestParam("password") String paramPassword , HttpServletResponse response) throws IOException {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey)session.getAttribute("__rsaPrivateKey__");

        System.out.println("authenticate privateKey -> " + privateKey);
		String password = null;
		try {
			password = decryptRSA(privateKey, paramPassword);
			System.out.println("password -> " + password);
			
		} catch (Exception e) {
			System.out.println("authenticate decryptRSA exception -> " + e.getMessage());
		}
		String userid = (String) session.getAttribute("userid");
		Member member = securityService.findByUserid(userid);
		String encodedPassword = passwordEncoder.encode(password);
		member.setPassword(encodedPassword);
		securityService.save(member);
		String targetUrl = "/admin/main";
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.append(targetUrl);
		out.close();
	}
	
	// 아이디찾기 form 연결
	@GetMapping("/anonymous/findIdForm")
	public String findIdForm() {
		
		return "/admin/findIdForm";
	}
	
	// 아이디찾기 실행 ajax
	@ResponseBody
	@PostMapping("/anonymous/findId")
	public String findId(Member member, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		String searchId    = member.getName();
		String searchEmail = member.getEmail();
		Member memberResult = securityService.findByNameAndEmail(searchId , searchEmail);
		String result = memberResult.getUserid();
		HttpSession session = request.getSession();
		String sessionName = (String) session.getAttribute("name");
		System.out.println("findId session name" + sessionName);
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		out.append(result);
//		out.close();
		return result;
	}
	
	// 임시 비밀번호 요청 페이지 연결
	@GetMapping("/anonymous/requestResetPwForm")
	public String requestResetPwForm() {
		return "/admin/requestResetPwForm";
	}
	
	// 이메일 발송 요청 전 아이디 이메일 확인 ajax
	@PostMapping("/anonymous/idEmailCheck")
	public void idEmailCheck(Member member , HttpServletResponse response) throws IOException {
		String result = "";
		Optional<Member> memberResult = securityService.findByUseridAndEmail(member.getUserid(), member.getEmail());
		if(memberResult.isPresent()) {
			result = "1";
		} else {
			result = "0";
		}
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.append(result);
		out.close();
	}
	
	// 이메일 전송
	@ResponseBody
	@GetMapping("/anonymous/sendEmail")
	public void sendEmail(HttpServletRequest request, Member member) {
		System.out.println("sendEmail Start");
		String userid = member.getUserid();
		System.out.println("sendEmail userid : " + userid);
		String tomail = member.getEmail();
		System.out.println("sendEmail tomail : " + tomail);
		String setfrom = MAIL_USERNAME;
		System.out.println("sendEmail setfrom : " + setfrom);
		String title = "임시비밀번호입니다";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(setfrom);
			messageHelper.setTo(tomail);
			messageHelper.setSubject(title);
			String tempPassword = (int) (Math.random() * 999999) + 1 + "";
			System.out.println("sendEmail tempPassword : " + tempPassword);
			messageHelper.setText("임시 비밀번호입니다 : " + tempPassword);
			mailSender.send(message);
			
			Member memberToUpdate = securityService.findByUserid(userid);
			String encodedPassword = passwordEncoder.encode(tempPassword);
			System.out.println("sendMail encodedPassword : " + encodedPassword);
			memberToUpdate.setPassword(encodedPassword);
			securityService.save(memberToUpdate);
			
		} catch (Exception e) {
			System.out.println("sendEmail exception : " + e.getMessage());
		}
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
