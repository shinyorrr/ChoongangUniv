package com.oracle.choongangGroup.yn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.sh.domain.Lecture;


public interface LecRepository  extends JpaRepository<Lecture, String>{

	List<Lecture> findByProf(String name);
	Lecture findById(Long id);
	
	@Transactional
	void deleteById(Long id);
 
}



