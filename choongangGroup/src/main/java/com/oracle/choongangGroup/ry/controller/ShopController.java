package com.oracle.choongangGroup.ry.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.choongangGroup.ry.model.BookVo;
import com.oracle.choongangGroup.ry.service.AdminBookService;
import com.oracle.choongangGroup.ry.service.ShopService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ShopController {

	private final ShopService ss;
	
	@GetMapping(value = "/student/shopList")
	public void shopMain() {
		
	}
	
	@RequestMapping(value = "/student/shopDetailList", method = RequestMethod.GET)
	public void ShopList(Long cateCode,Long tier, Model model) throws Exception {
		System.out.println("cateCode"+ cateCode);
		List<BookVo> bookList = null;
		bookList = ss.bookList(cateCode);
		model.addAttribute("bookList", bookList);
	}
}
