package com.oracle.choongangGroup.hs.managerPage;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
@RequiredArgsConstructor
public class ManagerPageServiceImpl implements ManagerPageService {
	
	private final ManagerPageRepository mr;

	@Override
	public Member memberFindOne(String userid) {
		log.info("mypage Start...");
		Member member = mr.memberFindOne(userid);
		return member;
	}
}
