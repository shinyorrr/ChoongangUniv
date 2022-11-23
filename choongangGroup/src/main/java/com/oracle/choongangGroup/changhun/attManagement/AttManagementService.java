package com.oracle.choongangGroup.changhun.attManagement;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.Work;
import com.oracle.choongangGroup.changhun.address.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class AttManagementService {

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
		
		repository.save(work);
		
	}

}
