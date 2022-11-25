package com.oracle.choongangGroup.changhun.dept;

import java.util.List;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.choongangGroup.changhun.JPA.Dept;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class DeptController {
	
	private final DeptService deptService;
	private final DeptRepository deptRepository ;
	
	@RequestMapping(value = "deptForm")
	public String DeptForm(Model model) {
		List<Dept> deptList = deptRepository.findAll(Sort.by(Sort.Direction.ASC ,"deptno"));
//		PageRequest pageRequest = PageRequest.of(0, 5);
//		@SuppressWarnings("unchecked")
//		List<Dept> deptList = deptRepository.findAll(pageable);
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
	
	@RequestMapping(value = "searchDept")
	public String searchDept(Model model, @RequestParam(value = "searchGubun")String searchGubun,
										  @RequestParam(value = "search") String search) 
	{
		log.info("searchDept param searchGubun -> {}" , searchGubun);
		
		List<Dept> searchDeptList = deptService.searchDept(search, searchGubun);
		
		
		String msg = "";
		if(searchDeptList == null) {
			msg += "다시 입력해주세요";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("deptList", searchDeptList);
		
		return "/manager/deptForm";
	}
	

	
	
	
	
}
