package com.oracle.choongangGroup.yn.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Lecture;




public interface LecService {


//	Page<ApplicationLec> findPageByLecture_Id(Long id, Pageable pageable);

	List<ApplicationLec> findByLecture_IdAndGubun(Long id, Long gubun);





	

}
