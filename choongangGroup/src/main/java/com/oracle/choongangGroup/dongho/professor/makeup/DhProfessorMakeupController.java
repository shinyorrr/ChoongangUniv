package com.oracle.choongangGroup.dongho.professor.makeup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/professor")
public class DhProfessorMakeupController {
	// 휴보강 신청 페이지 요청
	@GetMapping("/makeupPage")
	public String makeupPage() {
		return "/professor/makeup";
	}
}
