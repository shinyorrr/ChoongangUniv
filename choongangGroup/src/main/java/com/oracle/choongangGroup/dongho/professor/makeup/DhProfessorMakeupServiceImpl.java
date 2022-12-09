package com.oracle.choongangGroup.dongho.professor.makeup;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class DhProfessorMakeupServiceImpl implements DhProfessorMakeupSerivce {
	private final MakeupMapper makeupMapper;
	
	@Override
	public int insertOrdersDate(List<InsertLecOrdersDto> insertLecOrdersDtoList) {
		int result = 0;
		try {
			result = makeupMapper.insertOrdersDate(insertLecOrdersDtoList);
		} catch (Exception e) {
			e.getStackTrace();
			log.error("insert Error : {}", e.getMessage());
			result = 0;
		}
		return result;
	}

}
