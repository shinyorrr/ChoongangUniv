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
	private final ApprovalSortDao asd;
	private final MemDeptDao mdd;
	
	// ---------------- 결재 리스트 ----------------------
	// 승인 대기중
	@Override
	public List<Approval> waitingListAll(Approval approval) {
		log.info("waitingListAll start...");
		List<Approval> list = ad.waitingListAll(approval);
		return list;
	}
	
	// 승인 진행중
	@Override
	public List<Approval> processListAll(Approval approval) {
		log.info("processListAll start...");
		List<Approval> list = ad.processListAll(approval);
		return list;
	}
	
	// 승인 완료
	@Override
	public List<Approval> finishListAll(Approval approval) {
		log.info("finishListAll start...");
		List<Approval> list = ad.finishListAll(approval);
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
		log.info("finishTotal start...");
		int totFinishCnt = ad.finishTotal(userid);
		return totFinishCnt;
	}
	
	
	// ---------------- 결재양식리스트 ----------------------
	@Override
	public List<ApprovalSort> sortSelect() {
		log.info("sortSelect start...");
		List<ApprovalSort> sortList = asd.sortSelect();
		return sortList;
	}
	
	// ---------------- 결재자 리스트 ---------------------- 
	@Override
	public List<MemDept> apprList(String userid) {
		log.info("apprList start...");
		List<MemDept> listAppr = mdd.getApprList(userid);
		return listAppr;
	}
	
	// ---------------- 새결재저장(파일 있음) ----------------------
	@Override
	public int saveAppr(Approval approval) {
		log.info("saveAppr start...");
		int result = ad.saveAppr(approval);
		return result;
	}
	
	// ---------------- 새결재저장(파일 없음) ----------------------
	@Override
	public int save(Approval approval) {
		log.info("save start...");
		int result = ad.save(approval);
		return result;
	}
	
	// ---------------- 기안진행 상세페이지----------------------
	@Override
	public Approval processDetail(Approval approval) {
		log.info("processDetail start...");
		Approval apprDetail = ad.processDetail(approval);
		return apprDetail;
	}

	@Override
	public MemDept findMem(String userid) {
		log.info("findMem start...");
		MemDept memDept = mdd.findMem(userid);
		return memDept;
	}
	
	// ---------------- 기안진행 삭제----------------------
	@Override
	public int delete(Long approval_no) {
		log.info("delete start...");
		int result = ad.delete(approval_no);
		return result;
	}

	

}
