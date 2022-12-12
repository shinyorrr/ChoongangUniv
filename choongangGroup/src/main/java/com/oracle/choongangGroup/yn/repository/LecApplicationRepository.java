package com.oracle.choongangGroup.yn.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.sh.domain.ApplicationLec;

public interface LecApplicationRepository extends JpaRepository<ApplicationLec, String>{

	List<ApplicationLec> findByLecture_IdAndGubun(Long id, Long gubun);

}
