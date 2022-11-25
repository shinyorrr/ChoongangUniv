package com.oracle.choongangGroup.changhun.attManagement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AttManagementController {
	
	private final AttManagementRepository repository;
	private final AttManagementService attManagementService;
	
	@RequestMapping(value = "attForm")
	public String attMyForm() {
		
		
		int weekCount = attManagementService.weekCount();
		
		
		
		
//		attManagementService.attMyForm();
		
		return "";
	}
}
