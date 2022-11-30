package com.oracle.choongangGroup.sh.repository;

import java.util.ArrayList;
import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Lecture;

import lombok.RequiredArgsConstructor;
@Repository
@RequiredArgsConstructor
public class ApplyRepositoryImpl implements ApplyRepository {

	private final EntityManager em;
	
	//강의 전체 조회
	@Override
	public List<Lecture> lectureListAll() {
		List<Lecture> list = em.createQuery("select l from Lecture l", Lecture.class).getResultList();
		return list;
	}

	//사용자코드로 사용자정보불러오기
	@Override
	public Member memberFindOne(String userid) {
		System.out.println("repository memberFindOne start...");
		Member member = em.find(Member.class, userid);
		System.out.println("Repository Member memberFindOne member.getName()-->"+member.getName());
		return member;
	}

	//강의코드로 강의정보 불러오기
	@Override
	public Lecture lectureFindOne(Long lecId) {
		Lecture lecture = em.find(Lecture.class, lecId);
		System.out.println("Repository lecture lectureFindOne lecture.getName()-->"+lecture.getName());
		return lecture;
	}
	
	//장바구니/수강신청 리스트
	@Override
	public List<ApplicationLec> applicationLecList(String userid , int gubun) {
		String jpql = "select a from ApplicationLec a where a.gubun = :gubun";
		List<ApplicationLec> list = em.createQuery(jpql,ApplicationLec.class)
										.setParameter("gubun", gubun)
										.getResultList();
		return list;
	}
	
	
	//장바구니, 수강신청
	@Override
	public int apply(ApplicationLec applyLec) {
		System.out.println("Apply repository apply start...");
		int result = 1;
		String userid = applyLec.getMember().getUserid();
		Long lecId = applyLec.getLecture().getId();
		
		
		
		int lecResult = lecOverlap(applyLec); //강의 중복 조회 / 1-->중복없음, 0-->중복있음
		int timeResult = timeOverLap(applyLec);//시간 중복 조회 / 1-->중복없음, 2-->중복있음
		if(lecResult == 1 && timeResult == 1) { //중복된 강의가 없을때만 등록
			em.persist(applyLec); 
		}else if(lecResult != 1) {
			result = lecResult;
		}else {
			result = timeResult;
		}
		return result;
	}
	//중복 검사
	public int lecOverlap(ApplicationLec applyLec) {
		//result = 1 --> 중복없음
		//result = 0 --> 중복존재
		int result = 0;
		String userid = applyLec.getMember().getUserid();
		Long lecId = applyLec.getLecture().getId();
		String jpql = "select a from ApplicationLec a where a.member.userid = :userid and a.lecture.id = :lecId";
		List<ApplicationLec> list = em.createQuery(jpql,ApplicationLec.class)
												.setParameter("userid", userid)
												.setParameter("lecId", lecId)
												.getResultList();
		System.out.println("ApplyRepository lecOverlap lecture List size-->"+list.size());
		//중복강의 존재
		if(list.size()>0) {			
			result = 0;
		//중복강의 없음
		}else {			
			result = 1;
		}
		System.out.println("ApplyRepository lecOverlap result-->"+result);
		return result;
		
	}
	//시간중복 검사
	public int timeOverLap(ApplicationLec applyLec) {
		//result = 1 --> 중복없음
		//result = 2 --> 시간 중복됨
		int result = 1;
		
		//기존강의들의 시간을 list에 담기
		List<ApplicationLec> applyList = em.createQuery("select a from ApplicationLec a",ApplicationLec.class).getResultList();
		List<String> timetable = new ArrayList<String>();
		
		
		for(int i=0; i<applyList.size(); i++) {
			String day1 = applyList.get(i).getLecture().getDay1();//강의요일조회
			String time1 = applyList.get(i).getLecture().getTime1();//강의교시(시간)조회
			if(time1.length()>1) {//연강일경우
				String[] arraytime1 = applyList.get(i).getLecture().getTime1().split("");//교시 별로 시간쪼개기
				timetable.add(day1+arraytime1[0]);
				timetable.add(day1+arraytime1[1]);
			}else {
				timetable.add(day1+time1); //요일+교시
			}

			String day2 = applyList.get(i).getLecture().getDay2();
			if(day2 != null) { //강의가 한주에 하루만 있을 경우 실행X
				String time2 = applyList.get(i).getLecture().getTime2();
				if(time2.length()>1) {
					String[] arraytime2 = applyList.get(i).getLecture().getTime2().split("");
					timetable.add(day2+arraytime2[0]);
					timetable.add(day2+arraytime2[1]);					
				}else {
					timetable.add(day2+time2); 
				}
			}
		}
		
		//신청한 강의 시간 추출
		List<String> applyTime = new ArrayList<String>();
		
		String applyDay1 = applyLec.getLecture().getDay1();
		String applyTime1 = applyLec.getLecture().getTime1();
		if(applyTime1.length()>1) {//연강일경우
			String[] arraytime1 = applyLec.getLecture().getTime1().split("");
			applyTime.add(applyDay1 + arraytime1[0]);
			applyTime.add(applyDay1 + arraytime1[1]);
		}else {
			applyTime.add(applyDay1 + applyTime1);
		}

		String applyDay2 = applyLec.getLecture().getDay2();
		if(applyDay2 != null) { 
			String applyTime2 = applyLec.getLecture().getTime2();
			if(applyTime2.length()>1) {
				String[] arraytime2 = applyLec.getLecture().getTime2().split("");
				applyTime.add(applyDay2 + arraytime2[0]);
				applyTime.add(applyDay2 + arraytime2[1]);			
			}else {
				applyTime.add(applyDay2 + applyTime2);
			}
		}		
		
		//기존강의시간과 신청한 강의 시간 중복 비교
		for(int i =0; i<timetable.size(); i++) {
			for(int j=0; j<applyTime.size();j++) {
				if(timetable.get(i).equals(applyTime.get(j))) {
					result = 2;
				}
			}
		}
		
		return result;
	}





}
