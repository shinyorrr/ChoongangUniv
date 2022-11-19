package com.oracle.choongangGroup.changhun.dept;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeptController {
	private final DeptService deptService;
	
	@RequestMapping(value = "deptForm")
	public String DeptForm(Model model) {
		
		return "deptForm";
	}
	
}
