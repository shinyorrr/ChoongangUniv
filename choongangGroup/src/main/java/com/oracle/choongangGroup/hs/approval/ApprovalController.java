package com.oracle.choongangGroup.hs.approval;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ApprovalController {
	
	private final ApprovalService as;
	
	// --------------결재메인 -----------------------
	@RequestMapping("/approvalMain")
	public String content(String userid, Model model) {
		log.info("approvalMain start...");
		userid = "12301001";
		List<Approval> approvalWaitingList = null;     // 승인 대기중
		List<Approval> approvalProcessingList = null;  // 승인 진행중
		List<Approval> approvalFinishedList = null;	   // 승인 완료
		
		// 결재 페이징
		int waitTotal	 = as.waitTotal(userid);	  // 승인 대기중
		// int processTotal = as.processTotal(userid);	  // 승인 진행중
		// int finishTotal  = as.finishTotal(userid);	  // 승인 완료
		
		approvalWaitingList    = as.waitingListAll(userid); // 승인 대기중
		approvalProcessingList = as.processListAll(userid); // 승인 진행중
		approvalFinishedList   = as.finishListAll(userid);  // 승인 완료
		
		model.addAttribute("waitList", approvalWaitingList);
		model.addAttribute("processList", approvalProcessingList);
		model.addAttribute("finishList", approvalFinishedList);
		model.addAttribute("waitTotal", waitTotal);
		model.addAttribute("userid", userid);
		
		return "manager/approvalMain";
		
	}
	
	// --------------새결재폼 -----------------------
	@RequestMapping("approvalForm")
	public String form(String userid, Model model) {
		log.info("getApprInfo start...");
		// 결재하는 사용자의 이름 출력
		MemDept memDept = new MemDept();
		memDept.setUserid(userid);
		
		MemDept infoAppr = as.getApprInfo(memDept);
		
		String mem_name = infoAppr.getName();
		String dname = infoAppr.getDname();
		
		model.addAttribute("mem_name", mem_name);
		model.addAttribute("dname", dname);
		return "/manager/approvalForm";
	}
	
	// --------------결재저장 -----------------------
	@PostMapping("approvalSave")
	public String save(String userid, Approval approval, Model model) {
		log.info("approvalSave start...");
		userid = "12301001";
		approval.setUserid(userid);
		
		int result = as.saveAppr(approval);
		
		if(result > 0) {
			return "manager/approvalMain";
		} else {
			
			return "forward:approvalForm";
		}
	}
}
