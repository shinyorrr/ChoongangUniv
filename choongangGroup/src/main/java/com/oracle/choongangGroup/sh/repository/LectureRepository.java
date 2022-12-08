package com.oracle.choongangGroup.sh.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.sh.domain.Lecture;

public interface LectureRepository extends JpaRepository<Lecture, Long> {
		Page<Lecture> findAll(Pageable pageable);
}
