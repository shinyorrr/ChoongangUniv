package com.oracle.choongangGroup.hs.approval;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class ApprovalServiceImpl implements ApprovalService {

	private ApprovalRepository approvalRepository;
}
