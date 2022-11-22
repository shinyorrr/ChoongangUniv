package com.oracle.choongangGroup.hs.approval;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ApprovalController {
	
	private final ApprovalService approvalService;
	
	
	@RequestMapping("/approvalMain")
	public String content() {
		return "/manager/approvalMain";
	}
}
