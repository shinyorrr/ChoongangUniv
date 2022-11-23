package com.oracle.choongangGroup.changhun.address;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManager;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.PhoneLike;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Primary
@RequiredArgsConstructor
@Slf4j
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

	@Override
	public List<PhoneLike> likeAddress(String userid) {
		
		String query = "select p from PhoneLike p where my_userid = :userid";
		
		List<PhoneLike> likeList = em.createQuery(query,PhoneLike.class)
									.setParameter("userid", userid)
									.getResultList();
		
		log.info("likeAddress likeListSize --> {}" , likeList.size());
		
		return likeList;
	}

	@Override
	public void phoneLikeDelete(String myuserid, String userid) {
		
		String query = "delete from PhoneLike p where my_userid =:myuserid"
						+ " and userid =:userid";
		
		int result = em.createQuery(query)
						.setParameter("myuserid", myuserid)
						.setParameter("userid", userid).executeUpdate();
		
	}


}
