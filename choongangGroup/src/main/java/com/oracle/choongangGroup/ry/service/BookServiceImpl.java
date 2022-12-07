package com.oracle.choongangGroup.ry.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.choongangGroup.ry.dao.BookDao;
import com.oracle.choongangGroup.ry.model.Book;

import lombok.RequiredArgsConstructor;


@Service
@Transactional
@RequiredArgsConstructor
public class BookServiceImpl implements BookService {
	private final BookDao bd;
	
	@Override
	public List<Book> BookListAll(Book book) {
		List<Book> blist = bd.bookList(book);
		return blist;
	}

	@Override
	public int totalBook() {
		int totBookCnt = bd.totalBook();
		return totBookCnt;
	}

	@Override
	public Book detailBook(Long bookid) {
		Book book = null;
		book = bd.detailBook(bookid);
		return book;
	}

	@Override
	public int updateBook(Book book) {
		int updateBook = 0;
		updateBook = bd.updateBook(book);
		
		return updateBook;
	}

	@Override
	public int insertBook(Book book) {
		int insertBook = 0;
		insertBook = bd.insertBook(book);
		return insertBook;
	}

	@Override
	public int deleteBook(Long bookid) {
		int deleteBook = 0;
		deleteBook = bd.deleteBook(bookid);
		return deleteBook;
	}

}
