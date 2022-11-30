package com.oracle.choongangGroup.hs.approval;

import java.util.List;

public interface MemDeptDao {

	List<MemDept> getApprList(String userid);

	MemDept findMem(String userid);

}
