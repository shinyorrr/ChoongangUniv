package com.oracle.choongangGroup.hs.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.hs.repository.ApprovalRepository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class ApprovalServiceImpl implements ApprovalService {

	private ApprovalRepository approvalRepository;
}
