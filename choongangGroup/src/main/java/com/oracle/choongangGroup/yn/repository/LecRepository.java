package com.oracle.choongangGroup.yn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.Lecture;
import com.oracle.choongangGroup.sh.domain.LectureMember;


public interface LecRepository  extends JpaRepository<Lecture, String>{

	List<Lecture> findByProf(String name);
	Lecture findById(Long id);
//	int countByProfAndStatus(String name, String status);
	@Transactional
	void deleteById(Long id);
//	Member findByUserid();
//	LectureMember findbyUseridAndId(Long id);
 
//	List<LectureMember> findByLecIdEquals(Long id);


}

	

