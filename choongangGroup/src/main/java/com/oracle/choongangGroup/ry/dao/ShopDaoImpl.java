package com.oracle.choongangGroup.ry.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.oracle.choongangGroup.ry.model.BookVo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ShopDaoImpl implements ShopDao {

	private final SqlSession session;

	@Override
	public List<BookVo> bookList(Long cateCode) {
		List<BookVo> bookList = session.selectList("ShopList", cateCode);
		return bookList;
	}
	
	
}
