package com.oracle.choongangGroup.yn.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.yn.domain.AppliLec;
import com.oracle.choongangGroup.yn.domain.Lec;
import com.oracle.choongangGroup.yn.repository.LecRepository;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class LecServiceImpl implements LecService {
	
	private final LecRepository ar;
	
	//전체 개설 강의 조회
	@Override
	public List<Lec> lecCreateListAll() {
		List<Lec> list = ar.lecListAll();
		return list;
	}

	//수강신청
	@Override
	public void apply(String lecId, String userid) {
		System.out.println("ApplyService apply start...");
		Member member = ar.memberFindOne(userid);
		Lec lecture = ar.lectureFindOne(lecId);
		
		AppliLec applyLec = AppliLec.createLec(member, lecture);
		ar.apply(applyLec);
	}

	@Override
	public List<Lec> lectureListAll() {
		// TODO Auto-generated method stub
		return null;
	}



}
