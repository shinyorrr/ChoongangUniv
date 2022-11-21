package com.oracle.choongangGroup.changhun.dept;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.choongangGroup.changhun.JPA.Dept;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class DeptRestCotroller {
	
	public final DeptRepository dp;
	public final DeptService deptService;
	
	@RequestMapping("deptDelete")
	public int deptDelete(Dept dept) {
		System.out.println("delete start...");
		int result = 0;
		System.out.println(dept.getDeptno());
		dp.delete(dept);
		
		return result;
	}
	
	@RequestMapping(value = "deptUpdate")
	public String deptUpdate(Dept dept) {
		dp.save(dept);
		return null;
	}

}
