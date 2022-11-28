package com.oracle.choongangGroup.yn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.sh.domain.Lecture;

public interface LecRepositoryInter extends JpaRepository<Lecture, String>{

//	List<Lecture> findByProf(String name);
 
}
