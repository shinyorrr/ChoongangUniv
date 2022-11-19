package com.oracle.choongangGroup.changhun.dept;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.choongangGroup.changhun.JPA.Dept;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeptController {
	
	private final DeptService deptService;
	private final DeptRepository deptRepository;
	
	@RequestMapping(value = "deptForm")
	public String DeptForm(Model model) {
		
		List<Dept> deptList = deptRepository.findAll();
		System.out.println("deptlist size -> " + deptList.size());
		model.addAttribute("deptList",deptList);
		
		return "deptForm";
	}
	
}
