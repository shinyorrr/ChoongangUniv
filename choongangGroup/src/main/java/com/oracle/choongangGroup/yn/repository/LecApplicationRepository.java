package com.oracle.choongangGroup.yn.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.LectureMember;

public interface LecApplicationRepository extends JpaRepository<ApplicationLec, String>{

	List<ApplicationLec> findByLecture_IdAndGubun(Long id, Long gubun);


}
