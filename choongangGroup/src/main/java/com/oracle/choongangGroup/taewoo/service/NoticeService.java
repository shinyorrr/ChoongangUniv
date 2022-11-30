package com.oracle.choongangGroup.taewoo.service;



import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.taewoo.domain.Notice;
import com.oracle.choongangGroup.taewoo.repository.NoticeJpaRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class NoticeService {
	
	private final NoticeJpaRepository noticeJpaRepository;

	public Notice findById(Long noticeNum) {
		
		Notice notice = noticeJpaRepository.findById(noticeNum).orElseThrow(() -> new NoSuchElementException());
		return notice;
	}

	public List<Notice> searchNotice(String keyword) {
		System.out.println("NoticeService searchNotice start....");
		
		List<Notice> searchNoticeList = noticeJpaRepository.findBynoticeTitleContaining(keyword);
		
		return searchNoticeList;
	}
	
	
	public int updateHit(Long noticeNum) {
		System.out.println("noticeNum -->" + noticeNum);
		return noticeJpaRepository.updateHit(noticeNum);
	}


	

	
}
