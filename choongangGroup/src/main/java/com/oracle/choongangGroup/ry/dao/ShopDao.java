package com.oracle.choongangGroup.ry.dao;

import java.util.List;

import com.oracle.choongangGroup.ry.model.BookVo;

public interface ShopDao {

	List<BookVo> bookList(Long cateCode);

}
