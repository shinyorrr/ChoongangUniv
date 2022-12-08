package com.oracle.choongangGroup.sh.controller;

import java.time.LocalDate;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.dongho.auth.GetMember;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.ApplyTime;
import com.oracle.choongangGroup.sh.domain.Lecture;
import com.oracle.choongangGroup.sh.service.ApplyService;

import lombok.RequiredArgsConstructor;
import lombok.val;





@Controller
@RequiredArgsConstructor
public class ApplyController {
	private final ApplyService as;
	private final GetMember gm;
	
	
	//기간안내  & 수강신청,장바구니 선택 페이지 
	@GetMapping(value = "applyIndex")
	public String applyIndex(String userid, Model model) {
		/////////접속 아이디 받아서 넘기기////////////
		//String userid = gm.getMember().getName();
		userid = "1111";
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		
		//장바구니 기간 불러오기
		String select = "like";
		ApplyTime likeTime = as.findTime(year, month, select);
		//수강신청 기간 불러오기
		select = "apply";
		ApplyTime applyTime = as.findTime(year, month, select);
		
		model.addAttribute("likeTime", likeTime);
		model.addAttribute("applyTime", applyTime);
		model.addAttribute("userid", userid);
		return "student/applyIndex";
	}
	
	//장바구니 메인 [장바구니안내문, 신청, 시간표]
	@GetMapping(value = "likeMain")
	///////////장바구니 기간 넘겨주기///////////
	public String likeMain(String userid, Model model) {
		model.addAttribute("userid", userid);
		return "student/likeMain";
	}
	
	//장바구니 신청 페이지
	@GetMapping(value = "likeForm")
	public String likeForm(String userid, Model model, @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable) {			
		List<ApplicationLec> likeList = as.likeListAll(userid);
		
		model.addAttribute("likeList", likeList);
		model.addAttribute("userid", userid);	
		
		Page<Lecture> lectureList = as.pageList(pageable);
		int pageNum = lectureList.getPageable().getPageNumber(); //현재페이지
		int totalPage = lectureList.getTotalPages();//총페이지수
		int pageBlock = 5; //블럭의 수
		int startBlockPage = ((pageNum)/pageBlock)*pageBlock+1; 		
		int endBlockPage = startBlockPage+pageBlock-1;
		endBlockPage= totalPage<endBlockPage? totalPage:endBlockPage;
		model.addAttribute("startBlockPage", startBlockPage);
		model.addAttribute("endBlockPage", endBlockPage);
		model.addAttribute("lectureList", lectureList);
		
		return "student/likeForm";
	}
	
	//장바구니 신청
	@ResponseBody
	@GetMapping(value = "like")
	public int like(Long lecId, String userid, Model model) {
		
		//장바구니 구분
		Long gubun = 1L;
		int result = as.apply(lecId, userid, gubun);
		return result;
	}
	
	//수강신청 목록 선택 --> 장바구니/전체강의
	@GetMapping(value = "applySelect")
	public String applySelect(String userid, Model model) {
		model.addAttribute("userid", userid);
		return "student/applySelect";
	}
	
	//선택에따른 수강신청 목록 조회
	@GetMapping(value = "applyForm")
	public String applyForm( String userid , Model model, @RequestParam("select") String select) {	
		System.out.println("넘어온 파라미터 ----->"+select);
		List<Lecture> lectureList = as.lectureListAll();
		List<ApplicationLec> applicationLecList = as.likeListAll(userid);
		if(select.equals("all") ) {
			model.addAttribute("list", lectureList);			
		}else {
			model.addAttribute("list", applicationLecList);						
		}
		model.addAttribute("userid", userid);
		model.addAttribute("select", select);
		return "student/applyForm";
	}
	
	//수강신청
	@ResponseBody
	@GetMapping(value = "apply")
	public int apply(Long lecId, String userid, Model model) {
		System.out.println("Applycontroller apply start...");
		//수강신청 구분
		Long gubun = 2L;
		int result = as.apply(lecId, userid, gubun);
		System.out.println("수강신청 결과------->"+result);
		return result;
	}
	

	//장바구니, 수강신청 기간 등록 폼
	@GetMapping(value = "registerTimeForm")
	public String registerTimeForm(Model model){
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		model.addAttribute("year", year);
		return "student/registerTimeForm";
	}

	//기간 등록
	@GetMapping(value = "registerTime")
	public String registerTime(ApplyTime applyTime) { //@ModelAttribute 생략
		ApplyTime time = new ApplyTime();
		int result = as.register(applyTime);
		return "redirect:/registerTimeForm";
	}
	

}
