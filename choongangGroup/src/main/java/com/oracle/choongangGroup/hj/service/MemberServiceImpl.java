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
import com.oracle.choongangGroup.hj.repository.GraderRepository;
import com.oracle.choongangGroup.sh.domain.Grade;
import com.oracle.choongangGroup.sh.domain.Lecture;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberServiceImpl implements MemberService {

	private final MemberDao md ;
	private final GraderDao gd ;
	private final GraderRepository gr;

	//아이디 받아와서 학적 조회 
	@Override
	public MemberVo list(String userid) {
		System.out.println("MemberServiceImpl list start. . . ");
		MemberVo member = null;
		member = md.detailList(userid);
		
		
		return member;
	}
	
	//아이디 받아와서 원하는 몇개만 학적 수정
	@Override
	public int updateMember(MemberVo member  ) {
		System.out.println(" MemberServiceImpl updateMember Start . . . ");
		int updateMember =0;
		updateMember = md.updateMember(member );
		
		return updateMember;
	}

	//아이디 받아와서 성적 조회 페이지
	@Override
	public GradeVo gradeList(String userid) {
		System.out.println("MemberServiceImpl gradeList start. . . ");
		GradeVo grade =null;
		grade = gd.gradeList(userid);
		
		
		return grade;
	}

	//성적조회 할 과목 조회 jpa 
	@Override
	public List<Lecture> findgrades() {
	
		List<Lecture> findgradeList = gr.findAll();
		System.out.println("MemberServiceImpl findorderList.size()->"+findgradeList.size());
       
		
		
		return findgradeList;
		
	
	}
	//이름가져오기 
	@Override
	public MemberVo infoList(String userid) {
		System.out.println("MemberServiceImpl infoList start. . . ");
		MemberVo memberinfo = null;
		memberinfo = md.infoList(userid);
		
		return memberinfo;
	}
	//셀렉트바 년도
	@Override
	public List<String> findYear() {
		System.out.println("MemberServiceImpl findYear start. . . ");
		List<String> yearList = gr.findYear();
		return yearList;
	}
	//셀렉트바 학기
	@Override
	public List<String> findsemester() {
		System.out.println("MemberServiceImpl findsemester start. . . ");
		List<String> semesterList = gr.findsemester();
		return semesterList;
	}

	@Override
	public MemberVo infoList2(String userid) {
		System.out.println("MemberServiceImpl infoList start. . . ");
		MemberVo memberinfo2 = null;
		memberinfo2 = md.infoList2(userid);
		return memberinfo2;
	}






	


	

	
}
