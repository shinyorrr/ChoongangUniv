package com.oracle.choongangGroup.hs.lecManagement;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.oracle.choongangGroup.sh.domain.Lecture;

@Mapper
public interface MakeupMapper {

	int insertOrdersDate(List<InsertLecOrdersDto> insertLecOrdersDtoList);

}
