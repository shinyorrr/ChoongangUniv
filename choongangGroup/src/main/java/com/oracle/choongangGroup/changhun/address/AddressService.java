package com.oracle.choongangGroup.changhun.address;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.PhoneLike;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class AddressService {

	private final AddCustomRepository addCustomRepository;
	
	public List<Member> findByAddress() {
		
		List<Member> AddressList = addCustomRepository.findByAddress();
		
		return AddressList;
	}

  
	public void phoneLikeSave(String userid, String myuserid) {

		log.info("userid -> {} ",userid);
		
		Member member = addCustomRepository.findByOne(userid);
		
		log.info("member--> {}", member.getUserid());
		
		log.info("phoneLikeSave myuserid --> {}", myuserid);
		
		PhoneLike like = PhoneLike.createLike(myuserid, member);
		
//		log.info("like ==> {}",like);
		
		addCustomRepository.phoneLikeSave(like);
	}


	public List<PhoneLike> likeAddress(String userid) {
		
		List<PhoneLike> likeAddressList = addCustomRepository.likeAddress(userid);
		
		return likeAddressList;
	}

}
