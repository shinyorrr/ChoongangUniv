package com.oracle.choongangGroup.yn.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.address.AddCustomRepository;
import com.oracle.choongangGroup.changhun.address.AddressService;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Lecture;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



public interface LecService {

	List<ApplicationLec> findByLecture_IdAndGubun(Long id, Long gubun);




	

}
