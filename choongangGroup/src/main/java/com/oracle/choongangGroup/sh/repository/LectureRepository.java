package com.oracle.choongangGroup.sh.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.sh.domain.Lecture;

import java.util.Optional;

public interface LectureRepository extends JpaRepository<Lecture, Long> {
		Page<Lecture> findAll(Pageable pageable);
		Page<Lecture> findAllByYearAndSemester(String year, String semester, Pageable pageable);
		Page<Lecture> findByYearAndSemesterAndNameContaining(String year, String semester, String lecName,
				Pageable pageable2);
		//Lecture findOne(Long lecId);
		Optional<Lecture> findById(Long id);
		//ApplicationLec findByMember_UseridAndLecture_Id(String userid, Long lecId);
}
