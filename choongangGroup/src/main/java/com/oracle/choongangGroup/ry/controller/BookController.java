package com.oracle.choongangGroup.ry.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.choongangGroup.ry.model.Book;
import com.oracle.choongangGroup.ry.service.BookService;
import com.oracle.choongangGroup.sh.service.Paging;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class BookController {
	private final BookService bs;
	
	
	@GetMapping(value = "bookList")
	public String BookList(Model model, Book book, String currentPage) {
		int totalBook = bs.totalBook();
		Paging page = new Paging(totalBook, currentPage);
		book.setStart(1);
		book.setEnd(10);
		
		List<Book> bookList = bs.BookListAll(book);
		model.addAttribute("blist", bookList);
		model.addAttribute("totalBook", totalBook);
		model.addAttribute("page", page);
		return "student/bookList";
	}
	
	@GetMapping(value = "detailBook")
	public String detailBook(Long bookid, Model model) {
		Book book = bs.detailBook(bookid);
		model.addAttribute("book",book);

		return "detailBook";

	}
	
	@PostMapping(value = "updateBook")
	public String updateBook(Book book, Model model) {
		int updateCount = bs.updateBook(book);
		model.addAttribute("uptcnt", updateCount);
		return "redirect:bookList";
	}
	
	@PostMapping(value = "bookCreateList")
	public String createBook(Book book, Model model) {
		int insertResult = bs.insertBook(book);
		if(insertResult>0) return "redirect:bookList";
		else {
			model.addAttribute("msg", "입력 실패");
			return "forward:createBookForm";
		}
	}
	
	@RequestMapping(value = "deleteBook")
	public String deleteBook(Long bookid, Model model) {
		int result = bs.deleteBook(bookid);
		
		return "redirect:bookList";
	}
}
