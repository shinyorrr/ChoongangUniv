package com.oracle.choongangGroup.hj.dao;



import java.util.List;

import com.oracle.choongangGroup.hj.model.GradeVo;
import com.oracle.choongangGroup.hj.model.MemberVo;

public interface MemberDao {

	//아이디 받아와서 학적 조회 
	MemberVo detailList(String userid);

	//학적 수정
	int updateMember(MemberVo member);

	//이름 가져오기
	MemberVo infoList(String userid);

	//년도학기별로 신청한 과목 성적 조회
	List<GradeVo> gradeList(String userid,String lec_year, String lec_semester);


	//셀렉트바 년도 학기 조회 
	List<GradeVo> findys(String userid);

	//총 학점 평균 조회
	GradeVo findscore(String userid);



	
}


