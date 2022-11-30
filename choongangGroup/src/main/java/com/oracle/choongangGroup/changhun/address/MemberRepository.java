package com.oracle.choongangGroup.changhun.address;


<<<<<<< HEAD


=======
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
>>>>>>> branch 'hyeonji' of https://github.com/hyeonji22/team-project.git
import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.changhun.JPA.MemberMapping;
import com.oracle.choongangGroup.changhun.JPA.PhoneLike;

public interface MemberRepository extends JpaRepository<Member, String>{

	Member findByUserid(String userid);

<<<<<<< HEAD
=======
	Page<Member> findByNameContaining(String name, PageRequest of);

>>>>>>> branch 'hyeonji' of https://github.com/hyeonji22/team-project.git

}
