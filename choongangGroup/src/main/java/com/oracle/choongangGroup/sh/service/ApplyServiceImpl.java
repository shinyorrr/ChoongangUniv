package com.oracle.choongangGroup.sh.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.ApplyTime;
import com.oracle.choongangGroup.sh.domain.Attendance;
import com.oracle.choongangGroup.sh.domain.Lecture;

import com.oracle.choongangGroup.sh.repository.ApplyRepository;
import com.oracle.choongangGroup.sh.repository.ApplyTimeRepository;
import com.oracle.choongangGroup.sh.repository.LectureRepository;
import com.oracle.choongangGroup.sh.repository.LikeRepository;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ApplyServiceImpl implements ApplyService {
	
	private final LikeRepository lr;
	private final ApplyRepository ar;
	private final ApplyTimeRepository atr;
	private final LectureRepository lecr;
	
	//전체 개설 강의 리스트 조회
	@Override
	public List<Lecture> lectureListAll() {
		List<Lecture> list = ar.lectureListAll();
		return list;
	}

	//장바구니 담은 강의 리스트 조회
	@Override
	public List<ApplicationLec> likeListAll(String userid) {
		List<ApplicationLec> list = lr.likeListAll(userid);
		return list;
	}

	//장바구니신청
	@Override
	public int apply(Long lecId, String userid, Long gubun) {
		int result = 0;
		Member member = ar.memberFindOne(userid);
		Lecture lecture = ar.lectureFindOne(lecId);
		ApplicationLec applyLec = ApplicationLec.apply(member, lecture, gubun);
		if(gubun == 1L) {
			result = lr.apply(applyLec); //장바구니 신청
		}else { 
			result = ar.apply(applyLec); //실제 수강신청
		}
		
		return result;
	}

	@Override
	public int register(ApplyTime applyTime) {
		String year = applyTime.getYear();
		String semester = applyTime.getSemester();
		String select = applyTime.getSelect();
		//0을 return하면 중복 메세지 alert
		int result = 0;
		int count = atr.countByYearAndSemesterAndSelect(year, semester, select);
		
		//System.out.println("count------------------------>"+time.getId());
			
		//중복시 update
		//update 기준은 select시 PK의 존재유무
		if(count >0) {
			//count==0 일때 하면 nullPointException 발생
			ApplyTime time = atr.findByYearAndSemesterAndSelect(year, semester, select);
			applyTime.setId(time.getId());
			atr.save(applyTime);
			result = 1;
		//중복없을시 insert
		}else {
			atr.save(applyTime);
		}
		return result;
		
	}

	@Override
	public ApplyTime findTime(int yearInt, int month, String select) {
		String semester = "2";
		String year = String.valueOf(yearInt);
		ApplyTime applytime = new ApplyTime();
		
		if(month>3 && month<=8) {
			semester = "1";			
			applytime = atr.findByYearAndSemesterAndSelect(year, semester, select);
		}else {
			semester = "2";
			applytime = atr.findByYearAndSemesterAndSelect(year, semester, select);			
		}
		return applytime;
	}

	
	//페이징 처리
	@Override
	public Page<Lecture> pageList(Pageable pageable) {
		return lecr.findAll(pageable);
	}



	



















}
