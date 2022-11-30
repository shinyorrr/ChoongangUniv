package com.oracle.choongangGroup.sh.repository;

import java.util.List;

import com.oracle.choongangGroup.changhun.JPA.Member;
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.ApplyTime;
import com.oracle.choongangGroup.sh.domain.Lecture;

public interface LikeRepository {

	int apply(ApplicationLec applyLec);

	List<Lecture> lectureListAll();

	Member memberFindOne(String userid);

	Lecture lectureFindOne(Long lecId);

	List<ApplicationLec> likeListAll(String userid);


}
