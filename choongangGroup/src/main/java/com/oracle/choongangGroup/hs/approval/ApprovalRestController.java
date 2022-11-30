package com.oracle.choongangGroup.hs.approval;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
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
	public List<MemDept> apprList(String userid, HttpServletRequest request) {
		HttpSession session = request.getSession();
		userid = (String) session.getAttribute("userid");
		log.info("apprList start...");
		List<MemDept> listAppr = as.apprList(userid);
		log.info("listAppr.size()->{}",listAppr.size());
		return listAppr;
	}
	
	// 상신 취소
	@RequestMapping("apprDelete")
	public int delete(Long approval_no, String file_path, String server_file_name, HttpServletRequest request) throws Exception {
		log.info("approval_no->{}",approval_no);
		log.info("Delete Start...");
		
		// 파일 우선 삭제
		String deleteFile = file_path + server_file_name;
		int delResult = upFileDelete(deleteFile);
		
		// 결재 삭제
		int result = 0;
		result = as.delete(approval_no);
		return result;
	}
	
	// 파일 삭제 메서드
	private int upFileDelete(String deleteFileName) throws Exception {
		int result = 0;
		log.info("upFileDelete result->{}", deleteFileName);
		File file = new File(deleteFileName);
		if(file.exists()) {
			if(file.delete()) {
				log.info("파일 삭제 성공");
				result = 1;
			} 
			else {
				log.info("파일 삭제 실패");
				result = 0;
			}
		}
		else {
			log.info("파일이 존재하지 않습니다.");
			result = -1;
		}
		return result;
	}
	
	// 첨부파일 다운로드
	@RequestMapping("/download")
	public void download(String file_path, String server_file_name, String org_file_name, HttpServletResponse response) {
		try {
			String path = file_path+server_file_name;
			File file = new File(path);
			response.setHeader("Content-Disposition", "attachment;filename=" + file.getName());
			
			FileInputStream fileInputStream = new FileInputStream(file_path);
			OutputStream out = response.getOutputStream();
			
			int read = 0;
			byte[] buffer = new byte[1024];
			while((read = fileInputStream.read(buffer)) != -1) {
				out.write(buffer, 0, read);
			}
		} catch (Exception e) {
			log.info("download Exception->{}", e.getMessage());
		}

	}
	
	// 즁건결재자 승인
	@RequestMapping("midAgree")
	public int midAgree(String userid, String mid_approver_opinion, Long approval_no) {
		log.info("midAgree Start...");
		int result = 0;
		
		Approval approval = new Approval();
		approval.setApproval_no(approval_no);
		approval.setMid_approver_opinion(mid_approver_opinion);
		
		result = as.midAgree(approval);
		
		if(result > 0) {
			log.info("중간결재자 승인 성공");
		} else {
			log.info("중간결재자 승인 실패");
		}
		
		return result;
	}
	
	// 최종결재자 승인
	@RequestMapping("finAgree")
	public int finAgree(String userid, String fin_approver_opinion, Long approval_no) {
		log.info("finAgree Start...");
		int result = 0;
		
		Approval approval = new Approval();
		approval.setApproval_no(approval_no);
		approval.setFin_approver_opinion(fin_approver_opinion);
		
		result = as.finAgree(approval);
		
		if(result > 0) {
			log.info("최종결재자 승인 성공");
		} else {
			log.info("최종결재자 승인 실패");
		}
		
		return result;
	}
	
	// 즁건결재자 반려
	@RequestMapping("midReject")
	public int midReject(String userid, String mid_approver_opinion, Long approval_no) {
		log.info("midReject Start...");
		int result = 0;
		
		Approval approval = new Approval();
		approval.setApproval_no(approval_no);
		approval.setMid_approver_opinion(mid_approver_opinion);
		
		result = as.midReject(approval);
		
		if(result > 0) {
			log.info("중간결재자 반려 성공");
		} else {
			log.info("중간결재자 반려 실패");
		}
		
		return result;
	}
	
	// 최종결재자 반려
	@RequestMapping("finReject")
	public int finReject(String userid, String fin_approver_opinion, Long approval_no) {
		log.info("finReject Start...");
		int result = 0;
		
		Approval approval = new Approval();
		approval.setApproval_no(approval_no);
		approval.setFin_approver_opinion(fin_approver_opinion);
		
		result = as.finReject(approval);
		
		if(result > 0) {
			log.info("최종결재자 반려 성공");
		} else {
			log.info("최종결재자 반려 실패");
		}
		
		return result;
	}
	
	
}
