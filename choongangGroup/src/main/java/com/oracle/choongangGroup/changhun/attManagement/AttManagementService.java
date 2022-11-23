package com.oracle.choongangGroup.changhun.attManagement;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.Work;
import com.oracle.choongangGroup.changhun.JPA.WorkStatus;
import com.oracle.choongangGroup.changhun.address.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
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

	public void attOff() {
		String userid = "18301001";
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		
		Date now = new Date();
		
		String nowTime = sdf1.format(now);
		String nowDate = sdf2.format(now);
		
		attCustomRepository.attOff(userid,nowDate,nowTime);
	}

}
