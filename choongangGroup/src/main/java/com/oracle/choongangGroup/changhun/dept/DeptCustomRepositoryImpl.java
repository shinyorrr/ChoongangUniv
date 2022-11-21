package com.oracle.choongangGroup.changhun.dept;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Dept;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Primary
@RequiredArgsConstructor
@Slf4j
public class DeptCustomRepositoryImpl implements DeptCustomRepository {
	
	private final EntityManager em;
	
	@Override
	public List<Dept> searchDept(String search, String searchGubun) {
		
		String pSearch = "%" + search + "%";
		String query = "select d from Dept d";
		List<Dept> searchList = null;
		
		try {
			if(search != "") {
				if(searchGubun.equals("code")) {
					int num = Integer.parseInt(search);
					query += " where trim(TRANSLATE(deptno,:search,' ')) IS NULL";
					searchList = em.createQuery(query,Dept.class)
							.setParameter("search", num)
							.getResultList();
				} 
				else {
					query += " where dname Like :search ";
					searchList = em.createQuery(query,Dept.class)
							.setParameter("search", pSearch)
							.getResultList();
				}
			} 
			else {
				searchList = em.createQuery(query,Dept.class).getResultList();
			}
		} catch (Exception e) {
			log.info("searchDept 오류발생---> {}" ,e.getMessage() );
		}
		
		return searchList;
	}

}
