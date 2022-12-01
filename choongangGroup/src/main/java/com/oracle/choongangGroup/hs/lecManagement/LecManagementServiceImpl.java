package com.oracle.choongangGroup.hs.lecManagement;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
@RequiredArgsConstructor
public class LecManagementServiceImpl implements LecManagementService {
	
	private final LecManagementDao lmd;

	@Override
	public List<LectureVO> listLec(LectureVO lectureVO) {
		log.info("listLec start...");
		List<LectureVO> lecList = null;
		lecList = lmd.listLec(lectureVO);
		return lecList;
	}

	@Override
	public int lecTot() {
		log.info("lecTot start...");
		int lecTotal = lmd.lecTot();
		return lecTotal;
	}

	@Override
	public LectureVO lecDetail(Long lec_id) {
		log.info("lecDetail start...");
		LectureVO lectureVO = lmd.lecDetail(lec_id);
		return lectureVO;
	}
}
