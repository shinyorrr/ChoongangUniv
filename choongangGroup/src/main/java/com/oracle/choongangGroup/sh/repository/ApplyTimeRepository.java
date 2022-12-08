package com.oracle.choongangGroup.sh.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.sh.domain.ApplyTime;

public interface ApplyTimeRepository extends JpaRepository<ApplyTime, Long> {
	int countByYearAndSemesterAndSelect(String year, String semester, String select);
	ApplyTime findByYearAndSemesterAndSelect(String year, String semester, String select);

	
	
}
