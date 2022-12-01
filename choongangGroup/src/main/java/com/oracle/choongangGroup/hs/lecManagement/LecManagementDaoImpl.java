package com.oracle.choongangGroup.hs.lecManagement;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class LecManagementDaoImpl implements LecManagementDao {
	
	private final SqlSession session;

	@Override
	public List<LectureVO> listLec(LectureVO lectureVO) {
		log.info("listLec start...");
		List<LectureVO> lecList = null;
		try {
			lecList = session.selectList("hsLecList",lectureVO);
			log.info("lecList.size()->{}",lecList.size());
		} catch (Exception e) {
			log.info("lecList Exception->{}", e.getMessage());
		}
		return lecList;
	}

	@Override
	public int lecTot() {
		log.info("lecTot start...");
		int lecTot = 0;
		try {
			lecTot = session.selectOne("hsLecTotal");
		} catch (Exception e) {
			log.info("lecTot Exception->{}", e.getMessage());
		}
		return lecTot;
	}

	@Override
	public LectureVO lecDetail(Long lec_id) {
		log.info("lecDetail start...");
		LectureVO lectureVO = null;
		try {
			lectureVO = session.selectOne("hsLecDetail", lec_id);
		} catch (Exception e) {
			log.info("lecDetail Exception->{}", e.getMessage());
		}
		return lectureVO;
	}
}
