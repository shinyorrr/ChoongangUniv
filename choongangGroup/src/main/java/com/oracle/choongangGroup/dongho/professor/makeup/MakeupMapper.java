package com.oracle.choongangGroup.dongho.professor.makeup;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MakeupMapper {

	int insertOrdersDate(List<InsertLecOrdersDto> insertLecOrdersDtoList);

}
