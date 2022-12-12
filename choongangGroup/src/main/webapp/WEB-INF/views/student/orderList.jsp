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
	section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
	section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
	
</style>
</head>
<body>
<section id="content">
  <aside>
		<%@include file="include/aside.jsp" %>
	</aside>
	<div id="container_box"> 
 <ul class="orderList">
  <c:forEach items="${orderList}" var="orderList">
  <li>
  <div>
   <p><span>주문번호</span><a href="/student/orderView?orderId=${orderList.orderId}">${orderList.orderId}</a></p>
   <p><span>수령인</span>${orderList.orderName}</p>
   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
   <p><span>상태</span>${orderList.state}</p>
  </div>
  </li>
  </c:forEach>
 </ul>
</div>
</section>
</body>
</html>