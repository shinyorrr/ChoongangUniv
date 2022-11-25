package com.oracle.choongangGroup.hs.approval;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class ApprovalSortDaoImpl implements ApprovalSortDao {
	
	private final SqlSession session;

	@Override
	public List<ApprovalSort> sortSelect() {
		log.info("sortSelect Start...");
		List<ApprovalSort> sortList = null;
		
		try {
			sortList = session.selectList("hsSortSelect");
		} catch (Exception e) {
			log.info("sortList Exception->{}",e.getMessage());
		}
		return sortList;
	}
}
