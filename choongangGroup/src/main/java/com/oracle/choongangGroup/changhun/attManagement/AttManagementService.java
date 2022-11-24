package com.oracle.choongangGroup.changhun.attManagement;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.Work;
import com.oracle.choongangGroup.changhun.JPA.WorkStatus;
import com.oracle.choongangGroup.changhun.address.MemberRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class AttManagementService {

	private final AttCustomRepository attCustomRepository;
	private final AttManagementRepository repository;
	private final MemberRepository memRepository;
	
	public void attInsert() {
		
		HttpSession session;
		String userid = "18301001";
		Member member = memRepository.findByUserid(userid);
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		
		Date now = new Date();
		
		String nowTime = sdf1.format(now);
		String nowDate = sdf2.format(now);
		
		Work work =  new Work();
		work.setUserid(userid);
		work.setMember(member);
		work.setAttOnTime(nowTime);			
		work.setWorkDate(nowDate);
		
		int result = timeCompare(nowTime);
		
		if(result == 1) {
			work.setAttStatus(WorkStatus.지각);
		} else {
			work.setAttStatus(WorkStatus.출근);
		}
		
		repository.save(work);
		
	}
	
	public int timeCompare(String nowTime) {		
		int result = 0;
		String nowtimeReplace = nowTime.replaceAll(":", "");
		int nowtimeInt = Integer.parseInt(nowtimeReplace);
		if(nowtimeInt > 90000) {
			result = 1;
		}
		
		return result;
	}

	public void attOff() throws ParseException {
		String userid = "18301001";
		
		// 날짜 포맷
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		
		// 날짜 객체 생성
		Date now = new Date();
		
		String nowTime = sdf1.format(now);
		String nowDate = sdf2.format(now);
		
		List<Work> work = attCustomRepository.findAttOnDate(userid,nowDate);
		
		String findAttOntime = work.get(0).getAttOnTime();
		
		// 문자열 -> Date
		Date attOn 	= sdf1.parse(findAttOntime);
		Date attOff = sdf1.parse(nowTime);
		
		// Date -> 밀리세컨즈
		long timeMilOn 	= attOn.getTime();
		long timeMilOff = attOff.getTime();
		
		//비교
		long diff = timeMilOff - timeMilOn;
		
		long diffSec  = diff / 100000;
		System.out.println(diffSec);
		long diffMin  = diff / (1000 * 60);
		long diffHour = diff / (1000 * 60 * 60);
		
		String totalResult = String.format("%d:%d:%d", diffHour, diffMin, diffSec);
		
		System.out.println("totalResult1 --> " + totalResult);
		
		attCustomRepository.attOff(userid,nowDate,nowTime,totalResult);
	}

}
