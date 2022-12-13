package com.oracle.choongangGroup.dongho.professor.lecturePlan;

import lombok.Data;

@Data
public class LecPlanDto {
	private Long   lec_id;
	private String book_name;
	private String book_author;
	private String plan_goal;
	private String plan_way;
	private String plan_midterm_ratio;
	private String plan_final_ratio;
	private String plan_attendance;
	private String plan_eval_category1;
	private String plan_eval_category2;
	private String plan_eval_detail1;
	private String plan_eval_detail2;
}
