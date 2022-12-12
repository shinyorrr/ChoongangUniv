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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
	#container_box table td { width:100px; }
	section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 200px - 20px); }
	aside { float : left; width 200px;}	
	aside ul li { text-align:center; margin-bottom:10px;vertical-align:middle; }
	aside ul li a { display:block; width:100%; padding:10px 0;  }
 	aside ul li a:hover { background:#eee; }
	.inputArea { border:1px; margin:10px 0; }
	select { width:100px; }
	label { display:inline-block; width:70px; padding:5px; }
	label[for='bookInfo'] { display:block; }
	input { width:150px; }
	textarea#bookInfo { width:400px; height:180px; }
	
	body { margin:0; padding:0; font-family:'맑은 고딕', verdana; }
	a { color:#05f; text-decoration:none; }
	a:hover { text-decoration:underline; }
	h1, h2, h3, h4, h5, h6 { margin:0; padding:0; }
	ul, lo, li { margin:0; padding:0; list-style:none; }
	ul li{list-style-type: none; margin: 10px; float: left;}
	
/* 	aside#aside h3 { font-size:22px; margin-bottom:20px; text-align:center; }
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
 */
</style>
<script type="text/javascript">
function getSearchList(){
	$.ajax({
		type: 'GET',
		url : "/getSearchList",
		data : $("form[name=search-form]").serialize(),
		success : function(result){
			//테이블 초기화
			$('#boardtable > tbody').empty();
			if(result.length>=1){
				result.forEach(function(bookList){
					str='<tr>'
					str += "<td>"+bookList.bookName+"</td>";
					str+="<td>"+bookList.publisher+"</td>";
					str+="<td><a href = '/student/shopList?bookName=" + bookList.bookName + "'>" + bookList.bookName + "</a></td>";
					str+="<td>"+bookList.publisher+"</td>";
					str+="</tr>"
					$('#boardtable').append(str);
        		})				 
			}
		}
	});
}
</script>
</head>
<body>
<section id="container">
	<aside>
		<%@include file="include/aside.jsp" %>
	</aside>
	<div id="container_box">
	<div class="search_wrap">
             <form id="searchForm" name="searchForm">
             <select name="type">
             	<option selected value="">선택</option>
             	<option value="bookName">책제목</option>
             	<option value="publisher">저자</option>
             </select>
             <input type="text" name="keyword" value=""></input>
             <input type="button" onclick="getSearchList()" class="btn btn-ouyline-primary mr-2" value="검색"></input>
             </form>
    </div>
		<ul>
		 <c:forEach items="${bookList}" var="bookList">
		 <li>
		  <div class="bookThumb">
		  <a href="/student/shopDetailList?bookId=${bookList.bookId}">
		   <img style="width: 200px; height: 150px; object-fit: contain;" src="${bookList.bookThumbImg}">
		   </a>
		  </div> 
		  <div class="bookName">
		   <a href="/student/shopDetailList?bookId=${bookList.bookId}">${bookList.bookName}</a>
		  </div>
		  <div class="publisher">
		   ${bookList.publisher}
		  </div>
		  <div class="bookPrice">
		  ${bookList.bookPrice} 원
		  </div>
		 </li>
		 </c:forEach>
		</ul>
	</div>
</section>
</body>
</html>