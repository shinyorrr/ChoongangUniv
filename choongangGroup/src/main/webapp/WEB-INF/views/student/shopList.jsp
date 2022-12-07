<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">

	body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
	a { color:#05f; text-decoration:none; }
	a:hover { text-decoration:underline; }
	h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
	ul, lo, li { margin:0; padding:0; list-style:none; }
	
	aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
	aside#aside li { font-size:16px; text-align:center; }
	aside#aside li a { color:#000; display:block; padding:10px 0; }
	aside#aside li a:hover { text-decoration:none; background:#eee; }
	aside#aside li { position:relative; }
	aside#aside li:hover { background:#eee; }   
	aside#aside li > ul.low { display:none; position:absolute; top:0; left:180px;  }
	aside#aside li:hover > ul.low { display:block; }
	aside#aside li:hover > ul.low li a { background:#eee; border:1px solid #eee; }
	aside#aside li:hover > ul.low li a:hover { background:#fff;}
	aside#aside li > ul.low li { width:180px; }

</style>
</head>
<body>
<section id="container">
	<div id="container_box"> 
	<section id="content">
	<ul>
		 <c:forEach items="${bookList}" var="list">
		 <li>
		  <div class="bookThumb">
		   <img src="${list.bookThumbImg}">
		  </div> 
		  <div class="bookName">
		   <a href="/student/bookList?bookId='${list.bookId}'">${list.bookName}</a>
		  </div>
		 </li>
		 </c:forEach>
	</ul>
	
	</section>
	<aside>
	<h3> 교재 목록 </h3>
	<div class="btn-group">
	  <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	    전공
	  </button>
	  <ul class="dropdown-menu">
	    <li><a class="dropdown-item" href="#">컴퓨터</a></li>
	    <li><a class="dropdown-item" href="#">정보통신</a></li>
	    <li><a class="dropdown-item" href="#">AI</a></li>
	    <li><hr class="dropdown-divider"></li>
	    <li><a class="dropdown-item" href="#">알고리즘</a></li>
	  </ul>
	</div>
	<ul>
	<!--  	<li><a href="/student/shopList?cateCode=100&tier=1">전공</a> -->
 	<li><a href="/student/shopDetailList?cateCode=100&tier=1">전공</a>
		<ul class="low">
			<li><a href="/student/shopDetailList?cateCode=101&tier=2">컴퓨터</a>
			<li><a href="/student/shopDetailList?cateCode=102&tier=2">정보통신</a>
			<li><a href="/student/shopDetailList?cateCode=103&tier=2">AI</a>
			<li><a href="/student/shopDetailList?cateCode=104&tier=2">알고리즘</a>
		</ul>
	</li>
	<li><a href="/student/shopDetailList?cateCode=200&tier=1">교양</a>
		<ul class="low">
			<li><a href="/student/shopDetailList?cateCode=201&tier=2">토익</a>
			<li><a href="/student/shopDetailList?cateCode=202&tier=2">중국어</a>
		</ul>
	</li> 
</ul>
	</aside>
	</div>
</section>
</body>
</html>