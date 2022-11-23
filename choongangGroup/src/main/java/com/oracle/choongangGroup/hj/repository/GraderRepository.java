package com.oracle.choongangGroup.hj.repository;

import java.util.List;

import com.oracle.choongangGroup.sh.domain.Lecture;

public interface GraderRepository {


	List<Lecture> findAll();

}
