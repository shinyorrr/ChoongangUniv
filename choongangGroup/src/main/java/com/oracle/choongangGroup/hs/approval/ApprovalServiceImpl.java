package com.oracle.choongangGroup.hs.approval;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class ApprovalServiceImpl implements ApprovalService {

	private final ApprovalDao ad;
	
	// ---------------- 결재 리스트 ----------------------
	// 승인 대기중
	@Override
	public List<Approval> waitingListAll(String userid) {
		log.info("waitingListAll start...");
		List<Approval> list = ad.waitingListAll(userid);
		return list;
	}
	
	// 승인 진행중
	@Override
	public List<Approval> processListAll(String userid) {
		log.info("processListAll start...");
		List<Approval> list = ad.processListAll(userid);
		return list;
	}
	
	// 승인 완료
	@Override
	public List<Approval> finishListAll(String userid) {
		log.info("finishListAll start...");
		List<Approval> list = ad.finishListAll(userid);
		return list;
	}
	
	// ---------------- 페이징 ----------------------
	@Override
	public int waitTotal(String userid) {
		log.info("waitTotal start...");
		int totWaitCnt = ad.waitTotal(userid);
		return totWaitCnt;
	}

	@Override
	public int processTotal(String userid) {
		log.info("processTotal start...");
		int totProcessCnt = ad.processTotal(userid);
		return totProcessCnt;
	}

	@Override
	public int finishTotal(String userid) {
		log.info("processTotal start...");
		int totFinishCnt = ad.finishTotal(userid);
		return totFinishCnt;
	}
}
