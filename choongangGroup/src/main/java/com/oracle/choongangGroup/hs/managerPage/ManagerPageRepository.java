package com.oracle.choongangGroup.hs.managerPage;

import com.oracle.choongangGroup.changhun.JPA.Member;

public interface ManagerPageRepository {

	Member memberFindOne(String userid);

}
