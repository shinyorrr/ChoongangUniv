package com.oracle.choongangGroup.changhun.attManagement;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Work;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AttCustomRepositoryImpl implements AttCustomRepository {

	public final EntityManager em;
	
	@Override
	public void attOff(String userid, String nowDate, String nowTime) {

		System.out.println("attOff start...");
		
		String query = "update Work w set att_Off_Time =: offtime where userid =: userid and workDate =: nowDate";
		
		em.createQuery(query).setParameter("offtime", nowTime)
										.setParameter("userid", userid)
										.setParameter("nowDate", nowDate).executeUpdate();
	}
	
}
