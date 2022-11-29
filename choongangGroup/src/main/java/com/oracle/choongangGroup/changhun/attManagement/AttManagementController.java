package com.oracle.choongangGroup.changhun.attManagement;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.choongangGroup.changhun.JPA.MemberMapping;
import com.oracle.choongangGroup.changhun.JPA.Work;
import com.oracle.choongangGroup.changhun.address.MemberRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class AttManagementController {
	
	private final AttManagementRepository repository;
	private final AttManagementService attManagementService;
	
	@RequestMapping(value = "/attForm")
	public String attMyForm(Model model,
							@RequestParam(required = false, defaultValue = "0", value="page")int page) throws ParseException {
		
		System.out.println("page --> " + page);
		HttpSession session;
//		String userid = (String) session.getAttribute("userid");
		String userid = "18301001";
		
		//일주일 근무시간
		Map<String, String> weekWorkMap = attManagementService.sumWeekWorking(userid);
		
		//한달 근무시간
		String monthTotal = attManagementService.monthTotal(userid); 
		
		//내 근태내역 리스트
		Page<Work> workList = repository.findPageByMember_Userid(userid,PageRequest.of(page, 5, Sort.by(Sort.Direction.ASC,"workDate")));
		
		//연차 갯수 표시
		long vacation = attManagementService.vacation(userid);
		
		model.addAttribute("attList",workList.getContent());
		model.addAttribute("weekSum",weekWorkMap.get("weekTotal"));
		model.addAttribute("weekOver",weekWorkMap.get("weekOver"));
		model.addAttribute("vacation",vacation);
		model.addAttribute("monthTotal",monthTotal);
		
		
		
		return "manager/attManagementForm";
	}
	
	@RequestMapping(value = "attAllMemberForm")
	public String attAllMemberForm(Model model) throws ParseException {
		List<Work> attMemberList = attManagementService.attAllList();
		List<String> monthList = attManagementService.monthList();
		System.out.println(monthList.get(0));
		System.out.println(monthList);
		model.addAttribute("monthList" , monthList);
		model.addAttribute("attList" , attMemberList);
		return "manager/attAllMemberForm";
	}
	
}
