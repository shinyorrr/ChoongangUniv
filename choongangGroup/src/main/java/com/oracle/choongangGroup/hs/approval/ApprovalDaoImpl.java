package com.oracle.choongangGroup.hs.approval;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class ApprovalDaoImpl implements ApprovalDao {
	
	private final SqlSession session;
	
	// ---------------- 결재메인 ----------------------
	// 승인 대기중
	@Override
	public List<Approval> waitingListAll(Approval approval) {
		log.info("waitingListAll start...");
		List<Approval> list = null;
		try {
			list = session.selectList("hsApprWaitList", approval);
			log.info("waitingListAll list.size()->{}",list.size());
		} catch (Exception e) {
			log.info("waitingListAll Exception->{}",e.getMessage());
		}
		
		return list;
	}
	
	// 승인 진행중
	@Override
	public List<Approval> processListAll(Approval approval) {
		log.info("processListAll start...");
		List<Approval> list = null;
		try {
			list = session.selectList("hsApprProcessList", approval);
			log.info("processListAll list.size()->{}",list.size());
		} catch (Exception e) {
			log.info("processListAll Exception->{}",e.getMessage());
		}
		
		return list;
	}
	
	// 승인 완료
	@Override
	public List<Approval> finishListAll(Approval approval) {
		log.info("finishListAll start...");
		List<Approval> list = null;
		try {
			list = session.selectList("hsApprfinishList", approval);
			log.info("finishListAll list.size()->{}",list.size());
		} catch (Exception e) {
			log.info("finishListAll Exception->{}",e.getMessage());
		}
		
		return list;
	}
	
	// ---------------- 페이징 ----------------------
	@Override
	public int waitTotal(String userid) {
		int totWaitCnt = 0;
		log.info("waitTotal Start...");
		try {
			totWaitCnt = session.selectOne("waitTotal",userid);
			log.info("waitTotal totWaitCnt->{}", totWaitCnt);
		} catch (Exception e) {
			log.info("waitTotal Exception->{}",e.getMessage());
		}
		return totWaitCnt;
	}

	@Override
	public int processTotal(String userid) {
		int totProcessCnt = 0;
		log.info("processTotal Start...");
		try {
			totProcessCnt = session.selectOne("processTotal",userid);
			log.info("processTotal totProcessCnt->{}", totProcessCnt);
		} catch (Exception e) {
			log.info("processTotal Exception->{}",e.getMessage());
		}
		return totProcessCnt;
	}

	@Override
	public int finishTotal(String userid) {
		int totFinishCnt = 0;
		log.info("finishTotal Start...");
		try {
			totFinishCnt = session.selectOne("finishTotal",userid);
			log.info("finishTotal totFinishCnt->{}", totFinishCnt);
		} catch (Exception e) {
			log.info("finishTotal Exception->{}",e.getMessage());
		}
		return totFinishCnt;
	}
	
	// ---------------- 새결재저장 ----------------------
	@Override
	public int saveAppr(Approval approval) {
		int result = 0;
		log.info("saveAppr Start...");
		try {
			// approval.setItem_need("아이템");
			result = session.insert("hsApprSave", approval);
			log.info("saveAppr result->{}", result);
		} catch (Exception e) {
			log.info("saveAppr Exception->{}",e.getMessage());
		}
		return result;
	}
	
	// ---------------- 기안 진행 상세페이지 ----------------------
	@Override
	public Approval processDetail(Approval dapproval) {
		Approval approval = null;
		log.info("processDetail Start...");
		try {
			approval = session.selectOne("hsApprDetail", dapproval);
		} catch (Exception e) {
			log.info("processDetail Exception->{}",e.getMessage());
		}
		return approval;
	}
	
	// ---------------- 기안 상신 취소 ----------------------
	@Override
	public int delete(Long approval_no) {
		int result = 0;
		log.info("delete Start...");
		try {
			result = session.delete("hsApprDelete", approval_no);
		} catch (Exception e) {
			log.info("delete Exception->{}",e.getMessage());
		}
		return result;
	}
	
}
