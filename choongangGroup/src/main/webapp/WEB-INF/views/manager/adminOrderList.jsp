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
body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:60px; padding:20px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
 
 		section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; } 
</style>
</head>
<body>
<section id="container">
		<aside>
			<%@ include file="include/aside.jsp" %>
		</aside>
		<div id="container_box">
		<div class="search_wrap">
		             <form action="/manager/SearchOrderList" id="searchForm" name="searchForm">
		             <select name="type">
		             	<option selected value="결제">선택</option>
						<option value="결제 대기" <c:if test="${billState eq '결제 대기'}">selected</c:if>>결제 대기</option>
						<option value="결제 완료" <c:if test="${billState eq '결제 완료'}">selected</c:if>>결제 완료</option>
		             </select>
		             <input type="text" name="keyword" value=""></input>
		             <input type="submit" class="btn btn-ouyline-primary mr-2" value="검색"></input>
		             </form>
		</div>		
		<ul class="orderList">
				<c:forEach items="${orderList}" var="orderList">
				<li>
				<div>
					<p><span>주문번호</span><a href="/manager/adminOrderView?orderId=${orderList.orderId}">${orderList.orderId}</a></p>
					<p><span>주문자</span>${orderList.userId}</p>
					<p><span>수령인</span>${orderList.orderName}</p>
					<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
					<p><span>상태</span>${orderList.state}</p>
					<p><span>결제상태</span>${orderList.billState}</p>
					
				</div>
				</li>
				</c:forEach>
			</ul>
			
		</div>
	</section>
</body>
</html>