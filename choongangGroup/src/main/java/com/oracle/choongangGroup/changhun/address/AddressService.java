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

  
	public void phoneLikeSave(String myuserid, String userid) {

		Member member = addCustomRepository.findByOne(userid);
		
//		log.info("phoneLikeSave member --> {}", member.getDept());
		
		PhoneLike like = PhoneLike.createLike(userid, member);
		
//		log.info("like ==> {}",like);
		
		addCustomRepository.phoneLikeSave(like);
	}

}
