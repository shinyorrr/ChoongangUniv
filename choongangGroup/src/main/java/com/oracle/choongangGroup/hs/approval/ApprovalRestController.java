package com.oracle.choongangGroup.hs.approval;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class ApprovalRestController {
	
	private final ApprovalService as;
	
	// 문서 종류 선택 
	@RequestMapping("sortList")
	public List<ApprovalSort> sortList() {
		log.info("sortList start...");
		List<ApprovalSort> sortList = as.sortSelect();
		return sortList;
	}
	
	// 회원 전체 조회
	@RequestMapping("apprList")
	public List<MemDept> apprList() {
		log.info("apprList start...");
		List<MemDept> listAppr = as.apprList();
		log.info("listAppr.size()->{}",listAppr.size());
		return listAppr;
	}
}
