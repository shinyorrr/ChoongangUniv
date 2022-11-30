package com.oracle.choongangGroup.ry.service;

import java.util.List;

import com.oracle.choongangGroup.ry.model.Book;

public interface BookService {

	List<Book> BookListAll(Book book);
	int totalBook();
	Book detailBook(Long bookid);
	int updateBook(Book book);
	int insertBook(Book book);
	int deleteBook(Long bookid);

}
