package com.oracle.choongangGroup.ry.dao;

import java.util.List;

import com.oracle.choongangGroup.ry.model.Book;

public interface BookDao {

	List<Book> bookList(Book book);
	int totalBook();
	Book detailBook(Long bookid);
	int updateBook(Book book);
	int insertBook(Book book);
	int deleteBook(Long bookid);

}
