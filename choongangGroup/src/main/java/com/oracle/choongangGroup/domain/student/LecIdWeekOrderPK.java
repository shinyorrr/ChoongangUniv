package com.oracle.choongangGroup.domain.student;

import java.io.Serializable;


import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
@EqualsAndHashCode
public class LecIdWeekOrderPK implements Serializable {
		private Long lecturePlan;
		private String weekOrder;
}
