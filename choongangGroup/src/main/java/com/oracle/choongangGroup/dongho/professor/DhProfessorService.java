package com.oracle.choongangGroup.dongho.professor;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.oracle.choongangGroup.sh.domain.Lecture;
import com.oracle.choongangGroup.sh.domain.Report;

public interface DhProfessorService {

	List<Lecture> findByProf(String profName);

	Page<Report> findPageByLecture_Id(Long id, Pageable pageable);

}
