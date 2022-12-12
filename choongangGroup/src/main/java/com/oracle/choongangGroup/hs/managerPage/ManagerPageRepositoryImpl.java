package com.oracle.choongangGroup.hs.managerPage;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class ManagerPageRepositoryImpl {
	
	private final EntityManager em;

	public List<Member> searchStud(Member member, String memRole) {
		// 조건에 따라서 where문을 다르게 가지는 JPQL 생성
	    String jpql = "select m from Member m";
	    String whereSql = " where m.memRole = :memRole ";
	    
		if(member.getGrade() != null && !"".equals(member.getGrade())) {
			whereSql += " and m.grade= :grade";
		} 
		if(member.getMajor() != null && !"".equals(member.getMajor())) {
			whereSql += " and m.major= :major";
		} 
		if(member.getStudStatus() != null && !"".equals(member.getStudStatus())) {
			whereSql += " and m.studStatus= :studStatus";
		} 
		if(member.getName() != null && !"".equals(member.getName())) {
			whereSql += " and m.name like concat('%',:name,'%')";
		} 
		
		
		TypedQuery<Member> query = em.createQuery(jpql + whereSql, Member.class);
		
		query.setParameter("memRole", memRole);
		if(member.getGrade() != null  && !"".equals(member.getGrade())) {
			query.setParameter("grade", member.getGrade());
		}
		if(member.getMajor() != null  && !"".equals(member.getMajor())) {
			query.setParameter("major", member.getMajor());
		}
		if(member.getStudStatus() != null  && !"".equals(member.getStudStatus())) {
			query.setParameter("studStatus", member.getStudStatus());
		}
		if(member.getName() != null  && !"".equals(member.getName())) {
			query.setParameter("name", member.getName());
		}
		
		
		log.info("selet 쿼리 : {}", query.toString());
		
		List<Member> searchList = query.getResultList();

		return searchList;
	}
}
