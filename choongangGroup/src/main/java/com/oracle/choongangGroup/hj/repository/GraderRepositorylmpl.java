package com.oracle.choongangGroup.hj.repository;





import java.util.ArrayList;
import java.util.List;

import java.util.Set;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.sh.domain.Grade;
import com.oracle.choongangGroup.sh.domain.Lecture;

import lombok.RequiredArgsConstructor;


@Repository
@RequiredArgsConstructor
public class GraderRepositorylmpl implements GraderRepository {

	private final EntityManager em;

	//성적조회 할 과목 조회 jpa 
	@Override
	public List<Lecture> findAll() {
		System.out.println("GraderRepositorylmpl findAll START. . . ");
		return em.createQuery("select l from Lecture l ", Lecture.class)		
								.getResultList();
	}

	@Override
	public List<String> findYear() {
	

		System.out.println("GraderRepositorylmpl findYear START. . . ");
		List<Lecture> lectureList = em.createQuery("select l from Lecture l " , Lecture.class)
									.getResultList();
		System.out.println("lectureList.size-> " +lectureList.size());
		List<String> yearList = new ArrayList<String>();
		for(int i =0; i<lectureList.size(); i++) {
			yearList.add(lectureList.get(i).getYear());
		}
		return yearList;
			
	}

	@Override
	public List<String> findsemester() {
		System.out.println("GraderRepositorylmpl findsemester START. . . ");
		List<Lecture> lectureList = em.createQuery("select l from Lecture l " , Lecture.class)
									.getResultList();
		System.out.println("lectureList.size-> " +lectureList.size());
		List<String> semesterList = new ArrayList<String>();
		for(int i =0; i<lectureList.size(); i++) {
			semesterList.add(lectureList.get(i).getSemester());
		}
		return semesterList;
	
	}



	
}
