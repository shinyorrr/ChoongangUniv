package com.oracle.choongangGroup.dongho.professor.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.LectureMember;

public interface DhProfessorAppLecRepository extends JpaRepository<ApplicationLec, LectureMember>{

	List<ApplicationLec> findByLecture_Id(Long id);

	List<ApplicationLec> findByLecture_IdAndGubun(Long id, Long gubun);

	Page<ApplicationLec> findPageByLecture_IdAndGubun(Long id, Long gubun, Pageable pageable);

}
