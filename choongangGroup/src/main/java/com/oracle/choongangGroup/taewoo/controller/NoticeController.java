package com.oracle.choongangGroup.taewoo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.choongangGroup.taewoo.domain.Notice;
import com.oracle.choongangGroup.taewoo.repository.NoticeJpaRepository;
import com.oracle.choongangGroup.taewoo.service.NoticeService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class NoticeController {

	private final NoticeService noticeService;
	private final NoticeJpaRepository noticeJpaRepository;
	
	
	//공지사항 조회
	@GetMapping(value = "/notice/noticeList")
	public String list(Model model) {
		
		List<Notice> noticeList = noticeJpaRepository.findAll();
		log.info("notice.size() --> {}", noticeList.size());
		model.addAttribute("noticeList", noticeList);
		
		return "/manager/notice/noticeList";
	}
	
	// 공지사항 작성 화면
	@GetMapping(value = "/noticeWrite")
	public String createForm() {
		System.out.println("NoticeController createForm Start....");
		return "/manager/notice/createNoticeForm";
	}
	
	// 공지사항 작성
	@PostMapping(value = "/notice/noticeSave")
	public String create(Notice notice) {
		Notice saveNotice = noticeJpaRepository.save(notice);
		log.info("saveNotice --> {}",saveNotice);
		return "redirect:/notice/noticeList";
	}
	
	// 상세화면
	@RequestMapping(value = "/noticeDetail")
	public String detail(Long num, Model model) {
		log.info("Detail start...");
		model.addAttribute("notice", noticeService.findById(num));
		return "/manager/notice/noticeDetail";
	}
	
	// 글 수정
	@PostMapping(value = "/updateNotice")
	public String updateNotice(Notice notice) {
		return "/manager/notice/noticeDetail";
	}

}
