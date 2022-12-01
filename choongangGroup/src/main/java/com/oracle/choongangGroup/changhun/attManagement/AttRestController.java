package com.oracle.choongangGroup.changhun.attManagement;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.Work;
import com.oracle.choongangGroup.changhun.address.MemberRepository;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AttRestController {
	
	private final AttManagementRepository repository;
	private final AttManagementService service;
	private final MemberRepository memRepository;
	
	@RequestMapping(value = "attInsert")
	public String attInsert() {
		String msg = null;
		
		try {
			msg = service.attInsert();
		} catch (Exception e) {
			System.out.println("=============================================");
			System.out.println("AttManagementService attInsert 오류발생" + e.getMessage());
			System.out.println("=============================================");
		}
		
		System.out.println(msg);
		
		return msg;
	}
	
	@RequestMapping(value = "attOff")
	public String attOff() {
		String msg = null;
		
		try {
			service.attOff();
		} catch (Exception e) {
			System.out.println("attOff 오류-->" + e.getMessage());
			msg = "이미 출근 등록이 되었습니다!";
		}
		
		System.out.println(msg);
		
		return msg;
	}
	
	@PostMapping(value = "/attClk")
	public List<Work> attMyFormClk(@RequestParam(required = false, defaultValue = "0", value="page")int page) {
		
		System.out.println("page --> " + page);
		HttpSession session;
//		String userid = (String) session.getAttribute("userid");
		String userid = "18301001";
		
//		Page<Work> workList = repository.findByUserid(userid,PageRequest.of(page, 5, Sort.by(Sort.Direction.ASC,"workDate")));
		Page<Work> workList = repository.findPageByMember_Userid(userid,PageRequest.of(page, 5, Sort.by(Sort.Direction.ASC,"workDate")));
		List<String> list = new ArrayList<String>();
		list.add("가자");
		
		return workList.getContent();
	}
	
//	@PostMapping(value = "/memList")
//	public List<Member> memList(){
//		List<Member> members = memRepository.findAll();
//		return members;
//	}
	
	
}
