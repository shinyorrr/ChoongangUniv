package com.oracle.choongangGroup.changhun.evaluation;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class EvaController {
	
	private final EvaService es;
	
	@RequestMapping("/EvaManagementForm")
	public String EvaManagementForm(Model model,
									@RequestParam(value = "pname", defaultValue = "오태우") String pname) {
		
		log.info("EvaManagementForm pname --> {}",pname);
		List<EvaVo> evaList = es.evaList(pname);
		EvaVo total = es.total(pname);
		
		model.addAttribute("evaList", evaList);
		model.addAttribute("total", total);
		
		return "manager/EvaManagementForm";
	}
	
	@ResponseBody
	@RequestMapping("/findProf")
	public List<String> findProf(){
		
		List<String> profList = es.profList();
		
		return profList;
		
	}
	
	
}
