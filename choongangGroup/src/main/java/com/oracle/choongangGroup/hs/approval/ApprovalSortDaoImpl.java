package com.oracle.choongangGroup.hs.approval;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class ApprovalSortDaoImpl implements ApprovalSortDao {
	
	private final SqlSession session;
}
