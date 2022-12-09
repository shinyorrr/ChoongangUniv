package com.oracle.choongangGroup.dongho.professor.makeup;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjuster;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/professor")
public class DhProfessorMakeupController {
	private final DhProfessorMakeupSerivce dhProfessorMakeupSerivce;
	
	// 휴보강 신청 페이지 요청
	@GetMapping("/makeupPage")
	public String makeupPage() {

		return "/professor/makeup";
	}
	
	@GetMapping("/mainTest")
	public String mainTest() {
		return "/professor/mainTest";
	}
	
}
