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
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.dongho.auth.GetMember;
import com.oracle.choongangGroup.sh.domain.Lecture;
import com.oracle.choongangGroup.sh.domain.Report;

import lombok.RequiredArgsConstructor;
import oracle.jdbc.proxy.annotation.GetProxy;


@Controller
@RequiredArgsConstructor
@RequestMapping("/professor")
public class DhProfessorController {
	private final DhProfessorService dhprofessorService;
	private final GetMember getMember;
	
	@GetMapping("/reportList")
	public String reportList(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String profName = (String) session.getAttribute("name");
		System.out.println("reportList profName -> " + profName);
		List<Lecture> lectureList = dhprofessorService.findByProf(profName);
		model.addAttribute("lectureList", lectureList);
		return "/professor/report";
	}
	
	@ResponseBody
	@PostMapping("/lecReportList")
	public Map<String, Object> lecReportList(@RequestParam("id") Long id, Model model, @RequestParam(required = false, defaultValue = "0", value="page") int page, HttpServletRequest request, @AuthenticationPrincipal User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		Page<Report> lecReportList = dhprofessorService.findPageByLecture_Id(id , PageRequest.of(0, 5, Sort.by(Sort.Direction.ASC,"member.name")));
		for (Report report2 : lecReportList) {
			System.out.println(report2.getMember().getName());
			System.out.println(report2.getMember().getUserid());
		}
		
		int totalPage = lecReportList.getTotalPages();
		System.out.println(totalPage);
		
		map.put("totalPage", totalPage);
		map.put("page" , page);
		map.put("lecReportList", lecReportList.getContent());
		model.addAttribute("totalPage", totalPage);
		HttpSession session = request.getSession();
		String profName = (String) session.getAttribute("name");
		System.out.println("lecReportList profName" + profName);
		System.out.println("lecReportList user.getUsername" + user.getUsername());
		
		
		Member member = getMember.getMember();
		System.out.println("lecReportList member.getName" + member.getName());
		return map;
	}
	
	
}
