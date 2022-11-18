package com.oracle.choongangGroup.domain.student;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;


@Data
@Entity
public class Category {
	@Id
	private String big_category;
	@Id
	private String small_category;
	private String category_content;
}
