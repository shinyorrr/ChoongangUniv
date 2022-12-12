package com.oracle.choongangGroup.ry.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.choongangGroup.dongho.auth.GetMember;
import com.oracle.choongangGroup.hj.model.MemberVo;
import com.oracle.choongangGroup.ry.model.BookCartVo;
import com.oracle.choongangGroup.ry.model.BookCateVo;
import com.oracle.choongangGroup.ry.model.BookVo;
import com.oracle.choongangGroup.ry.model.OrderDetailVo;
import com.oracle.choongangGroup.ry.model.OrdersVo;
import com.oracle.choongangGroup.ry.service.AdminBookService;
import com.oracle.choongangGroup.ry.service.ShopService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ShopController {

	private final ShopService ss;
	private final GetMember gm;
	
	@GetMapping(value = "student/shopList")
	public void shopList(Model model) throws Exception {
		List<BookVo> bookList = null;
		String userId = gm.getMember().getUserid();
		System.out.println("shopDetailList userId=> "+ userId);
		bookList = ss.bookList();
		model.addAttribute("bookList", bookList);
	}
	
	@RequestMapping(value = "/student/shopDetailList", method = RequestMethod.GET)
	public void shopDetailList(int bookId, Model model) throws Exception {
		System.out.println("BookDetail Controller start...............................");
		String userId = gm.getMember().getUserid();
		System.out.println("shopDetailList userId=> "+ userId);
		BookVo books = ss.bookDetailList(bookId);
		model.addAttribute("books", books);
		model.addAttribute("userId", userId);
	}
	
	@GetMapping(value = "/student/shopList/getSearchList")
	public List<BookVo> getSearchList(String type , String keyword, Model model){
		BookVo book = new BookVo();
		book.setType(type);
		book.setKeyword(keyword);
		return ss.getSearchList(book);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/student/shopDetailList/addCart", method = RequestMethod.POST )
	public void addCart(BookCartVo cart,int bookId, Model model)	{
		System.out.println("addCart Start..."+cart);
		String userId = gm.getMember().getUserid();
		model.addAttribute("bookId", bookId);
		model.addAttribute("userId", userId);
		model.addAttribute("cart", cart);
		ss.addCart(cart);
		
	}
	
	// 카트 목록
	@RequestMapping(value = "/student/cartList", method = RequestMethod.GET)
	public void getCartList(Model model) throws Exception {
		System.out.println("getCartList Start...");
	 
	 String userId = gm.getMember().getUserid();
	 System.out.println("getCartList userId"+ userId);
	 
	 List<BookCartVo> cartList = ss.cartList(userId);
	 
	 model.addAttribute("cartList", cartList);
	 
	}
	
	@ResponseBody
	@RequestMapping(value = "/student/deleteCart", method = RequestMethod.POST )
	public void deleteCart(int cartNum, Model model, BookCartVo cart)	{
		System.out.println("deleteCart Start...cartNum => "+cartNum);
		String userId = gm.getMember().getUserid();
		model.addAttribute("cartNum", cartNum);
		ss.deleteCart(cartNum);
		
	}
	
	// 주문
	@RequestMapping(value = "/student/cartList", method = RequestMethod.POST)
	public String order(OrdersVo order, OrderDetailVo orderDetail) throws Exception {
	String userId = gm.getMember().getUserid();
	 
	 Calendar cal = Calendar.getInstance();
	 int year = cal.get(Calendar.YEAR);
	 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
	 String subNum = "";
	 
	 for(int i = 1; i <= 6; i ++) {
	  subNum += (int)(Math.random() * 10);
	 }
	 
	 String orderId = ymd + "_" + subNum;
	 
	 order.setOrderId(orderId);
	 order.setUserId(userId);
	  
	 ss.orderInfo(order);
	 
	 orderDetail.setOrderId(orderId);   
	 ss.orderInfo_Details(orderDetail);
	 
	 ss.cartAllDelete(userId);

	 
	 return "redirect:/student/orderList";  
	}
	
	@RequestMapping(value = "/student/orderList", method =RequestMethod.GET )
	public void getOrderList(OrdersVo order, Model model) {
		String userId = gm.getMember().getUserid();
		order.setUserId(userId);
		List<OrdersVo> orderList = ss.orderList(order);
		model.addAttribute("orderList", orderList);
	}
	
	@RequestMapping(value = "/student/orderView", method =RequestMethod.GET )
	public void getOrderList(OrdersVo order,String orderId, Model model) {
		String userId = gm.getMember().getUserid();
		order.setUserId(userId);
		order.setOrderId(orderId);
		List<OrdersVo> orderView = ss.orderView(order);
		model.addAttribute("orderView", orderView);
	}
	
	@RequestMapping(value = "/admin/adminOrderList", method =RequestMethod.GET )
	public void getadminOrderList( Model model) {
		String userId = gm.getMember().getUserid();
		List<OrdersVo> orderList = ss.adminOrderList();
		model.addAttribute("orderList", orderList);
	}
	
	@RequestMapping(value = "/admin/adminOrderView", method =RequestMethod.GET )
	public void getadminOrderList( OrdersVo order,String orderId, Model model) {
		order.setOrderId(orderId);
		List<OrdersVo> orderView = ss.adminOrderView(order);
		model.addAttribute("orderView", orderView);
	}
	@RequestMapping(value = "/admin/adminOrderView", method = RequestMethod.POST)
	public String updateState(String state1_btn, OrdersVo order) {

		System.out.println("------------controller start-----------------------------------");
		
		order.setState(state1_btn);
		ss.updateState(order);
		
		return "redirect:/admin/adminOrderView?orderId="+order.getOrderId();
		
	}
	

	
	
}
