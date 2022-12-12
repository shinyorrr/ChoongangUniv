package com.oracle.choongangGroup.hs.lecManagement;

import java.util.List;

public interface LecManagementDao {

	List<LectureVO> listLec(LectureVO lectureVO);

	int lecAgreeCnt();

	LectureVO lecDetail(Long lec_id);

	int lecTot(LectureVO lectureVO);

	int lecDelete(Long lec_id);

	int lecAgree(LectureVO lectureVO);

	int lecUpdate(LectureVO lectureVO);

}
