package com.oracle.choongangGroup.yn.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Lecture;
import com.oracle.choongangGroup.yn.repository.LecApplicationRepository;
import com.oracle.choongangGroup.yn.repository.LecRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class LecServiceImpl implements LecService {
	
	private final LecRepository lr;
	private final LecApplicationRepository ar;


	@Override
	public List<ApplicationLec> findByLecture_IdAndGubun(Long id, Long gubun) {
		return ar.findByLecture_IdAndGubun(id, gubun);
	}



}
