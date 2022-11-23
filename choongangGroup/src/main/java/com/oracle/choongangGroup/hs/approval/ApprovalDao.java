package com.oracle.choongangGroup.hs.approval;

import java.util.List;

public interface ApprovalDao {

	List<Approval> waitingListAll(String userid);

	List<Approval> processListAll(String userid);

	List<Approval> finishListAll(String userid);

	int waitTotal(String userid);

	int processTotal(String userid);

	int finishTotal(String userid);


}
