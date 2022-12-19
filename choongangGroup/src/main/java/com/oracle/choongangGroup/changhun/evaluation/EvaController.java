package com.oracle.choongangGroup.changhun.evaluation;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.dongho.auth.GetMember;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/manager")
public class EvaController {
	
	private final EvaService es;
	private final GetMember getMember;
	private final EvaDao repository;
	
	@RequestMapping("/EvaManagementForm")
	public String EvaManagementForm(Model model,
									@RequestParam(value = "lecId", defaultValue = "1") String lecid,
									@RequestParam(value = "pname", required = false) String pname) {
		
		log.info("EvaManagementForm pname --> {}",lecid);
		List<EvaVo> evaList = es.evaList(lecid);
		List<EvaVo> reviewList = es.reviewList(lecid);
		List<String> profList = repository.profNameList();
		EvaVo total = es.total(lecid);
		Member member = getMember.getMember();
		
		
		model.addAttribute("member", member);
		model.addAttribute("profList", profList);
		model.addAttribute("evaList", evaList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("total", total);
		
		return "manager/EvaManagementForm";
	}
	
	@ResponseBody
	@RequestMapping("/findProf")
	public List<EvaVo> findProf(@RequestParam(value = "pname", defaultValue = "유상신") String pname){
		
		List<EvaVo> profList = es.profList(pname);
		
		log.info("findProf size ==> {}",profList.size() );
		
		return profList;
		
	}
	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
}
