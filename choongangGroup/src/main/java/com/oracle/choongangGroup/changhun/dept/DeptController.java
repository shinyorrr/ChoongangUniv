package com.oracle.choongangGroup.changhun.dept;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.choongangGroup.changhun.JPA.Dept;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeptController {
	
	private final DeptService deptService;
	private final DeptRepository deptRepository;
	
	@RequestMapping(value = "deptForm")
	public String DeptForm(Model model) {
		
		List<Dept> deptList = deptRepository.findAll(Sort.by(Sort.Direction.ASC ,"deptno"));
		System.out.println("deptlist size -> " + deptList.size());
		model.addAttribute("deptList",deptList);
		return "/manager/deptForm";
	}
	
	@RequestMapping(value = "/deptInsert")
	public String deptInsert(Dept dept) {
		
		Dept data = deptRepository.save(dept);
		
		System.out.println(data);
		
		return "redirect:/deptForm";
	}
	
	
}
