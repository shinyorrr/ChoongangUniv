package com.oracle.choongangGroup.changhun.dept;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.choongangGroup.changhun.JPA.Dept;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeptController {
	private final DeptService deptService;
	
	@RequestMapping(value = "deptForm")
	public String DeptForm(Model model) {
		
		List<Dept> deptList = deptService.deptList();
		model.addAttribute("deptList",deptList);
		
		return "deptForm";
	}
	
}
