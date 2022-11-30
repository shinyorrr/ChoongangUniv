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
	public List<Approval> waitListAll(Approval approval) {
		log.info("waitListAll start...");
		List<Approval> list = null;
		try {
			list = session.selectList("hsApprWaitList", approval);
			log.info("waitListAll list.size()->{}",list.size());
		} catch (Exception e) {
			log.info("waitListAll Exception->{}",e.getMessage());
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
	public List<Approval> endListAll(Approval approval) {
		log.info("endListAll start...");
		List<Approval> list = null;
		try {
			list = session.selectList("hsApprEndList", approval);
			log.info("endListAll list.size()->{}",list.size());
		} catch (Exception e) {
			log.info("endListAll Exception->{}",e.getMessage());
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
	
	// ---------------- 새결재저장(파일 있음) ----------------------
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
	
	// ---------------- 새결재저장(파일 없음) ----------------------
	@Override
	public int save(Approval approval) {
		int result = 0;
		log.info("save Start...");
		try {
			result = session.insert("hsSave", approval);
			log.info("save result->{}", result);
		} catch (Exception e) {
			log.info("save Exception->{}",e.getMessage());
		}
		return result;
	}
	
	// ---------------- 결재상세페이지 ----------------------
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
	
	// ---------------- 결재 완료 상세페이지----------------------
	@Override
	public Approval finishDetail(Approval dapproval) {
		Approval approval = null;
		log.info("finishDetail Start...");
		try {
			approval = session.selectOne("hsApprEndDetail", dapproval);
		} catch (Exception e) {
			log.info("finishDetail Exception->{}",e.getMessage());
		}
		return approval;
	}
	
	// ---------------- 결재 승인하기 상세페이지 ----------------------
	@Override
	public Approval waitDetail(Approval dapproval) {
		Approval approval = null;
		log.info("waitDetail Start...");
		try {
			approval = session.selectOne("hsApprWaitDetail", dapproval);
		} catch (Exception e) {
			log.info("waitDetail Exception->{}",e.getMessage());
		}
		return approval;
	}
	
	
	// ---------------- 중간 결재자 승인 ----------------------
	@Override
	public int midAgree(Approval approval) {
		int result = 0;
		log.info("midAgree Start...");
		try {
			result = session.delete("hsMidAgree", approval);
		} catch (Exception e) {
			log.info("midAgree Exception->{}",e.getMessage());
		}
		return result;
	}

	// ---------------- 최종 결재자 승인 ----------------------
	@Override
	public int finAgree(Approval approval) {
		int result = 0;
		log.info("finAgree Start...");
		try {
			result = session.delete("hsFinAgree", approval);
		} catch (Exception e) {
			log.info("finAgree Exception->{}",e.getMessage());
		}
		return result;
	}
	
	// ---------------- 중간 결재자 반려 ----------------------
	@Override
	public int midReject(Approval approval) {
		int result = 0;
		log.info("midReject Start...");
		try {
			result = session.delete("hsMidReject", approval);
		} catch (Exception e) {
			log.info("midReject Exception->{}",e.getMessage());
		}
		return result;
	}
	
	// ---------------- 최종 결재자 반려 ----------------------
	@Override
	public int finReject(Approval approval) {
		int result = 0;
		log.info("finReject Start...");
		try {
			result = session.delete("hsFinReject", approval);
		} catch (Exception e) {
			log.info("finReject Exception->{}",e.getMessage());
		}
		return result;
	}
}
