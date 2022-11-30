package com.oracle.choongangGroup.hj.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.hj.model.GradeVo;
import com.oracle.choongangGroup.hj.model.MemberVo;
import com.oracle.choongangGroup.sh.domain.Grade;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDaoImpl implements MemberDao {

	
	private final SqlSession session;

	// 학적 조회 
	@Override
	public MemberVo detailList(String userid) {
		System.out.println("MemberDaoImpl detailEmp start. . . ");
		
		MemberVo member = new MemberVo();
		
		
		try {
			member = session.selectOne("hjMemberSelOne", userid);
			System.out.println("EmpDaoImpl MemberDaoImpl userid-> "+userid);
			
			
		} catch (Exception e) {
			System.out.println("MemberDaoImpl detailList Exception-> "+e.getMessage());
		}
		
		
		
		
		
		return member;
		
		
		
	}

	//학적 수정
	@Override
	public int updateMember(MemberVo member) {
		System.out.println("MemberDaoImpl updateEmp start. . . ");
		int updateCount = 0;
		
		
		try {
			
			updateCount=session.update("hjMemberUpdate" ,member);
			System.out.println("MemberDaoImpl updateMember getEname-> "+member.getName());  
			
			
		} catch (Exception e) {
			System.out.println("MemberDaoImpl updateMember Exception-> "+e.getMessage());
		}
		
		
		
		
		return updateCount;
	}

	//이름가져오기
	@Override
	public MemberVo infoList(String userid) {
		
		MemberVo memberinfo = new MemberVo();
		
		try {
			memberinfo = session.selectOne("hjMemberinfoSelOne", userid);
			System.out.println("EmpDaoImpl MemberDaoImpl name-> "+memberinfo.getName());
			
			
		} catch (Exception e) {
			System.out.println("MemberDaoImpl detailList Exception-> "+e.getMessage());
		}
		
		
		
		return memberinfo;
	}

	//년도학기별로 신청한 과목 성적 조회
	@Override
	public List<GradeVo> gradeList(String userid ,String lec_year, String lec_semester) {
		System.out.println("MemberDaoImpl gradeList start. . . ");
	
		List<GradeVo> gradeList = null;
		
		//파라메터를 3개 넘겨주기 위해서 해줌 
		GradeVo gv = new GradeVo();
		gv.setUserid(userid);
		gv.setLec_year(lec_year);
		gv.setLec_semester(lec_semester);
		
		try {
			                                                 //파라메터 3개 한번에 gv에 담아서 넘기기 
			gradeList = session.selectList( "hjgradeSelList" , gv );
			
			System.out.println("MemberDaoImpl gradeList -> "+ gradeList.get(0).toString()  );

			
			
		} catch (Exception e) {
			System.out.println("MemberDaoImpl gradeList Exception-> "+e.getMessage());

		}
		
		return gradeList;
	}

	//셀렉트바 년도 학기별로 조회 
	@Override
	public List<GradeVo> findys(String userid) {
		System.out.println("MemberDaoImpl findys start. . . ");

		List<GradeVo> ysList = null;
		System.out.println("MemberDaoImpl findys userid"+userid);
		try {
			
			ysList=session.selectList("hjysSelList" , userid);
			System.out.println("MemberDaoImpl ysList->  "+ysList.get(0).toString());
			
		} catch (Exception e) {
			System.out.println("MemberDaoImpl findys Exception-> "+e.getMessage());
		}
		
		
		return ysList;
	}
	//총 학점 평균 조회
	@Override
	public GradeVo findscore(String userid) {
		System.out.println("MemberDaoImpl findscore start. . . ");
		GradeVo grade = new GradeVo();
		System.out.println("MemberDaoImpl findscore userid"+userid);


		try {
			
			grade=session.selectOne("hjgradeSelOne", userid);
			System.out.println(" MemberDaoImpl findscore getLec_unit_score-> "+grade.getStotal());
			
			
			
		} catch (Exception e) {
			System.out.println("MemberDaoImpl findscore Exception-> "+e.getMessage());
		}
		
		
		return grade;
	}


	


	
}
