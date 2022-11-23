package com.oracle.choongangGroup.changhun.address;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.changhun.JPA.PhoneLike;

public interface AddressRepository extends JpaRepository<PhoneLike, String> {

	Page<PhoneLike> findByMyUserid(String userid, PageRequest of);

}
