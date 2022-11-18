package com.oracle.choongangGroup.domain.jpa.student;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;

import lombok.Data;


@Data
@Entity
@IdClass(CategoryPK.class)
public class Category {
	
	@Id
	@Column(name = "big_category")
	private String bigCategory;
	
	@Id
	@Column(name = "small_category")
	private String smallCategory;
	
	@Column(name = "category_cotent")
	private String categoryContent;
}
