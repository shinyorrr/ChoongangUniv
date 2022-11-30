package com.oracle.choongangGroup.hj.service;


import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.hj.dao.GraderDao;
import com.oracle.choongangGroup.hj.dao.MemberDao;
import com.oracle.choongangGroup.hj.model.GradeVo;
import com.oracle.choongangGroup.hj.model.MemberVo;

import com.oracle.choongangGroup.sh.domain.Grade;
import com.oracle.choongangGroup.sh.domain.Lecture;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberServiceImpl implements MemberService {

	private final MemberDao md ;
	private final GraderDao gd ;


	//아이디 받아와서 학적 조회 
	@Override
	public MemberVo list(String userid) {
		System.out.println("MemberServiceImpl list start. . . ");
		MemberVo member = null;
		member = md.detailList(userid);
		
		return member;
	}
	
	// 학적 수정
	@Override
	public int updateMember(MemberVo member  ) {
		System.out.println(" MemberServiceImpl updateMember Start . . . ");
		int updateMember =0;
		updateMember = md.updateMember(member );
		
		return updateMember;
	}

	//성적 조회 페이지
	@Override
	public GradeVo gradeList(String userid) {
		System.out.println("MemberServiceImpl gradeList start. . . ");
		GradeVo grade =null;
		grade = gd.gradeList(userid);
		
		
		return grade;
	}


	//이름가져오기 
	@Override
	public MemberVo infoList(String userid) {
		System.out.println("MemberServiceImpl infoList start. . . ");
		MemberVo memberinfo = null;
		memberinfo = md.infoList(userid);
		
		return memberinfo;
	}


	//년도학기별로 신청한 과목 성적 조회
	@Override
	public List<GradeVo> listgrade(String userid, String lec_year, String lec_semester) {
		System.out.println("MemberServiceImpl listgrade start. . . ");
		 //성적과목조회 
		 List<GradeVo> gradeList = null;
		  System.out.println("MemberServiceImpl userid  " +userid);
		
		  //년도 학기 별로 조회 되도록
		  gradeList = md.gradeList(userid , lec_year ,lec_semester);
		  
		  //토탈 성적 ---> 학점으로 바꾸기 
//		  for(GradeVo gv : gradeList) {
//			  int tmpVal = Integer.parseInt(gv.getSco_total());
//			  if(tmpVal >= 90) {
//				  gv.setSco_total("A");
//			  }else if (tmpVal >=80 ) {
//				  gv.setSco_total("B");
//				
//			}else if (tmpVal >=70 ) {
//				  gv.setSco_total("C");
//			}else if (tmpVal >=60 ) {
//				  gv.setSco_total("D");
//			}else 
//					  gv.setSco_total("F");
//			  
//		  }
	  	//System.out.println("MemberServiceImpl gradeList---->" +gradeList.);
		  
		  
		return gradeList;
	}

	//셀렉트바 학기 년도로 조회 
	@Override
	public List<GradeVo> findys(String userid) {
		List<GradeVo> ysList = null;
		ysList = md.findys(userid);
		
		return ysList;
	}

	//총 학점 평균 조회
	@Override
	public GradeVo sutotal(String userid) {
		GradeVo grade = null;
		grade = md.findscore(userid);
		
		
		
		
		return grade;
	}


	


	
	


	


	

	
}
