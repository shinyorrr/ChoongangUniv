package com.oracle.choongangGroup.taewoo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.taewoo.domain.Notice;

@Repository
public interface NoticeJpaRepository extends JpaRepository<Notice, Long>, NoticeRepository {

}
