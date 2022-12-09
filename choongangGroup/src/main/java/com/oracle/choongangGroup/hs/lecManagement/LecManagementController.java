package com.oracle.choongangGroup.hs.lecManagement;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.dongho.auth.GetMember;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/manager")
public class LecManagementController {
	
	private final LecManagementService lms;
	private final GetMember gm;
	
	@RequestMapping("lecManagement")
	public String form(LectureVO lectureVO, String year, String semester, String keyword,
					   String status, Model model) {
		log.info("lecManagement start...");
		String userid = gm.getMember().getUserid();
		log.info(userid);
		
		// 승인해야하는 강의 수
		int lecAgreeTot = lms.lecAgreeCnt();
		
		log.info(year);
		log.info(semester);
		log.info(keyword);
		log.info(status);
		
		int lecTotal = lms.lecTot(lectureVO);
		
		List<LectureVO> lecList = lms.listLec(lectureVO);
		log.info("lecList.size()->{}", lecList.size());
		
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);
		model.addAttribute("keyword", keyword);
		model.addAttribute("status", status);
		model.addAttribute("lecList", lecList);
		model.addAttribute("lecAgreeTot", lecAgreeTot);
		model.addAttribute("lecTotal", lecTotal);
		return "manager/lecManagementForm";
	}
	
	@ResponseBody
	@RequestMapping("lecDetail")
	public LectureVO detail(Long lec_id, Model model) {
		log.info("lecDetail start...");
		
		LectureVO lectureVO = lms.lecDetail(lec_id);
		
		return lectureVO;
	}
	
	@ResponseBody
	@RequestMapping("lecDelete")
	public int detail(Long lec_id) {
		log.info("lecDelete start...");
		
		int result = lms.lecDelete(lec_id);
		
		return result;
	}
	
	@RequestMapping("lecAgree")
	public String agree(LectureVO lectureVO) {
		log.info("lecAgree start...");
		int result2 = 0;
		log.info("lectureVO->{}", lectureVO);
		
		int result = lms.lecAgree(lectureVO);
		log.info("result->{}", result);
		
		if(result > 0) {
			result2 = lms.insertOrders(lectureVO);
			return "redirect:lecManagement";
		} else {
			return "forward:lecManagement";
		}
		
	}
	
	@RequestMapping("lecUpdate")
	public String update(LectureVO lectureVO) {
		log.info("lecUpdate start...");
		log.info("lectureVO->{}", lectureVO);
		
		int result = lms.lecUpdate(lectureVO);
		log.info("result->{}", result);
		
		if(result > 0) {
			return "redirect:lecManagement";
		} else {
			return "forward:lecManagement";
		}
		
	}
}
