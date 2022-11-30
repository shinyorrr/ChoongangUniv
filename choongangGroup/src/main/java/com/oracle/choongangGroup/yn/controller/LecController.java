package com.oracle.choongangGroup.yn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Lecture;
import com.oracle.choongangGroup.sh.domain.LectureMember;
import com.oracle.choongangGroup.yn.repository.LecRepository;
import com.oracle.choongangGroup.yn.service.LecService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class LecController {
	private final LecService ls;
	private final LecRepository ri;

	// 로그인된 교수의 강의조회
	@GetMapping(value = "professor/lecCreateList")
	public String findLecList(HttpSession session, Model model) { 
		// 접속아이디 -> 교수 이름 찾기
		String name = (String) session.getAttribute("name");
		System.out.println(name);
		
		///////// 접속 아이디 받아서 넘기기////////////
		List<Lecture> lectureList = ri.findByProf(name);
		System.out.println(lectureList.size());
		model.addAttribute("lecList", lectureList);
		
		return "professor/lecCreateList";
	}
	
	// 강의 한건 조회 -> 업데이트시 사용
	@GetMapping(value = "professor/lecFindById")
	@ResponseBody
	public Lecture findLec(@RequestParam(value = "id") Long id, Model model) {
		
		Lecture lecture = ri.findById(id);
		log.info("lec id == {}" + lecture.getId());
		return lecture;
	}
	
	// 강의 저장 + 이수구분코드 input -> 이수구분 text 컬럼 추가.
	@PostMapping(value = "professor/lecSave") 
	public String saveLec(HttpSession session, Lecture lecture, Model model){
		// 접속이름
		String name = (String) session.getAttribute("name");
			
		log.info("LecController saveLec START ====================");
		log.info("lecture name ====> {}", lecture.getName());
		System.out.println("lecture name ====> "+ lecture.getName());
		
		lecture.setProf(name);
		switch (lecture.getTypeCode()) {
		case "M":
			lecture.setType("전필");
			break;
		case "S":
			lecture.setType("전선");
			break;
		case "C":
			lecture.setType("교양");
			break;

		default:
			break;
		}
		//강의테이블에 저장
		ri.save(lecture);

		return "redirect:/professor/lecCreateList"; 
	}
	
	// 강의 저장 + 이수구분코드 input -> 이수구분 text 컬럼 추가.
//	@GetMapping(value = "professor/lecSearch") 
//	public Lecture 	searchLec(HttpSession session, Lecture lecture, Model model){
//		// 접속이름
//		String name = (String) session.getAttribute("name");
//		
//		
//		log.info("LecController searchLec START ====================");
//		log.info("lecture name ====> {}", lecture.getName());
//		System.out.println("lecture name ====> "+ lecture.getName());
//		
//		lecture.setProf(name);
//		String year = lecture.getYear();
//		String semester = lecture.getSemester();
//		String typeCode = lecture.getTypeCode();
//		String name = lecture.getName();
//		
//		
//		if (lecture.getYear() != null || lecture.getYear() != "") {
//			ri.findByYear(year);
//		}
//		
//			
//		//강의테이블에 저장
//		ri.save(lecture);
//		
//		return "redirect:/professor/lecCreateList"; 
//	}
	
	// 강의 삭제
	@GetMapping(value = "professor/lecDelete") 
	public String deleteLec(@RequestParam(value = "id") Long id, Model model){
		log.info("LecController deleteLec START ====================");
		log.info("LecController id = {}", id);
		
		ri.deleteById(id);
		return "redirect:/professor/lecCreateList"; 
	}	
	
	
	
	// 로그인된 교수의 강의조회
		@GetMapping(value = "professor/lecMgMain")
		public String lecMgList(HttpSession session, Model model) { 
			// 접속아이디 -> 교수 이름 찾기
			String name = (String) session.getAttribute("name");
			System.out.println(name);
			
			///////// 접속교수 이름 받아서 넘기기////////////
			List<Lecture> lectureList = ri.findByProf(name);
			
//			int statusCnt1 = ri.countByProfAndStatus(name, "1");
//			int statusCnt2 = ri.countByProfAndStatus(name, "2");
//			
//			
//			log.info("statusCnt1--> {}",statusCnt1);
//			log.info("statusCnt2--> {}",statusCnt2);
			System.out.println(lectureList.size());
			model.addAttribute("lecList", lectureList);
//			model.addAttribute("statusCnt1", statusCnt1);
//			model.addAttribute("statusCnt2", statusCnt2);
			
			
			return "professor/lecMgMain";
		}
		
		/////// 출석관리
		// 로그인된 교수의 강의조회
		// 강의 한건 조회 
		@GetMapping(value = "professor/lecAttendanceCheck")
		public String findOneLec(@RequestParam(value = "id") Long id, Model model) {
			
			Lecture lecture = ri.findById(id);
			model.addAttribute("lecture",lecture);
			
//			LectureMember lectureMember = ri.findbyUseridAndId
//			
//			Member member = ri.findByUserid();
//			model.addAttribute("memberList",member);
			log.info("lec id == {}" + lecture.getId());
			return "professor/lecCheckForm";
		}
		
		
		
		
		/*
		 * @GetMapping(value = "professor/lecAttendanceCheck") public String
		 * lecAttendanceChk(HttpSession session, Model model) { // 접속아이디 -> 교수 이름 찾기
		 * Lecutre lecture = ri.findById(id);
		 * 
		 * String lecId = (String) session.getAttribute("id");
		 * System.out.println(lecId); // String stName = ApplicationLec. // // /////////
		 * 접속교수 이름 받아서 넘기기//////////// // Member stMember = new Member(); // stMember =
		 * ri.findByUserid(userid); // System.out.println(lectureList.size()); //
		 * model.addAttribute("lecList", lectureList); // return
		 * "professor/lecCheckForm"; }
		 */
	 

}
