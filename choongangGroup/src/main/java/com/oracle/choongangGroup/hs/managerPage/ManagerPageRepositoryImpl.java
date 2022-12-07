package com.oracle.choongangGroup.hs.managerPage;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class ManagerPageRepositoryImpl implements ManagerPageRepository {
	
	private final EntityManager em;

	@Override
	public Member memberFindOne(String userid) {
		log.info("mypage Start...");
		Member member = em.find(Member.class, userid);
		return member;
	}
}
