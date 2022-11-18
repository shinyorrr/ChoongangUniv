package com.oracle.choongangGroup.domain.jpa.student;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import lombok.Data;

@Data
@Entity
public class Book {
	
	@Id
	private Long  	book_id;
	private String 	book_name;
	private String  	book_price;
	
}
