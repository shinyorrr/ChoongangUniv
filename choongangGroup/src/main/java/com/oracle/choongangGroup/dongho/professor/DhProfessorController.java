package com.oracle.choongangGroup.dongho.professor;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Required;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.sh.domain.Lecture;
import com.oracle.choongangGroup.sh.domain.Report;

import lombok.RequiredArgsConstructor;
import oracle.jdbc.proxy.annotation.GetProxy;


@Controller
@RequiredArgsConstructor
@RequestMapping("/professor")
public class DhProfessorController {
	private final DhProfessorService dhprofessorService;
	
	@GetMapping("/reportList")
	public String reportList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String profName = (String) session.getAttribute("name");
		List<Lecture> lectureList = dhprofessorService.findByProf(profName);
		model.addAttribute("lectureList", lectureList);
		return "/professor/report";
	}
	
//	@ResponseBody
//	@PostMapping("/lecReportList")
//	public List<Report> lecReportList(@RequestParam("id") Long id, Model model, @RequestParam(required = false, defaultValue = "0", value="page") int page) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		Page<Report> lecReportList = dhprofessorService.findPageByLecture_Id(id , PageRequest.of(page, 5, Sort.by(Sort.Direction.ASC,"member.name")));
//		for (Report report2 : lecReportList) {
//			System.out.println(report2.getMember().getName());
//			System.out.println(report2.getMember().getUserid());
//		}
//		
//		int totalPage = lecReportList.getTotalPages();
//		System.out.println(totalPage);
//		
//		//map.put("totalPage", value)
//		
//		return lecReportList.getContent();
//	}
	
	
}
