package com.oracle.choongangGroup.taewoo.service;



import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.NoSuchElementException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	private final static String VIEWCOOKIENAME = "alreadyViewCookie";

	public Notice findById(Long noticeNum) {
		
		Notice notice = noticeJpaRepository.findById(noticeNum).orElseThrow(() -> new NoSuchElementException());
		return notice;
	}

	public List<Notice> searchNotice(String keyword) {
		System.out.println("NoticeService searchNotice start....");
		
		List<Notice> searchNoticeList = noticeJpaRepository.findBynoticeTitleContaining(keyword);
		
		return searchNoticeList;
	}
	
	
	public int updateHit(Long noticeNum, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("noticeNum -->" + noticeNum);
		
		Cookie[] cookies = request.getCookies();
		boolean checkCookie = false;
		int result = 0;
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				// 조회한 경우 체크
				if(cookie.getName().equals(VIEWCOOKIENAME+noticeNum)) checkCookie = true;
			}
			if (!checkCookie) {
				Cookie newCookie = createCookieForForNotOverLap(noticeNum);
				response.addCookie(newCookie);
				result = noticeJpaRepository.updateHit(noticeNum);
			}
		} else {
			Cookie newCookie = createCookieForForNotOverLap(noticeNum);
			response.addCookie(newCookie);
			result = noticeJpaRepository.updateHit(noticeNum);
		}
		return result;
	}

	/*
	 * 조회수 중복 방지를 위한 쿠키 생성 메소드
	 * @param cookie
	 * @return
	 */		
	private Cookie createCookieForForNotOverLap(Long noticeNum) {
		Cookie cookie = new Cookie(VIEWCOOKIENAME+noticeNum, String.valueOf(noticeNum));
		cookie.setComment("조회수 중복 증가 방지 쿠키");  	// 쿠키 용도 설명
		cookie.setMaxAge(getRemainSecondForTommorow());	 	// 하루를 준다.
		cookie.setHttpOnly(true); 							// 서버에서만 조작가능
		return cookie;
	}
	
	// 다음 날 정각까지 남은 시간(초)
	private int getRemainSecondForTommorow() {
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime tommorow = LocalDateTime.now().plusDays(1L).truncatedTo(ChronoUnit.DAYS);
		return (int) now.until(tommorow, ChronoUnit.SECONDS);
	}


	

	
}
