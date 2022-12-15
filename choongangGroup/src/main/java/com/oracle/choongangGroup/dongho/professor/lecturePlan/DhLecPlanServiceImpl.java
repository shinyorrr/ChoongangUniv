package com.oracle.choongangGroup.dongho.professor.lecturePlan;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.dongho.professor.mappers.LectureMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
@RequiredArgsConstructor
public class DhLecPlanServiceImpl implements DhProLecPlanService{
	private final LectureMapper lectureMapper;
	
	@Override
	public List<LecPlanLecDto> findByProfNameAndYearAndSemester(String profName, String year, String semester, String lecStatus) {
		return lectureMapper.findByProfNameAndYearAndSemester(profName, year, semester, lecStatus);
	}

}
