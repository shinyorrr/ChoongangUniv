package com.oracle.choongangGroup.ry.service;

import java.util.List;

import com.oracle.choongangGroup.ry.model.BookVo;

public interface ShopService {


	List<BookVo> bookList(Long cateCode);

}
