package com.oracle.choongangGroup.taewoo.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.choongangGroup.taewoo.domain.Notice;
import com.oracle.choongangGroup.taewoo.repository.NoticeJpaRepository;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class NoticeRestController {
	
	public final NoticeJpaRepository noticeJpaRepository;
	
//	@RequestMapping(value = "updateNotice")
//	public String NoticeUpdate(Notice notice) {
//		System.out.println(notice.getNoticeNum());
//		System.out.println(notice.getNoticeTitle());
//		
//		noticeJpaRepository.save(notice);
//		return null;
//		
//	}
	
//	@RequestMapping(value = "updateNotice")
//	public String NoticeUpdate(@RequestParam(value = "noticeNum") String noticeNum,@RequestParam(value = "noticeTitle") String a,@RequestParam(value = "noticeContent") String b) {
//		System.out.println("start");
//		System.out.println(b);
//		System.out.println(a);
//		
////		noticeJpaRepository.save(notice);
//		return null;
//		
//	}

}
