package com.oracle.choongangGroup.ry.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.choongangGroup.ry.dao.AdminBookDao;
import com.oracle.choongangGroup.ry.dao.ShopDao;
import com.oracle.choongangGroup.ry.model.BookVo;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class ShopServiceImpl implements ShopService {

	
	private final ShopDao sd;

	@Override
	public List<BookVo> bookList() {
		List<BookVo> bookList = sd.bookList();
		return bookList;
	}

	@Override
	public BookVo bookDetailList(int bookId) {
		// TODO Auto-generated method stub
		return null;
	}

}
