package com.oracle.choongangGroup.yn.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.dongho.auth.GetMember;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Grade;
import com.oracle.choongangGroup.sh.domain.Lecture;
import com.oracle.choongangGroup.yn.repository.GradeRepository;
import com.oracle.choongangGroup.yn.repository.GradeRepositoryCustom;
import com.oracle.choongangGroup.yn.repository.LecApplicationRepository;
import com.oracle.choongangGroup.yn.repository.LecRepository;
import com.oracle.choongangGroup.yn.repository.LecRepositoryImpl;
import com.oracle.choongangGroup.yn.service.LecService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequiredArgsConstructor
@Slf4j
public class LecController {
	private final LecService ls;
	private final LecRepository ri;
	private final GradeRepository gr;
	private final LecApplicationRepository ar;
	private final LecRepositoryImpl lm;
	private final GradeRepositoryCustom gcm;
	private final GetMember gm;

	// 로그인된 교수의 강의조회
	@GetMapping(value = "professor/lecCreateList")
	public String findLecList(/* HttpSession session, */ Model model) { 
		
		// 접속아이디 -> 교수 이름 찾기
		String name = gm.getMember().getName();
		/* String name = (String) session.getAttribute("name"); */
		System.out.println(name);
		
		///////// 접속 아이디 받아서 넘기기////////////
		List<Lecture> lectureList = ri.findByProfOrderByIdAsc(name);
		System.out.println("lectureList.size() --> "+ lectureList.size());
		model.addAttribute("lecCnt", lectureList.size());
		model.addAttribute("lecList", lectureList);
		
		return "professor/lecCreateList";
	}
	
	
	// 강의 한건 조회 -> 업데이트시 사용
	@GetMapping(value = "professor/lecFindById")
	@ResponseBody
	public Lecture findLec(@RequestParam(value = "id") Long id, Model model) {
		
		Lecture lecture = ri.findById(id);
		log.info("lec id == {}", lecture.getId());
		return lecture;
	}
	
	// 강의 저장 + 이수구분코드 input -> 이수구분 text 컬럼 추가.
	@PostMapping(value = "professor/lecSave") 
	public String saveLec(/* HttpSession session, */Lecture lecture, Model model){
		// 접속이름
		/* String name = (String) session.getAttribute("name"); */
		String name = gm.getMember().getName();	
		
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
	@PostMapping(value = "professor/lecSearch")
	@ResponseBody
	public List<Lecture> searchLec(/* HttpSession session, */ Lecture lecture, Model model){
		// 접속이름
		/* String name = (String) session.getAttribute("name"); */
		String name = gm.getMember().getName();	
		
		log.info("LecController searchLec START ====================");
		log.info("YEAR ==================== {}", lecture.getYear());
		log.info("getSemester ==================== {}", lecture.getSemester());
		log.info("getName ==================== {}", lecture.getName());
		
		if(lecture.getTypeCode() != null && !"".equals(lecture.getTypeCode())) {
			lecture.setTypeCode(lecture.getTypeCode().substring(0, lecture.getTypeCode().length() - 1));
		}
		
		
		List<Lecture> serchList = lm.searchLec(lecture, name);
		System.out.println("serchList -->" + serchList.size());
		model.addAttribute("lecCnt", serchList.size());
		
		log.info("serchList ==================== {}", serchList);
		
		
		return serchList; 
	}
	
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
			List<Lecture> lectureList = ri.findByProfOrderByIdAsc(name);
			
//			int statusCnt1 = ri.countByProfAndStatus(name, "1");
//			int statusCnt2 = ri.countByProfAndStatus(name, "2");
			System.out.println(lectureList.size());
			model.addAttribute("lecList", lectureList);
			
			
			return "professor/lecMgMain";
		}
		
		/*
		 * 출석관리  
		 * 1. 교수의 강의 한건 조회.(findById)
		 * 2. 강의를 듣는 Member(학생) 조회 .(findByLecture_IdAndGubun)
		 */
		@GetMapping(value = "professor/lecAttendanceCheck")
		public String selectOneLec(@RequestParam(value = "id") Long id, Model model) {
			System.out.println("=====selectOneLec Start=====");
			Lecture lecture = ri.findById(id);
			Long gubun = (long) 1;
			List<ApplicationLec> alList = ls.findByLecture_IdAndGubun(id, gubun);
			
			List<Member> memList = new ArrayList<Member>();
			for (ApplicationLec applicationLec : alList) {
				memList.add(applicationLec.getMember());
				System.out.println("getUserid ==> "+ applicationLec.getMember().getUserid());
				System.out.println("getName ==> "+ applicationLec.getMember().getName());
			}
			
			
			model.addAttribute("lecture",lecture);
			model.addAttribute("memList", memList);
			
			log.info("lec id == {}", lecture.getId());
			return "professor/lecCheckForm";
		}

		
		///////// 성적입력페이지 시작 ////
		@GetMapping(value = "professor/lecScore")
		public String lecScore(Model model) {
			String name = gm.getMember().getName();
			List<Lecture> lecList = ri.findByProfAndStatusOrderByIdAsc(name, "0");
			System.out.println("lecList.size() --> "+ lecList.size());
			
			model.addAttribute("lecList",lecList);
			model.addAttribute("lecCnt",lecList.size());
			
			return "professor/lecScoreForm";
		}

		// 강의 한건 조회 -> 업데이트시 사용
		@GetMapping(value = "professor/lecScoreForm")
		@ResponseBody
		public Map<String, Object> lecScoreForm(@RequestParam(value = "id") Long id, Model model) {
			Long gubun = (long) 1;
			List<ApplicationLec> alList = ls.findByLecture_IdAndGubun(id, gubun);
			
			List<Member> memList = new ArrayList<Member>();
			List<Grade> grList = new ArrayList<Grade>();
			
			Map<String, Object> map = new HashMap<>();
			
			for (ApplicationLec applicationLec : alList) {
				memList.add(applicationLec.getMember());
				System.out.println("getUserid ==> "+ applicationLec.getMember().getUserid());
				System.out.println("getName ==> "+ applicationLec.getMember().getName());
				grList.add(gr.findByApplicationLec(applicationLec));
			}
			log.info("나는 맴버 리스트 : {}", memList);
			System.out.println("나는 성적 리스트 : " + grList);
			map.put("memList", memList);
			map.put("grList", grList);
			return map;
		}
		
		@PostMapping(value = "professor/lecScoreSave")
		@ResponseBody
		public Grade lecScoreSave(@RequestParam(value = "data") String data,
								  @RequestParam(value = "lecId") Long lecId, Model model) {
//			JSONParser parser = new JSONParser();
//			JSONObject object = (JSONObject) parser.parse(lecId);
			
			JSONArray jarray = new JSONArray(data);

			
			ApplicationLec applicationLec = new ApplicationLec();
			Member mem = new Member();
			Lecture lec = new Lecture();
			for(int i = 0; i < jarray.length(); i++) {
				Grade grade = new Grade();
//				System.out.println("jarray.getJSONArray(i) ->" + jarray.getJSONObject(i));
				System.out.println("나는 유저 ->" + jarray.getJSONObject(i).get("userid"));
//				System.out.println("나는 과제 ->" + jarray.getJSONObject(i).get("report"));
//				System.out.println("나는 중간 ->" + jarray.getJSONObject(i).get("midterm"));
				System.out.println("나는 기말 ->" + jarray.getJSONObject(i).get("finals"));
//				System.out.println("나는 출석 ->" + jarray.getJSONObject(i).get("attendance"));
				lec.setId(lecId);
				mem.setUserid(jarray.getJSONObject(i).getString("userid"));
				applicationLec.setLecture(lec);
				applicationLec.setMember(mem);

				grade.setAttendance(jarray.getJSONObject(i).getLong("attendance"));		
				grade.setFinals(jarray.getJSONObject(i).getLong("finals"));		
				grade.setMidterm(jarray.getJSONObject(i).getLong("midterm"));		
				grade.setReport(jarray.getJSONObject(i).getLong("report"));		
				grade.setApplicationLec(applicationLec);	
				
				gr.save(grade);	
			}
			
			return null;
		}
		
		
}
