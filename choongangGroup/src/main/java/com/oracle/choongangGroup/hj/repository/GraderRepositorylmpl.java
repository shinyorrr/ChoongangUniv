package com.oracle.choongangGroup.hj.repository;





import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.sh.domain.Lecture;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class GraderRepositorylmpl implements GraderRepository {

	private final EntityManager em;

	//성적조회 할 과목 조회 jpa 
	@Override
	public List<Lecture> findAll() {
		// TODO Auto-generated method stub
		return em.createQuery("select l from Lecture l ", Lecture.class)		
								.getResultList();
	}
	
	
	
}
