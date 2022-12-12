package com.oracle.choongangGroup.dongho.professor.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.sh.domain.Lecture;

public interface DhProfessorLecRepository extends JpaRepository<Lecture, Long>{

	List<Lecture> findByProf(String profName);

	List<Lecture> findByProfAndStatus(String profName, String lecStatus);

}
