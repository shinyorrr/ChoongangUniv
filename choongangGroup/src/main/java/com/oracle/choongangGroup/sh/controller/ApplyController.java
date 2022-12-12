package com.oracle.choongangGroup.sh.controller;

import java.time.LocalDate;


import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
import org.springframework.web.bind.annotation.RequestMapping;
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




@RequestMapping("/student/")
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

		String year = getYear();
		String semester = getSemester();
		String lecName = "aa";
		
		Page<Lecture> lectureList = as.lectureList(year,semester,pageable);
		Page<Lecture> lectureSearch = as.findByName(year,semester,lecName,pageable); //강의명으로 검색한 목록 
		if(!lecName.isEmpty()) {
			int pageNum = lectureSearch.getPageable().getPageNumber(); //현재페이지
			int totalPage = lectureSearch.getTotalPages();//총페이지수
			int pageBlock = 5; //블럭의 수
			int startBlockPage = ((pageNum)/pageBlock)*pageBlock+1; 		
			int endBlockPage = startBlockPage+pageBlock-1;
			endBlockPage= totalPage<endBlockPage? totalPage:endBlockPage;
			model.addAttribute("startBlockPage", startBlockPage);
			model.addAttribute("endBlockPage", endBlockPage);
			model.addAttribute("lectureList", lectureSearch);
		}else {
			int pageNum = lectureList.getPageable().getPageNumber(); //현재페이지
			System.out.println("likeForm pageNum ------------------------->"+pageNum);
			int totalPage = lectureList.getTotalPages();//총페이지수
			int pageBlock = 5; //블럭의 수
			int startBlockPage = ((pageNum)/pageBlock)*pageBlock+1; 		
			int endBlockPage = startBlockPage+pageBlock-1;
			endBlockPage= totalPage<endBlockPage? totalPage:endBlockPage;
			model.addAttribute("startBlockPage", startBlockPage);
			model.addAttribute("endBlockPage", endBlockPage);
			model.addAttribute("lectureList", lectureList);		
		}
		model.addAttribute("userid", userid);	
		
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
	public String applyForm( String userid , String lecName, String page , Model model, 			
								@PageableDefault(size = 10,sort = "id", direction = Sort.Direction.DESC ) @Qualifier("lecture") Pageable pageable,								
			 					@PageableDefault(size = 10, sort = "member.userid", direction = Sort.Direction.DESC) @Qualifier("applicationLec") Pageable pageable2,
								@RequestParam("select") String select) {	
		//@PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) @Qualifier("Lecture") Pageable pageable2,
        System.out.println("ApplyController applyForm start...");
        System.out.println("ApplyController applyForm start...");
   
		String year = getYear();
		String semester = getSemester();
		
		//List<Lecture> list = as.lectureListAll();
		if(lecName.isEmpty()) {
			lecName = "empty";
		}
		

		//페이징
		
		Page<Lecture> lectureList = as.lectureList(year,semester,pageable); //전체강의목록
		int pageNum2 = lectureList.getPageable().getPageNumber(); //현재페이지
		System.out.println("applyForm page->"+page);
		System.out.println("applyForm pageNum2->"+pageNum2);
		Page<Lecture> lectureSearch = as.findByName(year,semester,lecName,pageable); //강의명으로 검색한 목록 
		Page<ApplicationLec> applicationLecList = as.likeList(userid,year,semester,pageable2); //장바구니목록
		
		System.out.println("----------------------------------------------------------------------");
				
		if(select.equals("all") ) {	 //신청할 년도,학기의 전체 개설 강의 목록		
			int pageNum = lectureList.getPageable().getPageNumber(); //현재페이지
			System.out.println("applyForm pageNum->"+pageNum);
			int totalPage = lectureList.getTotalPages();//총페이지수
			int pageBlock = 5; //블럭의 수
			int startBlockPage = ((pageNum)/pageBlock)*pageBlock+1; 		
			int endBlockPage = startBlockPage+pageBlock-1;
			endBlockPage= totalPage<endBlockPage? totalPage:endBlockPage;
			model.addAttribute("startBlockPage", startBlockPage);
			model.addAttribute("endBlockPage", endBlockPage);
			model.addAttribute("lectureList", lectureList);	
		}else if (!lecName.equals("empty")) {
			int pageNum = lectureSearch.getPageable().getPageNumber(); //현재페이지
			int totalPage = lectureSearch.getTotalPages();//총페이지수
			int pageBlock = 5; //블럭의 수
			int startBlockPage = ((pageNum)/pageBlock)*pageBlock+1; 		
			int endBlockPage = startBlockPage+pageBlock-1;
			endBlockPage= totalPage<endBlockPage? totalPage:endBlockPage;
			model.addAttribute("startBlockPage", startBlockPage);
			model.addAttribute("endBlockPage", endBlockPage);
			model.addAttribute("lectureList", lectureSearch);	
			select = "all";
		}else {						 //신청할 년도,학기의 장바구니 강의 목록
			int pageNum = applicationLecList.getPageable().getPageNumber(); //현재페이지
			int totalPage = applicationLecList.getTotalPages();//총페이지수
			int pageBlock = 5; //블럭의 수
			int startBlockPage = ((pageNum)/pageBlock)*pageBlock+1; 		
			int endBlockPage = startBlockPage+pageBlock-1;
			endBlockPage= totalPage<endBlockPage? totalPage:endBlockPage;
			model.addAttribute("startBlockPage", startBlockPage);
			model.addAttribute("endBlockPage", endBlockPage);
			model.addAttribute("lectureList", applicationLecList);	
		
		}
		model.addAttribute("userid", userid);
		model.addAttribute("select", select);
		model.addAttribute("year", year);
		model.addAttribute("semester", semester);
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
	
	public String getYear() {
		LocalDate now = LocalDate.now();
		String year = String.valueOf(now.getYear());
		return year;
	}
	
	public String getSemester() {
		LocalDate now = LocalDate.now();
		int month = now.getMonthValue();
		String semester = "";
		if(month>5 && month<=10) {
			semester = "2";					
		}else {
			semester = "1";			
		}
		
		return semester;
	}

	
	
	
}
