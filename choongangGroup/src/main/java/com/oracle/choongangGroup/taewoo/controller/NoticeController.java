package com.oracle.choongangGroup.taewoo.controller;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	//공지사항 List
	@GetMapping(value = "/notice/noticeList")
	public String listPage(Model model,
						   @RequestParam(required = false, defaultValue = "0", value="page") int page) {
		// 페이징처리
		Page<Notice> noticeList = noticeJpaRepository.findAll(PageRequest.of(page, 10, Sort.by(Sort.Direction.DESC,"noticeNum")));
		int noticeTotal = noticeList.getTotalPages();
		
		model.addAttribute("page",page);
		model.addAttribute("noticeTotal", noticeTotal);
		model.addAttribute("noticeList", noticeList.getContent());
		
		return "/manager/notice/noticeList";
	}
	
	// 검색 기능
	@RequestMapping(value = "/notice/search")
	public String SearchNotice(Model model, String keyword) {
		log.info("keyword --> {}", keyword);
		List<Notice> searchNotice = noticeService.searchNotice(keyword);
		String msg = "";
		if(searchNotice == null) {
			msg += "다시 입력해주세요";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("noticeList",searchNotice);
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
		log.info("NoticeController create start....");
		 noticeJpaRepository.save(notice);
		return "redirect:/notice/noticeList";
	}
	
	// 상세화면
	@RequestMapping(value = "/noticeDetail")
	public String detail( Long noticeNum, Model model) {
		log.info("Detail start...");
		System.out.println("noticeNum -> " + noticeNum);
		model.addAttribute("notice", noticeService.findById(noticeNum));
		noticeService.updateHit(noticeNum);
		return "/manager/notice/noticeDetail";
	}
	
	// 글 수정	
	@RequestMapping(value = "updateNotice")
	public String NoticeUpdate(Notice notice) {
		System.out.println("start");
		System.out.println(notice.getNoticeNum());
		System.out.println(notice.getNoticeTitle());
		
		noticeJpaRepository.save(notice);
		return "/manager/notice/noticeDetail";
	}
	
	// 글 삭제
	@RequestMapping(value = "/deleteNotice")
	public String NoticeDelete(Notice notice) {
		System.out.println("NoticeDelete start....");
		System.out.println("notice.getNoticeNum() ->" + notice.getNoticeNum());
		
		noticeJpaRepository.delete(notice);
		
		return "redirect:/notice/noticeList";
	}
	
	
}
