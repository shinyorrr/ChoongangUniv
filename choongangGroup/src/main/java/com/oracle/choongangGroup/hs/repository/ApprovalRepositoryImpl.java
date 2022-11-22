package com.oracle.choongangGroup.hs.repository;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class ApprovalRepositoryImpl implements ApprovalRepository {
	
	private final EntityManager em;
}
