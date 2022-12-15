package com.oracle.choongangGroup.dongho.professor.lecturePlan;

import java.util.List;

public interface DhProLecPlanService {

	List<LecPlanLecDto> findByProfNameAndYearAndSemester(String profName, String year, String semester, String lecStatus);

}
