package com.oracle.choongangGroup.hs.approval;

import java.util.List;

import javax.servlet.http.HttpSession;

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
		// HttpSession session;
		// String userid = (String) session.getAttribute("userid");
		String userid = "12301001";
		log.info("apprList start...");
		List<MemDept> listAppr = as.apprList(userid);
		log.info("listAppr.size()->{}",listAppr.size());
		return listAppr;
	}
	
	// 상신 취소
	@RequestMapping("apprDelete")
	public int delete(Long approval_no) {
		log.info("approval_no->{}",approval_no);
		log.info("Delete Start...");
		int result = 0;
		result = as.delete(approval_no);
		return result;
	}
}
