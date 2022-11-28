package com.oracle.choongangGroup.changhun.attManagement;

import java.util.Date;
import java.util.List;

import com.oracle.choongangGroup.changhun.JPA.Work;

public interface AttCustomRepository {

	void attOff(String userid, String nowDate, String nowTime, String totalResult);

	List<Work> findAttOnDate(String userid, String nowDate);

	List<String> findTotalTime(List<String> dayList,String userid);

}
