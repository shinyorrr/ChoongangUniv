package com.oracle.choongangGroup.domain.student;

import java.io.Serializable;


import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
@EqualsAndHashCode
public class LecIdWeekOrderPK implements Serializable {
		private Long Lecture_plan;
		private String Lec_week_Plan;
}
