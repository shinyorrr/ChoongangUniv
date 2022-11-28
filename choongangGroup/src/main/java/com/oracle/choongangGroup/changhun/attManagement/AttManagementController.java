package com.oracle.choongangGroup.changhun.attManagement;

import java.text.ParseException;
import java.util.ArrayList;
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

import com.oracle.choongangGroup.changhun.JPA.Work;

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
		
		Page<Work> workList = repository.findPageByMember_Userid(userid,PageRequest.of(page, 5, Sort.by(Sort.Direction.ASC,"workDate")));
		
		model.addAttribute("attList",workList.getContent());
		model.addAttribute("weekSum",weekWorkMap.get("weekTotal"));
		model.addAttribute("weekOver",weekWorkMap.get("weekOver"));
		
		
		
		return "manager/attManagementForm";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "attClk")
//	public List<Work> attMyFormClk(@RequestParam(required = false, defaultValue = "0", value="page")int page) {
//		
//		System.out.println("page --> " + page);
////		HttpSession session;
////		String userid = (String) session.getAttribute("userid");
//		String userid = "18301001";
//		
//		Page<Work> workList = repository.findByUserid(userid,PageRequest.of(page, 5, Sort.by(Sort.Direction.ASC,"workDate")));
//		
//		List<String> list = new ArrayList<String>();
//		
//		list.add("간다");
//		list.add("간다1");
//		
//		
//		System.out.println(workList.getContent().get(0).getWorkDate());
//		
//		return workList.getContent();
//	}
	
}
