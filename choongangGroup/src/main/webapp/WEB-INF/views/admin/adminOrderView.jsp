<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
 
 	section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	.orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;} 
	.orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
	
	.orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
	.orderView li::after { content:""; display:block; clear:both; }
	
	.thumb { float:left; width:200px; }
	.thumb img { width:200px; height:200px; }
	.bookInfo { float:right; width:calc(100% - 220px); line-height:2; }
	.bookInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
	
	.stateChange { text-align:right; }
	.delivery1_btn,
	.delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
</style>

									<script type="text/javascript">
									$(function(){
									$(".state1_btn").click(function(){
										$(".state").val("준비 완료");
										run();
										}
									$(".state2_btn").click(function(){
										$(".state").val("수령 완료");
										run();
										
									});
									
									function run(){
										$(".stateForm").submit();
									}
									});
									</script>

</head>
<body>
<section id="content">
  <aside>
		<%@include file="include/adminAside.jsp" %>
	</aside>
	<div id="container_box"> 
<div class="orderInfo">
  <c:forEach items="${orderView}" var="orderView" varStatus="status">
  
  <c:if test="${status.first}">
   <p><span>주문자</span>${orderView.userId}</p>
   <p><span>수령인</span>${orderView.orderName}</p>
   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
   <p><span>상태</span>${orderView.state}</p>
							<div class="StateChange">
								<form action="/admin/adminOrderView" role="form" method="post" id="stateForm" name="stateForm" class="stateForm">
								
									<input type="hidden" name="orderId" value="${orderView.orderId}" />
									<input type="hidden" name="state" id="state" class="state" value="" />
									
									<button type="submit" name="state1_btn" id="state1_btn" class="state1_btn" value="준비완료">준비 완료</button>
									<button type="submit"  name="state1_btn" id="state1_btn"  class="state1_btn" value="수령 완료">수령 완료</button>
									
								</form>
							</div>
  </c:if>
  
 </c:forEach>
</div>

<ul class="orderView">
 <c:forEach items="${orderView}" var="orderView">     
 <li>
  <div class="thumb">
   <img src="${orderView.bookThumbImg}" />
  </div>
  <div class="bookInfo">
   <p>
    <span>상품명</span>${orderView.bookName}<br />
    <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.bookPrice}" /> 원<br />
    <span>구입 수량</span>${orderView.cartStock} 개<br />
    <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.bookPrice * orderView.cartStock}" /> 원                  
   </p>
  </div>
 </li>     
 </c:forEach>
</ul>
 </div>
</section>
</body>
</html>