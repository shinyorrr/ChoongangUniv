//package com.oracle.choongangGroup.taewoo.repository;
//
//import javax.persistence.EntityManager;
//
//import org.springframework.context.annotation.Primary;
//import org.springframework.stereotype.Repository;
//
//import com.oracle.choongangGroup.taewoo.domain.Notice;
//
//import lombok.RequiredArgsConstructor;
//
//@RequiredArgsConstructor
//@Repository
//@Primary
//public class NoticeRepositoryImpl implements NoticeRepository {
//	
//	private final EntityManager em;
//	
//	@Override
//	public Notice updateHit(Long noticeNum) {
//		System.out.println("NoticeRepositoryImpl updateHit start....");
//		Notice notice = null;
//		
//		String query = "update Notice set noticeHit = noticeHit + 1 where noticeNum = :noticeNum";
//		
//		notice = (Notice) em.createQuery(query).setParameter("noticeNum", noticeNum);
//		return notice;
//		
//	}
//
//}
