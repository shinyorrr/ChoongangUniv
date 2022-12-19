package com.oracle.choongangGroup.yn.repository;

import java.util.Arrays;
import java.util.List;


import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.sh.domain.Lecture;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class LecRepositoryImpl {
	private final EntityManager em;

	public List<Lecture> searchLec(Lecture lecture, String prof) {
		
		// 조건에 따라서 where문을 다르게 가지는 JPQL 생성
	    String jpql = "select l from Lecture l";
	    String whereSql = " where l.prof = :prof ";
	    
		log.info("selet 쿼리 : {}", lecture.getYear());
		log.info("selet 쿼리 : {}", lecture.getSemester());
		log.info("selet 쿼리 : {}", Arrays.asList(lecture.getTypeCode().split(",")));
		log.info("selet 쿼리 : {}", lecture.getName());

//		List<Lecture> searchList = new ArrayList<Lecture>();
		
		if(lecture.getYear() != null && !"".equals(lecture.getYear())) {
			whereSql += " and l.year= :year";
		} 
		if(lecture.getSemester() != null && !"".equals(lecture.getSemester())) {
			whereSql += " and l.semester = :semester";
		} 
		if(lecture.getTypeCode() != null && !"".equals(lecture.getTypeCode())) {
			whereSql += " and l.typeCode in (:typeCode)";
		} 
		if(lecture.getName() != null && !"".equals(lecture.getName())) {
			whereSql += " and l.name like concat('%',:name,'%')";
		} 
		
		
		TypedQuery<Lecture> query = em.createQuery(jpql + whereSql, Lecture.class);
		
		query.setParameter("prof", prof);
		if(lecture.getYear() != null  && !"".equals(lecture.getYear())) {
			query.setParameter("year", lecture.getYear());
		} 
		if(lecture.getSemester() != null  && !"".equals(lecture.getSemester())) {
			query.setParameter("semester", lecture.getSemester());
		} 
		if(lecture.getTypeCode() != null  && !"".equals(lecture.getTypeCode())) {
			query.setParameter("typeCode", Arrays.asList(lecture.getTypeCode().split(",")));
		} 
		if(lecture.getName() != null  && !"".equals(lecture.getName())) {
			query.setParameter("name", lecture.getName());
		} 
		
		log.info("selet 쿼리 : {}", query.toString());
		
		List<Lecture> searchList = query.getResultList();

		return searchList;
	}

	
	
	
}
