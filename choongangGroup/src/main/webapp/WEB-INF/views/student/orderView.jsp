<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container_box table td { width:100px; }
	section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	aside { float : left; width 200px;}	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
 	aside ul li a:hover { background:#eee; }
	.inputArea { border:1px; margin:10px 0; }
	select { width:100px; }
	label { display:inline-block; width:70px; padding:5px; }
	label[for='bookInfo'] { display:block; }
	input { width:150px; }
	textarea#bookInfo { width:400px; height:180px; }
 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .bookInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .bookInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
  .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .bookInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .bookInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
</style>
</head>
<body>
	<section id="content">
	
	 <div class="orderInfo">
	  <c:forEach items="${orderView}" var="orderView" varStatus="status">
	   
	   <c:if test="${status.first}">
	    <p><span>수령인</span>${orderView.orderName}</p>
	    <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
	   </c:if>
	   
	  </c:forEach>
	 </div>
	 
	 <ul class="orderView">
	  <c:forEach items="${orderView}" var="orderView">     
	  <li>
	   <div class="thumb">
	    <img src="${orderView.bookThumbImg}" style="width: 200px; height: 150px; object-fit: contain;" />
	   </div>
	   <div class="bookInfo">
	    <p>
	     <span>상품명</span>${orderView.bookName}<br />
	     <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.bookPrice}" /> 원<br />
	     <span>구입 수량</span>${orderView.cartStock} 개<br />
	     <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.bookPrice * orderView.cartStock}" /> 원                  
	     <p><span>상태</span>${orderView.state }</p>
	   </div>
	  </li>     
	  </c:forEach>
	 </ul>
	</section>
</body>
</html>