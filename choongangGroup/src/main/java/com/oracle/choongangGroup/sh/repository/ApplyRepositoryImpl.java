package com.oracle.choongangGroup.sh.repository;

import java.util.List;


import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Lecture;


import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ApplyRepositoryImpl implements ApplyRepository {
	private final EntityManager em;
	
	//강의 전체 조회
	@Override
	public List<Lecture> lectureListAll() {
		List<Lecture> list = em.createQuery("select l from Lecture l", Lecture.class).getResultList();
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
	public Lecture lectureFindOne(String lecId) {
		Lecture lecture = em.find(Lecture.class, lecId);
		System.out.println("Repository lecture lectureFindOne lecture.getName()-->"+lecture.getName());
		return lecture;
	}

	@Override
	public void apply(ApplicationLec applyLec) {
		System.out.println("Apply repository apply start...");
		em.persist(applyLec);
		
	}
	
	
	
}
