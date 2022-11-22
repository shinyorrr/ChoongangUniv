package com.oracle.choongangGroup.changhun.dept;

import java.util.List;

import com.oracle.choongangGroup.changhun.JPA.Dept;

public interface DeptCustomRepository {
	List<Dept> searchDept(String search, String searchGubun);
}
