package com.oracle.choongangGroup.sh.service;

import java.util.List;


import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.ApplyTime;
import com.oracle.choongangGroup.sh.domain.Lecture;

import com.oracle.choongangGroup.sh.repository.ApplyRepository;
import com.oracle.choongangGroup.sh.repository.LikeRepository;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ApplyServiceImpl implements ApplyService {
	
	private final LikeRepository lr;
	private final ApplyRepository ar;
	
	//전체 개설 강의 리스트 조회
	@Override
	public List<Lecture> lectureListAll() {
		List<Lecture> list = ar.lectureListAll();
		return list;
	}

	//장바구니 담은 강의 리스트 조회
	@Override
	public List<ApplicationLec> likeListAll(String userid) {
		List<ApplicationLec> list = lr.likeListAll(userid);
		return list;
	}

	//장바구니신청
	@Override
	public int apply(Long lecId, String userid, Long gubun) {
		int result = 0;
		Member member = ar.memberFindOne(userid);
		Lecture lecture = ar.lectureFindOne(lecId);
		ApplicationLec applyLec = ApplicationLec.apply(member, lecture, gubun);
		if(gubun == 1) {
			result = lr.apply(applyLec); //장바구니 신청
		}else { 
			result = ar.apply(applyLec); //실제 수강신청
		}
		
		return result;
	}

	@Override
	public void register(ApplyTime applyTime) {
		ar.register(applyTime);
		
	}



	

	
	
	
	

















}
