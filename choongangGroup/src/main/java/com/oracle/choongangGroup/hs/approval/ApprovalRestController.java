package com.oracle.choongangGroup.hs.approval;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	
	// 이미지 삭제 메서드
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
}
