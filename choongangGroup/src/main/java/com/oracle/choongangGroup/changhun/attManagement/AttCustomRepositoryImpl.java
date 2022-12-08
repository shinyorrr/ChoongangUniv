package com.oracle.choongangGroup.changhun.attManagement;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Work;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
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

	@Override
	public List<String> monthList(List<String> dayList,String userid) {
		
		String query = "select w.totalTime from Work w where userid =: userid and work_date in (:dayLists)";
		
		List<String> monthList = em.createQuery(query).setParameter("userid", userid).setParameter("dayLists", dayList).getResultList();
		
		return monthList;
	}

	@Override
	public long findVacation(String userid) {
		
		long vacation = 0;
		String query = "select m.vacation from Member m where userid =: userid";
		try {
			vacation = (long) em.createQuery(query).setParameter("userid", userid).getSingleResult();
		} catch (Exception e) {
			System.out.println("=======================================================");
			System.out.println("AttCustomRepositoryImpl findVacation 오류 --> " + e.getMessage());
			System.out.println("=======================================================");
		}
		
		return vacation;
	}

	@Override
	public List<Work> attAllList(int deptno,String todayStr) {
		String today = todayStr + "%";
		System.out.println(today);
//		String query = "select w from Work w order by w.member.userid, w.workDate";
		String query = "select w "
					+ " from Work w"
					+ " where w.workDate Like : today "
					+ " and w.member.dept.deptno =: deptno "
					+ " order by w.member.userid, w.workDate";
		List<Work> attAllList = null;
		attAllList = em.createQuery(query).setParameter("today", today).setParameter("deptno", deptno).getResultList();
		
		
//		try {
//		} catch (Exception e) {
//			System.out.println("=======================================================");
//			System.out.println("AttCustomRepositoryImpl attAllList 오류 --> " + e.getMessage());
//			System.out.println("=======================================================");
//		}
		System.out.println("attAllList --> " + attAllList.size());
		return attAllList;
	}

	@Override
	public List<String> MemberList(int deptno, String month) {
		String today = month + "%";
		String query = "select distinct w.member.userid"
					 + " from Work w "
					 + " where w.workDate Like : today"
					 + " and w.member.dept.deptno =: deptno";
//		String query = "select distinct w.member.userid from Work w";
		List<String> memberlist = em.createQuery(query).setParameter("today", today).setParameter("deptno", deptno).getResultList();
//		List<String> memberlist = em.createQuery(query).getResultList();
		System.out.println("memberlist.size() --> " + memberlist.size());
		return memberlist;
	}

	@Override
	public List<String> findBydeptList() {
		
		String query = "select d.dname from Dept d";
		List<String> deptList = em.createQuery(query).getResultList();
		
		return deptList;
	}

	@Override
	public void updateWork(String attOntime, String attOfftime, String workDate, String userid) {
		
		String jpql = "update Work w set att_on_time = ?1 , att_off_time =?2 where userid =?3 and workDate =?4";
		
		em.createQuery(jpql).setParameter(1, attOntime)
							.setParameter(2, attOfftime)
							.setParameter(3, userid)
							.setParameter(4, workDate)
							.executeUpdate();
	}

	
}
