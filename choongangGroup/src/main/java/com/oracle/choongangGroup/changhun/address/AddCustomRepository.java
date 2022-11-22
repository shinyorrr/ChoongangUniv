package com.oracle.choongangGroup.changhun.address;

import java.util.List;
import java.util.Optional;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.PhoneLike;

public interface AddCustomRepository {

	List<Member> findByAddress();

	void phoneLikeSave(PhoneLike like);

	Member findByOne(String userid);

}
