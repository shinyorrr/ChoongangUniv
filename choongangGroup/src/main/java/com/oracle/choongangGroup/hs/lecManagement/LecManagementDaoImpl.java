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
	public int lecAgreeCnt() {
		log.info("lecAgreeCnt start...");
		int lecAgreeTot = 0;
		try {
			lecAgreeTot = session.selectOne("hsLecAgreeTotal");
		} catch (Exception e) {
			log.info("lecTot Exception->{}", e.getMessage());
		}
		return lecAgreeTot;
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

	@Override
	public int lecTot(LectureVO lectureVO) {
		log.info("lecTotal start...");
		int lecTotal = 0;
		try {
			lecTotal = session.selectOne("hsLecTotal", lectureVO);
		} catch (Exception e) {
			log.info("lecTot Exception->{}", e.getMessage());
		}
		return lecTotal;
	}

	@Override
	public int lecDelete(Long lec_id) {
		log.info("lecDelete start...");
		int result = 0;
		try {
			result = session.delete("hslecDelete", lec_id);
		} catch (Exception e) {
			log.info("lecDelete Exception->{}", e.getMessage());
		}
		return result;
	}

	@Override
	public int lecUpdate(LectureVO lectureVO) {
		log.info("lecUpdate start...");
		int result = 0;
		try {
			result = session.update("hslecUpdate", lectureVO);
		} catch (Exception e) {
			log.info("lecUpdate Exception->{}", e.getMessage());
		}
		return result;
	}
}
