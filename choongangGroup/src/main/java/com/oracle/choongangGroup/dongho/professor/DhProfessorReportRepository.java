package com.oracle.choongangGroup.dongho.professor;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.sh.domain.LectureMember;
import com.oracle.choongangGroup.sh.domain.Report;

@Repository
public interface DhProfessorReportRepository extends JpaRepository<Report, LectureMember>{

	Page<Report> findPageByLecture_Id(Long id, Pageable pageable);

}
