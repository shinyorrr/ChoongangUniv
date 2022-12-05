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
	public int lecAgreeCnt() {
		log.info("lecAgreeCnt start...");
		int lecAgreeTotal = lmd.lecAgreeCnt();
		return lecAgreeTotal;
	}

	@Override
	public LectureVO lecDetail(Long lec_id) {
		log.info("lecDetail start...");
		LectureVO lectureVO = lmd.lecDetail(lec_id);
		return lectureVO;
	}

	@Override
	public int lecTot(LectureVO lectureVO) {
		log.info("lecAgreeCnt start...");
		int lecTotal = lmd.lecTot(lectureVO);
		return lecTotal;
	}

	@Override
	public int lecDelete(Long lec_id) {
		log.info("lecDelte start...");
		int result = lmd.lecDelete(lec_id);
		return result;
	}

	@Override
	public int lecUpdate(LectureVO lectureVO) {
		log.info("lecUpdate start...");
		int result = lmd.lecUpdate(lectureVO);
		return result;
	}
}
