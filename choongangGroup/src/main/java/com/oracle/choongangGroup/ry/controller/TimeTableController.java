package com.oracle.choongangGroup.ry.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.choongangGroup.hj.model.GradeVo;
import com.oracle.choongangGroup.hj.model.MemberVo;
import com.oracle.choongangGroup.ry.model.TimeTableVo;
import com.oracle.choongangGroup.ry.service.TimeTableService;
import com.oracle.choongangGroup.sh.domain.Lecture;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class TimeTableController {

	private TimeTableService tts;


	//아이디 받아와서 학적 조회 
		@RequestMapping(value="Emp")
		public String MemberList(String userid , Model model) {
			System.out.println("TimeTableController MemberList start. . .  . . ");
			////아이디 임시로 받아오기//
			userid = "22100001";
			MemberVo member = tts.list(userid);
			model.addAttribute("member", member);
			model.addAttribute("userid" ,userid);
		
			return "student/detailList";
		}
		
		@GetMapping(value = "timeTableForm")
		public String timeTableList(Model model ) {
			System.out.println(" TimeTableController timeTableList start . . . ");
			
			List<TimeTableVo> timeTable =tts.timeTableList();
			model.addAttribute("timeTable", timeTable);
			
			return "student/timeTableForm";
		}
}
