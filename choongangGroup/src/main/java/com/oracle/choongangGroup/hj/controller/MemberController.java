package com.oracle.choongangGroup.hj.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.dongho.auth.GetMember;
import com.oracle.choongangGroup.hj.model.GradeVo;
import com.oracle.choongangGroup.hj.model.MemberVo;
import com.oracle.choongangGroup.hj.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor

public class MemberController {

	private final MemberService ms;
	private final GetMember gm;

	// 아이디 받아와서 학적 조회
	@RequestMapping(value = "listEmp")
	public String MemberList(String userid, Model model , HttpServletRequest request) {
		System.out.println("MemberController MemberList start. . .  . . ");
	
		//String userid = gm.getMember().getUserid();
				
		HttpSession session = request.getSession();
		userid = (String) session.getAttribute("userid");
		
		MemberVo member = ms.list(userid);
		model.addAttribute("member", member);
		model.addAttribute("userid", userid);

		return "student/detailList";
	}

	//학적수정화면
	@GetMapping(value = "updateFormMember")
	public String updateFormMember(String userid, Model model) {
		System.out.println(" MemberController updateFormMember start . . . ");
		MemberVo member = ms.list(userid);
		model.addAttribute("member", member);
		model.addAttribute("userid", userid);

		return "student/updateFormMember";

	}

	//  학적 수정
	@PostMapping(value = "updateMember")
	public String updateEmp(MemberVo member, Model model) {
		log.info("MemberController updateEmp start. . . ");
        System.out.println("member---->"+member);
		
		int updateCount = ms.updateMember(member);

		model.addAttribute("uptcnt", updateCount);
		return "redirect:listEmp ";

	}

	// 성적조회페이지
	@GetMapping(value = "gradeList")
	public String gradeListForm(String userid, Model model, HttpServletRequest request) {
		System.out.println(" MemberController gradeListForm start . . . ");

		//아이디 받아오기 
		HttpSession session = request.getSession();
		userid = (String) session.getAttribute("userid");
		// 이름 가져오기위해서 해줌
		MemberVo memberinfo = ms.infoList(userid);

		// 셀렉트바  학년 년도
		List<GradeVo> ysList = ms.findys(userid);
	
		//총 학점 평균 조회
		GradeVo grade = ms.sutotal(userid);
		grade.setStotal(grade.getStotal());   //신청학점토탈 
		grade.setUtotal(grade.getUtotal());		//신청한 성적토탈 
		grade.setMajorutotal(grade.getMajorutotal());   //신청한 전공학점토탈
		grade.setSubutotal(grade.getSubutotal());		//신청한 교양학점토탈 
		grade.setAvg(grade.getAvg());   //총성적평균
		
		model.addAttribute("member", memberinfo);
		model.addAttribute("ysList"  , ysList);
		model.addAttribute("grade", grade);
		
	
		

	    System.out.println("gradeListFrom 으로 반환");

		return "student/gradeListForm";
	}

	//년도학기별로 신청한 과목 성적 조회
	//ajax 사용해서 넘어옴 
	@ResponseBody
	@GetMapping(value = "gradeDetailList")
	public List<GradeVo> gradeDetailList(String userid ,String ys) {


	System.out.println(" MemberController gradeDetailList start . . . ");
	System.out.println("넘어온 userid *************** >"+userid);
	System.out.println( "넘어온 lec_year *********** >  "+ys );
	
	//년도 학기 따로 조회하기위해 짤라주기  --> 2022,2 
	String lec_year = ys.substring(0,4);    //2022
	String lec_semester= ys.substring(5,6);    //2
	

	System.out.println(" lec_year짜름 ---------->"+lec_year);
	System.out.println(" lec_semester짜름 ------->"+lec_semester);
	

	//성적조회할대 짤라준 년도 학기 넣기 
	List<GradeVo> gradeList = ms.listgrade(userid ,lec_year, lec_semester);
	System.out.println("gradeList :" + gradeList.get(0).toString());
	
	//아작스의 성공시(data)에 gradeList 들어감 
	return gradeList;

	
	

	}
	


}
