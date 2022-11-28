package com.oracle.choongangGroup.hs.approval;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ApprovalController {
	
	private final ApprovalService as;
	
	// --------------결재메인 -----------------------
	@RequestMapping("approval")
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
		
		// 3개 까지 보여줌
		Approval approval = new Approval();
		approval.setUserid(userid);
		approval.setStart(1);
		approval.setEnd(3);
		
		approvalWaitingList    = as.waitingListAll(approval); // 승인 대기중
		approvalProcessingList = as.processListAll(approval); // 승인 진행중
		approvalFinishedList   = as.finishListAll(approval);  // 승인 완료
		
		model.addAttribute("waitList", approvalWaitingList);
		model.addAttribute("processList", approvalProcessingList);
		model.addAttribute("finishList", approvalFinishedList);
		model.addAttribute("waitTotal", waitTotal);
		model.addAttribute("userid", userid);
		
		return "manager/approvalMain";
		
	}
	
	// --------------새결재폼 -----------------------
	@RequestMapping("approvalWrite")
	public String form(String userid, Model model) {
		log.info("approvalWrite start...");
		// 결재하는 사용자의 이름 출력
		MemDept memDept = new MemDept();
		memDept.setUserid(userid);
		
		MemDept infoAppr = as.findMem(memDept.getUserid());
		
		String mem_name = infoAppr.getName();
		String dname = infoAppr.getDname();
		
		model.addAttribute("mem_name", mem_name);
		model.addAttribute("dname", dname);
		return "manager/approvalForm";
	}
	
	// --------------결재저장 -----------------------
	@PostMapping("approvalSave")
	public String save(String userid, Approval approval, HttpServletRequest request, MultipartFile file1, Model model) throws IOException, Exception {
		log.info("approvalSave start...");
		int result = 0;
		userid = "12301001";
		approval.setUserid(userid);
		
		if(!file1.isEmpty()) {
			// 파일 저장
			String filePath = request.getSession().getServletContext().getRealPath("/fileUpload/hs/");
			log.info("file POST Start...");
			log.info("originalName: {}", file1.getOriginalFilename());
			log.info("size: {}", file1.getSize());
			log.info("contentType: {}", file1.getContentType());
			log.info("filePath: {}", filePath);
			String serverFileName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), filePath);
			log.info("serverFileName: {}", serverFileName);
			
			approval.setFile_path(filePath);
			approval.setServer_file_name(serverFileName);
			approval.setOrg_file_name(file1.getOriginalFilename());
			
			result = as.saveAppr(approval);
			
			if(result > 0) {
				return "manager/approvalMain";
			} else {
				
				return "forward:approvalForm";
			}
		} else {
			result = as.save(approval);
			
			if(result > 0) {
				return "manager/approvalMain";
			} else {
				
				return "forward:approvalForm";
			}
		}	
	}
	
	// 파일 업로드 메서드
	private String uploadFile(String originalName, byte[] fileData, String filePath) throws Exception {
		// universally unique identifier (UUID).
		UUID uid = UUID.randomUUID();
		// requestPath = requestPath + "/resources/image";
		log.info("uploadFile filePath: {}",filePath);
		// Directory 생성
		File fileDirectory = new File(filePath);
		if (!fileDirectory.exists()) {
			fileDirectory.mkdirs(); // mkdir 신규 폴더 생성
			log.info("업로드용 폴더 생성 : {}", filePath);
		}
		
		String serverFileName = uid.toString();
		log.info("serverFileName: {}", serverFileName);
		File target = new File(filePath, serverFileName);
		// File target = new File(requestPath, savedName);
		// File Upload -> uplaodPath / UUID+_+originalName
		FileCopyUtils.copy(fileData, target); // org.springframework.util.FileCopyUtils
		
		return serverFileName;
	}
	
	
	// --------------기안진행 상세폼이동 -----------------------
	@RequestMapping("apprProcessDetail")
	public String detail(String userid, Long approval_no, Model model) {
		log.info("ProcessDetail start...");
		userid = "12301001";
		
		// 결재하는 사용자의 이름 출력
		MemDept memDept = new MemDept();
		memDept.setUserid(userid);
		
		MemDept infoAppr = as.findMem(memDept.getUserid());
		
		String mem_name = infoAppr.getName();
		String dname = infoAppr.getDname();
		
		// 결재상세내용
		Approval approval = new Approval();
		approval.setUserid(userid);
		approval.setApproval_no(approval_no);
		
		Approval appr = as.processDetail(approval);
		log.info("approval -> {}", appr.toString());
		
		// 중간 + 최종 결재자 상세정보
		String mid_approver_no = null;
		String fin_approver_no = null;
		
		MemDept midapprvo = null;
		MemDept finapprvo = null;
		
		if(appr.getMid_approver() != null && !"".equals(appr.getMid_approver())) {
			mid_approver_no = appr.getMid_approver();
			midapprvo = as.findMem(mid_approver_no);
			appr.setMidapprvo(midapprvo);
		}
		
		if(appr.getFin_approver() != null && !"".equals(appr.getFin_approver())) {
			fin_approver_no = appr.getFin_approver();
			finapprvo = as.findMem(fin_approver_no);
			appr.setFinapprvo(finapprvo);
		}
		
		log.info("appr mid->{}",appr.getMidapprvo().getDname());
		log.info("appr fin->{}",appr.getFinapprvo().getDname());
		
		model.addAttribute("userid", userid);
		model.addAttribute("mem_name", mem_name);
		model.addAttribute("dname", dname);
		model.addAttribute("appr", appr);
		
		return "manager/approvalProcessDetail";
	}
	
	
	// --------------결재대기중폼이동 -----------------------
	@GetMapping("approvalWait")
	public String wait(String userid, String currentPage, Model model) {
		log.info("approvalWait start...");
		userid = "12301001";
		Approval approval = new Approval();
		approval.setUserid(userid);
		
		//페이징
		int waitTotal = as.waitTotal(userid);	  // 승인 대기중
		
		Paging page = new Paging(waitTotal, currentPage);
		approval.setStart(page.getStart());
		approval.setEnd(page.getEnd());
		
		// List<Approval> waitListAppr = as.waitAll(approval);
		// log.info("waitListAppr.size()->{}",waitListAppr.size());
		
		return "manager/approvalWaitForm";
		
	}
	
	// --------------내가 기안한 진행중폼이동 -----------------------
	@GetMapping("approvalProcess")
	public String process(String userid, String currentPage, Model model) {
		log.info("approvalProcess start...");
		userid = "12301001";
		Approval approval = new Approval();
		approval.setUserid(userid);
		
		//페이징
		int processTotal = as.processTotal(userid);
		
		Paging page = new Paging(processTotal, currentPage);
		approval.setStart(page.getStart());
		approval.setEnd(page.getEnd());
		
		List<Approval> processList = as.processListAll(approval);
		
		log.info("endList.size()->{}",processList.size());
		
		model.addAttribute("processList", processList);
//		model.addAttribute("mem_name", mem_name);
		model.addAttribute("page", page);
		
		return "manager/approvalProcessForm";
	}
	
	
	// --------------결재완료폼이동 -----------------------
	@GetMapping("approvalEnd")
	public String end(String userid, String currentPage, Model model) {
		log.info("approvalEnd start...");
		userid = "12301001";
//		MemDept memDept = new MemDept();
//		memDept.setUserid(userid);
//		
//		MemDept infoAppr = as.getApprInfo(memDept);
//		String mem_name = infoAppr.getName();
//		
//		log.info("mem_name->{}",mem_name);
		
		//페이징
		int endTotal	 = as.finishTotal(userid);  // 승인 완료
		
		Paging page = new Paging(endTotal, currentPage);
		Approval approval = new Approval();
		approval.setStart(page.getStart());
		approval.setEnd(page.getEnd());
		approval.setUserid(userid);
		
		List<Approval> endList = as.finishListAll(approval);
		log.info("endList.size()->{}",endList.size());
		
		model.addAttribute("endList", endList);
//		model.addAttribute("mem_name", mem_name);
		model.addAttribute("page", page);
		
		return "manager/approvalEndForm";
		
	}
}
