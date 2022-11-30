package com.oracle.choongangGroup.dongho.professor;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.sh.domain.Lecture;
import com.oracle.choongangGroup.sh.domain.Report;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class DhProfessorServiceImpl implements DhProfessorService {
	private final DhProfessorLecRepository lr;
	private final DhProfessorReportRepository rr;
	
	@Override
	public List<Lecture> findByProf(String profName) {
		return lr.findByProf(profName);
	}

	@Override
	public Page<Report> findPageByLecture_Id(Long id, Pageable pageable) {
		return rr.findPageByLecture_Id(id, pageable);
	}


}
