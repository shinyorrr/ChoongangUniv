package com.oracle.choongangGroup.dongho.professor;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.sh.domain.Lecture;

public interface DhProfessorLecRepository extends JpaRepository<Lecture, Long>{

	List<Lecture> findByProf(String profName);

}
