package com.oracle.choongangGroup.dongho.professor.lecturePlan;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.dongho.auth.GetMember;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/professor")
public class DhProLecPlanController {
	private final GetMember getMember;
	private final DhProLecPlanService dhProLecPlanService;
	
	@GetMapping("/lecPlanPage")
	public String lecPlanPage(Model model) {
		String profName = getMember.getMember().getName();
		System.out.println(profName);
		model.addAttribute("profName", profName);
		return "/professor/lecPlan";
	}
	
	@ResponseBody
	@PostMapping("/lecList")
	public List<LecPlanLecDto> lecPlanlecList(String year, 
											  String semester, 
											  String profName) {
		String lecStatus = "0"; // 개설된 강의 상태
		
		return dhProLecPlanService.findByProfNameAndYearAndSemester(profName, year, semester, lecStatus);
	}
	
}
