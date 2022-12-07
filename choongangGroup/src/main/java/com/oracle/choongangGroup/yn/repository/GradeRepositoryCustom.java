package com.oracle.choongangGroup.yn.repository;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.sh.domain.Lecture;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class GradeRepositoryCustom {
	private final EntityManager em;
	
	public List<Map<String, Object>> findMemLecGrade(Long lecId){
		String jpql = "SELECT a, b, c" +
//					+ "b.userid , a.grade, a.major, a.name, " + 
//					"		  c.attendance, c.final, c.midterm, c.repo, c.total " + 
					"  FROM Member a, ApplicationLec b, Grade c" + 
					"	where a.userid  =  b.userid" + 
					"	and   b.userid  = c.userid(+)" + 
					"	and   b.id  = c.id(+)" + 
					"	and  b.gubun = '1'" + 
					"	and  b.id = :lecId";
		
		Query query = em.createQuery(jpql);
		query.setParameter("lecId", lecId);
		
		log.info("selet 쿼리 : {}", query.toString());
		
		List<Map<String, Object>> grList = query.getResultList();
		
		log.info("grList 쿼리 : {}", grList);
		return grList;
	}
	
	
}



