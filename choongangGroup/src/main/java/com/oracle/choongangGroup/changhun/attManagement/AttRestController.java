package com.oracle.choongangGroup.changhun.attManagement;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class AttRestController {
	
	private final AttManagementService service;
	
	@RequestMapping(value = "attInsert")
	public String attInsert() {
		String msg = null;
		try {
			service.attInsert();
		} catch (Exception e) {
			msg = "이미 출근 등록이 되었습니다!";
		}
		
		System.out.println(msg);
		
		return msg;
				
	}
}
