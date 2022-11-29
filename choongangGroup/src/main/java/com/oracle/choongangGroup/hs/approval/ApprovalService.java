package com.oracle.choongangGroup.hs.approval;

import java.util.List;

public interface ApprovalService {

	List<Approval> waitListAll(Approval approval);

	List<Approval> processListAll(Approval approval);

	List<Approval> endListAll(Approval approval);
	
	int waitTotal(String userid);

	int processTotal(String userid);

	int finishTotal(String userid);

	List<ApprovalSort> sortSelect();

	List<MemDept> apprList(String userid);

	int saveAppr(Approval approval);

	Approval processDetail(Approval approval);

	MemDept findMem(String userid);

	int delete(Long approval_no);

	int save(Approval approval);

	Approval finishDetail(Approval approval);

	Approval waitDetail(Approval approval);

	int finAgree(Approval approval);

	int midAgree(Approval approval);

	int midReject(Approval approval);

	int finReject(Approval approval);

}
