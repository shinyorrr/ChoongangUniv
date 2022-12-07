package com.oracle.choongangGroup.hs.managerPage;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.dongho.auth.GetMember;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/manager")
public class ManagerPageController {
	
	private final ManagerPageService ms;
	private final GetMember gm;
	
	@RequestMapping("mypage")
	public String form(Model model) {
		log.info("mypage Start...");
		String userid = gm.getMember().getUserid();
		Member member = ms.memberFindOne(userid);
		
		try {
			String strDate = member.getBirth();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
			Date birth = dateFormat.parse(strDate);
			String birthDate = new SimpleDateFormat("yyyy-MM-dd").format(birth);
			log.info(birthDate);
			member.setBirth(birthDate);
		} catch (Exception e) {
			log.info("mypage Exception->{}", e.getMessage());
		}
		
		model.addAttribute("member", member);
		return "/manager/mypage";
	}
	
}
