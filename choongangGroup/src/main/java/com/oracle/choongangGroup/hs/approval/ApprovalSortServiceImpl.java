package com.oracle.choongangGroup.hs.approval;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@Slf4j
@RequiredArgsConstructor
public class ApprovalSortServiceImpl implements ApprovalSortService {
	
	private final ApprovalSortDao asd;
}
