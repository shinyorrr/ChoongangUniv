package com.oracle.choongangGroup.taewoo.service;



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


	

	
}
