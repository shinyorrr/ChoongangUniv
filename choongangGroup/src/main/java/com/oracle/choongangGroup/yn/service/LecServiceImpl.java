package com.oracle.choongangGroup.yn.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.Lecture;
import com.oracle.choongangGroup.yn.repository.LecRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class LecServiceImpl implements LecService {
	
	private final LecRepository ar;

//	@Override
//	public void lectureSave(Lecture lecture) {
//		log.info("LecServiceImpl SAVE lecture.getMaxCount() -> {}", lecture.getMaxCount());
//		ar.lecSave(lecture);
//		return;
//	}



}
