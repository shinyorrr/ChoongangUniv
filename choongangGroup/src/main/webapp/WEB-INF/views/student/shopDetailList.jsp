<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
<script src="/resources/bootstrap/bootstrap.min.js"></script>
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
</style>
</head>
<body>
<section id="container">
	<aside>
		<%@include file="include/aside.jsp" %>
	</aside>
	<div id="container_box"> 
	<h2>교재 내용</h2>
		<form role="form" method="post" autocomplete="off">
			<input type="hidden" name="bookId" value="${books.bookId}"/>
			
			<div class="inputArea"> 
			 <label style="width: auto;">교재 카테고리 코드</label>
			 <span class="category2">${books.cateCode}</span>
			</div>
			
			<div class="inputArea">
			 <label for="bookName">교재명</label>
			 <span>${books.bookName}</span>
			</div>
			
			<div class="inputArea">
			 <label for="publisher">저자</label>
			 <span>${books.publisher}</span>
			</div>
			
			<div class="inputArea">
			 <label for="bookPrice">교재가격</label>
			 <span><fmt:formatNumber value="${books.bookPrice}" pattern="###,###,###"/></span>
			</div>
			
			<div class="inputArea">
			 <label for="bookInfo">교재소개</label>
			 <span>${books.bookInfo}</span>
			</div>
			
			<div class="inputArea">
			 <label for="bookImg" style="width: auto;">교재이미지</label>
			 <img alt="" style="height: 450px;" src="${books.bookImg}">
			</div>
			
			<div class="inputArea">
			 <button type="button" id="update_Btn" class="btn btn-warning" onclick="location.href='/student/updateBook?bookId=${books.bookId}'">수정</button>
			 <button type="button" id="delete_Btn" class="btn btn-danger"   onclick="location.href='/student/deleteBook?bookId=${books.bookId}'" >삭제</button>
			</div>
	</form>
	</div>
</section>
</body>
</html>