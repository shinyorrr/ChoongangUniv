package com.oracle.choongangGroup.hs.approval;

import java.util.List;

public interface MemDeptDao {

	MemDept getApprInfo(MemDept memDept);

	List<MemDept> getApprList(String userid);

}
