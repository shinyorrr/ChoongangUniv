package com.oracle.choongangGroup.yn.repository;

import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.Lecture;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import oracle.net.aso.q;

@Repository
@RequiredArgsConstructor
@Slf4j
public class LecRepositoryImpl {
	private final EntityManager em;
	
//	@Override
	public int lecSave(Lecture lecture) {
		log.info("LecRepositoryImpl lecture.getRoom() --> {}", lecture.getRoom());
		int result = 1;
		try {
			em.persist(lecture);
			
			
		} catch (Exception e) {
			e.getStackTrace();
			result = 0;
		}
		
		return result;
	}



	
	
	
}
