package com.oracle.choongangGroup.hs.approval;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Repository
@Slf4j
@RequiredArgsConstructor
public class MemDeptDaoImpl implements MemDeptDao {
	
	private final SqlSession session;
	
	// ------------------ 결재자리스트 ------------------------
	
	@Override
	public List<MemDept> getApprList(String userid) {
		log.info("getApprList Start...");
		List<MemDept> listAppr = null;
		try {
			listAppr = session.selectList("hsApprList",userid);
		} catch (Exception e) {
			log.info("getApprList Exception->{}",e.getMessage());
		}
		return listAppr;
	}

	// ---------------- 직원 상세 정보 ----------------------
	@Override
	public MemDept findMem(String userid) {
		MemDept memDept = null;
		try {
			memDept = session.selectOne("hsMemDetail", userid);
		} catch (Exception e) {
			log.info("findMem Exception->{}",e.getMessage());
		}
		return memDept;
	}
}
