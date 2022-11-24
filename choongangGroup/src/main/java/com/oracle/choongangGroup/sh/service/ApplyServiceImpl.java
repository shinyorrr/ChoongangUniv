package com.oracle.choongangGroup.sh.service;

import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Lecture;

import com.oracle.choongangGroup.sh.repository.ApplyRepository;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ApplyServiceImpl implements ApplyService {
	
	private final ApplyRepository ar;
	
	//전체 개설 강의 조회
	@Override
	public List<Lecture> lectureListAll() {
		List<Lecture> list = ar.lectureListAll();
		return list;
	}


	//장바구니신청, 수강신청
	@Override
	public int apply(Long lecId, String userid, int gubun) {
		Member member = ar.memberFindOne(userid);
		Lecture lecture = ar.lectureFindOne(lecId);
		ApplicationLec applyLec = ApplicationLec.apply(member, lecture, gubun);
		int result = ar.apply(applyLec);
		return result;
	}














}
