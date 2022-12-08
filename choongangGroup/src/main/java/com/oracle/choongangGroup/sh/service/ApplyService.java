package com.oracle.choongangGroup.sh.service;

import java.util.List;


<<<<<<< HEAD
import com.oracle.choongangGroup.sh.domain.ApplicationLec;
=======
import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.ApplyTime;
>>>>>>> branch 'main' of https://github.com/shinyorrr/choongang_univ.git
import com.oracle.choongangGroup.sh.domain.Lecture;


public interface ApplyService {

	List<Lecture> 	lectureListAll();
<<<<<<< HEAD
	int 			apply(Long lecId, String userid, int gubun);
	List<ApplicationLec> applicationLecList(String userid, int gubun);

	

=======
	int 			apply(Long lecId, String userid, Long gubun);
	List<ApplicationLec> likeListAll(String userid);
	void register(ApplyTime applyTime);
	
>>>>>>> branch 'main' of https://github.com/shinyorrr/choongang_univ.git




	

}
