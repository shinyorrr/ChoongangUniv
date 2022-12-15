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
<!-- <script type="text/javascript">
$(function(){
var jsonData = JSON.parse('${category}');
console.log(jsonData);
var cate1Arr = new Array();
var cate1Obj = new Object();
// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
	
	if(jsonData[i].tier == "1") {
		cate1Obj = new Object();  //초기화
		cate1Obj.cateCode = jsonData[i].cateCode;
		cate1Obj.cateName = jsonData[i].cateName;
		cate1Arr.push(cate1Obj);
	}
}
// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $(".category1")
for(var i = 0; i < cate1Arr.length; i++) {
	cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
						+ cate1Arr[i].cateName + "</option>");
}
$(document).on("change", ".category1", function(){
	var cate2Arr = new Array();
	var cate2Obj = new Object();
	
	// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		
		if(jsonData[i].tier == "2") {
			cate2Obj = new Object();  //초기화
			cate2Obj.cateCode = jsonData[i].cateCode;
			cate2Obj.cateName = jsonData[i].cateName;
			cate2Obj.cateParent = jsonData[i].cateParent;
			
			cate2Arr.push(cate2Obj);
		} 
	}
	
	var cate2Select = $(".category2");
	
	/*
	for(var i = 0; i < cate2Arr.length; i++) {
			cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
								+ cate2Arr[i].cateName + "</option>");
	}
	*/
	
	cate2Select.children().remove();
 
	$("option:selected", this).each(function(){
		
		var selectVal = $(this).val();		
				
		cate2Select.append("<option value='" + selectVal + "'>전체</option>");
		
		for(var i = 0; i < cate2Arr.length; i++) {
			if(selectVal == cate2Arr[i].cateParent) {
				cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
									+ cate2Arr[i].cateName + "</option>");
			}
		}		
	});
	
});
});	
</script> -->
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
	.inputArea { margin:10px 0; }
	select { width:100px; }
	label { display:inline-block; width:70px; padding:5px; }
	label[for='gdsDes'] { display:block; }
	input { width:150px; }
	textarea#gdsDes { width:400px; height:180px; }
</style>
</head>
<body>
<section id="container">
	<aside>
		<%@include file="include/aside.jsp" %>
	</aside>
	<div id="container_box"> 
		<h2>교재 목록</h2>
			<form action="/student/getSearch">
				<div class="mt-3">
					<%-- <select class="ms-2 form-select-sm" style="width: 12%;"	name="cateParent">
						<option value="" selected>구분</option>
						<option value="100" <c:if test="${cateParent eq '100'}">selected</c:if>>전공</option>
						<option value="200" <c:if test="${cateParent eq '200'}">selected</c:if>>교양</option>
					</select> --%>
					<!-- <label class="me-2 pe-0 font09">구분</label>
					 <select	class="form-select-sm" name="cateName" id="cateName" style="width: 13%;">
						<option value="" selected>선택</option>
					</select>  -->
						<label class="form-label me-2 mb-0 align-self-center font09">책명</label>
						<input class="form-control form-sm rounded-1" type="text" name="keyword" aria-describedby="button-search"style="height: 31px;"<c:if test="${keyword ne null}"> value="${keyword}" </c:if>>
						<button class="btn btn-secondary btn-sm" id="button-search"	type="submit">검색</button>
				</div>
			</form>
			<table>
				<thead>
					<tr>
						<th>책 이미지</th>
						<th>책 번호</th>
						<th>책 이름</th>
						<th>저자</th>
						<th>카테고리</th>
						<th>가격</th>
						<th>재고</th>
						<th>등록날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list}">
					<tr>
						<td>
						<img alt="" src="${list.bookThumbImg }" style="width: 200px; height: 150px; object-fit: contain;" >
						</td>
						<td>
						<a href="/student/detailBookList?bookId=${list.bookId }">${list.bookId }</a></td>
						<td>${list.bookName }</td>
						<td>${list.publisher }</td>
						<td>${list.cateName }</td>
						<td><fmt:formatNumber value="${list.bookPrice }" pattern="###,###,###"/></td>
						<td>${list.bookStock }</td>
						<td><fmt:formatDate value="${list.regDate }" pattern="yyyy-MM-dd"/></td>
					</c:forEach>
				</tbody>
			</table>
			</div>
</section>

</body>
</html>