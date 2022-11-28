package com.oracle.choongangGroup.changhun.attManagement;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Work;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AttCustomRepositoryImpl implements AttCustomRepository {

	public final EntityManager em;
	
	@Override
	public void attOff(String userid, String nowDate, String nowTime, String totalResult) {

		System.out.println("attOff start...");
		
		String query = "update Work w set att_Off_Time =: offtime, total_time =: total  where userid =: userid and workDate =: nowDate";
		
		em.createQuery(query).setParameter("offtime", nowTime)
										.setParameter("userid", userid)
										.setParameter("nowDate", nowDate)
										.setParameter("total", totalResult)
										.executeUpdate();
	}

	@Override
	public List<Work> findAttOnDate(String userid, String nowDate) {
		
		String query = "select w from Work w where userid =: userid and work_date =: time ";
		
		List<Work> work = em.createQuery(query,Work.class).setParameter("userid", userid)
													.setParameter("time", nowDate).getResultList();
		
		return work;
	}

	@Override
	public List<String> findTotalTime(List<String> dayList, String userid) {
		
		String query = "select w.totalTime from Work w where userid =: userid and work_date in (:todays) ";
		
		@SuppressWarnings("unchecked")
		List<String> TotalTime = em.createQuery(query).setParameter("userid", userid).setParameter("todays", dayList).getResultList();
		
		return TotalTime;
	}

	
}
