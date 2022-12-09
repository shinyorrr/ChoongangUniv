package com.oracle.choongangGroup.yn.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.oracle.choongangGroup.sh.domain.ApplicationLec;
import com.oracle.choongangGroup.sh.domain.Attendance;
import com.oracle.choongangGroup.sh.domain.Grade;

public interface AttendaceRepository  extends JpaRepository<Grade, String>{

	Attendance findByApplicationLec(ApplicationLec applicationLec);

}
