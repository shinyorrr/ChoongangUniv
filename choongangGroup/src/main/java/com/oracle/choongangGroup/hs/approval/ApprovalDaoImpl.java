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
	
	// 승인 대기중
	@Override
	public List<Approval> waitingListAll(String userid) {
		log.info("waitingListAll start...");
		List<Approval> list = null;
		try {
			list = session.selectList("hsApprWaitList", userid);
			log.info("waitingListAll list.size()->{}",list.size());
		} catch (Exception e) {
			log.info("waitingListAll Exception->{}",e.getMessage());
		}
		
		return list;
	}
	
	// 승인 진행중
	@Override
	public List<Approval> processListAll(String userid) {
		log.info("processListAll start...");
		List<Approval> list = null;
		try {
			list = session.selectList("hsApprProcessList", userid);
			log.info("processListAll list.size()->{}",list.size());
		} catch (Exception e) {
			log.info("processListAll Exception->{}",e.getMessage());
		}
		
		return list;
	}
	
	// 승인 완료
	@Override
	public List<Approval> finishListAll(String userid) {
		log.info("finishListAll start...");
		List<Approval> list = null;
		try {
			list = session.selectList("hsApprfinishList", userid);
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
}
