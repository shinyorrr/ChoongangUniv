<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

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
	div.books p.buyStock input { font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
</style>
</head>
<body>
<section id="container">
	<aside>
		<%@include file="include/aside.jsp" %>
	</aside>
	<div id="container_box"> 
	<h2>교재 내용</h2>
		<form action="" role="form" method="post" autocomplete="off">
			<input type="hidden" id="userId" name="userId" value="${userId }">
			<input type="hidden" id="bookId" name="bookId" value="${books.bookId}"/>
		</form>
			<div>
			<div class="bookImg" style="float: left; margin-right: 30px;">
			<img style="width: 500px; height: 300px;" src="${books.bookImg}">
			</div>
			
			<div class="books" style="float: inherit; margin-bottom: 30px;">
				<p class="bookName">
				 <span>교재명</span>${books.bookName}
				</p>
				
				<p class="publisher">
				 <span>저자</span>${books.publisher}
				</p>
				
				<p class="bookPrice">
				 <span>교재가격</span>
				 <fmt:formatNumber value="${books.bookPrice}" pattern="###,###,###"/> 원
				</p>
				
				<c:if test="${books.bookStock != 0}">
				<p class="bookCount">
				 <span>구입 수량</span>
				 <!-- <button type="button" class="plus">+</button> -->
				 <input type="number" class="numBox" min="1" max="${books.bookStock }" value="1">
				 <!-- <button type="button" class="minus">-</button> -->
				</p>
				<!-- <script>
				function numBox(){
  $(".plus").click(function(){
   var num = $(".numBox").val();
   var plusNum = Number(num) + 1;
   
   if(plusNum >= ${view.gdsStock}) {
    $(".numBox").val(num);
   } else {
    $(".numBox").val(plusNum);          
   }
  });
  
  $(".minus").click(function(){
   var num = $(".numBox").val();
   var minusNum = Number(num) - 1;
   
   if(minusNum <= 0) {
    $(".numBox").val(num);
   } else {
    $(".numBox").val(minusNum);          
   }
  });
}
 </script> -->
				<!-- <p class="buyButton">
				<input type="button" class="btn btn-default" value="결제하기">
				</p> -->
				
				<p class="addToCart">
 				<input type="button" id="addCart" onclick="addCart_btn()"<%-- "location.href='/student/Order?userId=${member.userId}'" --%> value="카트에 담기"></button>
 				</p>
 				<script type="text/javascript">
function addCart_btn(){
   var userId = $("#userId").val();
   var bookId = $("#bookId").val();
   var cartStock = $(".numBox").val();
   
   
   console.log("userId" + userId);
   console.log("bookId" + bookId);
   console.log("cartStock" + cartStock);
   
   var data = {
		userId : userId,
		bookId : bookId,
     	cartStock : cartStock
     };
   
   $.ajax({
    url : "/student/shopDetailList/addCart",
    type : "post",
    data : data,
    success : function(result){
     alert("카트 담기 성공");
     $(".numBox").val("1");
    },
    error : function(){
     alert("카트 담기 실패");
    }
   });
  
}
 </script>
			</c:if>	
			<div class="bookInfo" style="margin-top: 150px;">
			<hr>
			 <span>교재소개</span>${books.bookInfo}
			</div>
			
		</div>	
	</div>
	</div>
</section>
</body>
</html>