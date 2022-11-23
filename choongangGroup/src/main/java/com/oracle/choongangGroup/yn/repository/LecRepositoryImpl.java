package com.oracle.choongangGroup.yn.repository;

import java.util.List;


import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.yn.domain.AppliLec;
import com.oracle.choongangGroup.yn.domain.Lec;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class LecRepositoryImpl implements LecRepository {
	private final EntityManager em;
	
	//강의 전체 조회
	@Override
	public List<Lec> lecListAll() {
		List<Lec> list = em.createQuery("select l from Lec l", Lec.class).getResultList();
		return list;
	}

	//사용자코드로 사용자정보불러오기
	@Override
	public Member memberFindOne(String userid) {
		System.out.println("repository memberFindOne start...");
		Member member = em.find(Member.class, userid);
		System.out.println("Repository Member memberFindOne member.getName()-->"+member.getName());
		return member;
	}

	//강의코드로 강의정보 불러오기
	@Override
	public Lec lectureFindOne(String lecId) {
		Lec lecture = em.find(Lec.class, lecId);
		System.out.println("Repository lecture lectureFindOne lecture.getName()-->"+lecture.getName());
		return lecture;
	}

	@Override
	public void apply(AppliLec applyLec) {
		System.out.println("Apply repository apply start...");
		em.persist(applyLec);
		
	}

	
	
	
}
