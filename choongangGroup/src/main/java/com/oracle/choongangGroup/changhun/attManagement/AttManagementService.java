package com.oracle.choongangGroup.changhun.attManagement;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.Calendar;
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
	
	public String attInsert() {
		
		HttpSession session;
		String userid = "18301001";
		Member member = memRepository.findByUserid(userid);
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		
		Date now = new Date();
		
		String nowTime = sdf1.format(now);
		String nowDate = sdf2.format(now);
		
		Work work =  new Work();
		List<Work> worklist = repository.findByUseridAndWorkDate(userid,nowDate);
		
		if(worklist.size() == 0) {
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
		
		String msg = "출근등록이 완료되었습니다";
		if(worklist.size() == 1) {
			msg = "이미 출근등록이 되었습니다";
		}
		
		return msg;
			
		
	}
	
	
	// 9시이후이면 지각으로 처리
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
		SimpleDateFormat sdf3 = new SimpleDateFormat("HH:mm");
		
		// 날짜 객체 생성
		Date now = new Date();
		
		String nowTime = sdf1.format(now);
		String nowDate = sdf2.format(now);
		
		List<Work> work = attCustomRepository.findAttOnDate(userid,nowDate);
		
		String findAttOntime = work.get(0).getAttOnTime();
		
		// 문자열 -> Date
		Date attOn 	= sdf1.parse(findAttOntime);
		System.out.println("attOn --> " + attOn);
		Date attOff = sdf1.parse(nowTime);
		System.out.println("attOff --> " + attOff);
		
		//비교
		long hour,min,sec = 0;
		hour 	= attOff.getHours()   - attOn.getHours();
		
		if(attOff.getMinutes()<attOn.getMinutes()) {
			min 	= (60+attOff.getMinutes()) - attOn.getMinutes();
			hour -= 1;
		} else {
			min 	= attOff.getMinutes() - attOn.getMinutes();			
		}
		
		if(attOff.getSeconds()<attOn.getSeconds()) {
			sec 	= (60+attOff.getSeconds()) - attOn.getSeconds();
			min -= 1;
		} else {
			sec 	= attOff.getSeconds() - attOn.getSeconds();			
		}
		
		System.out.println("Hour->" + hour);
		System.out.println("Min->" + min);
		System.out.println("sec->" + sec);
		
		
		String totalResult = String.format("%02d:%02d:%02d", hour,min,sec);
		
		System.out.println("totalResult1 --> " + totalResult);
		
		attCustomRepository.attOff(userid,nowDate,nowTime,totalResult);
		
		
		
		
		
		
//		// 함수 구현 테스트
//		int lastDay = getLastMonth("2022-04-21");
//		System.out.println("lastNum -> " + lastDay);
//		// 무슨 요일인지
//		int whatDay = whatDay("2022-04-21");
//		System.out.println("whatDay --> " + whatDay);
//		// 날짜 세팅 값
//		int setDate = setDate(whatDay);
//		System.out.println("setDate --> " + setDate);
//		// 최종 몇주차까지 있는지?
//		int result = howManyWeek(lastDay, whatDay, setDate);
//		System.out.println(result);
	}

	// 현재 날짜 구하기
	public String today() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		String nowDate = sdf.format(now);
		
		return nowDate;
	}
	
	// 마지막 날짜 구하기
	public int getLastMonth(String yyyyMMdd) {
		
		String date = yyyyMMdd.replace("-","");
		String year  = date.substring(0,4);
		String month = date.substring(4,6);
		
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(year), Integer.parseInt(month)-1,1);
		
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		return lastDay;
	}
	

	// 해당 달의 1일이 무슨 요일인지 구하기
	public int whatDay(String yyyyMMdd) {
		
		String date = yyyyMMdd.replace("-","");
		int year  = Integer.parseInt(date.substring(0,4));
		int month = Integer.parseInt(date.substring(4,6));
		
		LocalDate localdate = LocalDate.of(year, month, 1);
		
		DayOfWeek dayOfWeek = localdate.getDayOfWeek();
		
		int dayOfDay = dayOfWeek.getValue();
		
		return dayOfDay;
	}
	
	// 날짜 세팅값 변경
	public int setDate(int dayOfDay) {
		int setDate = 0;
		int result = 1;
		if(dayOfDay != 1) {
			setDate = 8-dayOfDay;
			 result += setDate;			
		}
		return result;
	}
	
	// 몇주차까지 있는 확인
	public int howManyWeek(int lastDay,int dayOfDay, int setDate) {
		
		int weekCount = 0;
		int checkRemain = 0;
		
		System.out.println("dayOfDay --> " + dayOfDay);
		
		weekCount 	= (lastDay-setDate+1)/7;
		System.out.println("weekCount --> " + weekCount);
		checkRemain = (lastDay-setDate+1)%7;
		System.out.println("checkRemain --> " + checkRemain);
		if(checkRemain != 0) weekCount += 1;
		
		if(dayOfDay != 1 && dayOfDay != 6 && dayOfDay != 7) {
			weekCount += 1;
		} 

		return weekCount;
	}
	
	// 내가 지금 주차에 있는지 확인
	public int weekCount() {
		
		String today	= today();
		int lastDay 	= getLastMonth(today);
		int whatDayNum	= whatDay(today);
		int setDay		= setDate(whatDayNum);
		int weekCount   = howManyWeek(lastDay, whatDayNum, setDay);
		
		return weekCount;
	}
	
	
	

}
