package com.oracle.choongangGroup.dongho.professor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DhProfessorController {
	@GetMapping("/professor/reportList")
	public String reportList() {
		return "/professor/report";
	}
}
