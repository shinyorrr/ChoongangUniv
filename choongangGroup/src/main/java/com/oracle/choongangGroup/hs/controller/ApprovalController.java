package com.oracle.choongangGroup.hs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.choongangGroup.hs.service.ApprovalService;

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
