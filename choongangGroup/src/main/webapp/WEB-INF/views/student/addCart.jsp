<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section id="content">
	 
	 <ul>
	  <c:forEach items="${cartList}" var="cartList">
	  <li>
	   <div class="thumb">
	    <img src="${cartList.gdsThumbImg}" />
	   </div>
	   <div class="gdsInfo">
	    <p>
	     <span>상품명 : </span>${cartList.gdsName}<br />
	     <span>개당 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /><br />
	     <span>구입 수량 : </span>${cartList.cartStock}<br />
	     <span>최종 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" />
	    </p>    
	   </div>
	   
	   
	  </li>
	  </c:forEach>
	 </ul>
	</section>	
</body>
</html>