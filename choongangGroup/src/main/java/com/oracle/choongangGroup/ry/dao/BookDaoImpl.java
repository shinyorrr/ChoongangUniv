package com.oracle.choongangGroup.ry.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.ry.model.Book;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BookDaoImpl implements BookDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Book> bookList(Book book) {
		List<Book> blist = null;
		blist = session.selectList("BookList", book);
		
		return blist;
	}

	@Override
	public int totalBook() {
		int totBookCnt = 0;
		totBookCnt = session.selectOne("bookTotal");		
		return totBookCnt;
	}

	@Override
	public Book detailBook(Long bookid) {
		Book book = new Book();
		book = session.selectOne("BookSelOne", bookid);
		return book;
	}

	@Override
	public int updateBook(Book book) {
		int updateCount = 0;
		updateCount = session.update("BookUpdate", book);
		return updateCount;
	}

	@Override
	public int insertBook(Book book) {
		int insertBook = 0;
		insertBook = session.insert("BookInsert", book);
		return insertBook;
	}

	@Override
	public int deleteBook(Long bookid) {
		int result = 0;
		result = session.delete("BookDelete", bookid);
		return result;
	}

}
