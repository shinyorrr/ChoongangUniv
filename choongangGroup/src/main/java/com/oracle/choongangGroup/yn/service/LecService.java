package com.oracle.choongangGroup.yn.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Lecture;




public interface LecService {

	List<ApplicationLec> findByLecture_IdAndGubun(Long id, Long gubun);
//	Object getLecCheck(HttpServletResponse response, boolean excelDownload);





	

}
