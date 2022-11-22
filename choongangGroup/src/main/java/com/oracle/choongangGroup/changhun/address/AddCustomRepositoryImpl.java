package com.oracle.choongangGroup.changhun.address;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.PhoneLike;

import lombok.RequiredArgsConstructor;

@Repository
@Primary
@RequiredArgsConstructor
public class AddCustomRepositoryImpl implements AddCustomRepository {

	private final EntityManager em;
	
	@Override
	public List<Member> findByAddress() {
		
		String query = "select m from Member m where mem_role in(2,3) order by name asc";
		
		List<Member> addressList = em.createQuery(query,Member.class).getResultList();
		
		return addressList;
	}

	@Override
	public Member findByOne(String userid) {
		Member member = em.find(Member.class, userid);
		return member;
	}
	
	@Override
	public void phoneLikeSave(PhoneLike like) {
		em.persist(like);
	}


}
