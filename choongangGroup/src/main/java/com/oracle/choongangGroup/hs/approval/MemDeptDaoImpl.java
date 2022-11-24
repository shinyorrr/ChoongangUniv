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
	
	// ------------------ 기안자 ------------------------
	@Override
	public MemDept getApprInfo(MemDept memDept) {
		log.info("getApprInfo Start...");
		MemDept infoAppr = new MemDept();
		try {
			infoAppr = session.selectOne("hsApprInfo", memDept);
			log.info("memDept.name / memDept.dname->{},{}",infoAppr.getName(), infoAppr.getDname());
		} catch (Exception e) {
			log.info("getApprName Exception->{}",e.getMessage());
		}
		return infoAppr;
	}
	
	// ------------------ 결재자리스트 ------------------------
	@Override
	public List<MemDept> getApprList() {
		log.info("getApprList Start...");
		List<MemDept> listAppr = null;
		try {
			listAppr = session.selectList("hsApprList");
		} catch (Exception e) {
			log.info("getApprList Exception->{}",e.getMessage());
		}
		return listAppr;
	}
}
