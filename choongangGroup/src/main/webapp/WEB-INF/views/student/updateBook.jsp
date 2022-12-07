<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	label[for='bookInfo'] { display:block; }
	input { width:150px; }
	input:invalid {	border: 3px solid red;}
	textarea#bookInfo { width:400px; height:180px; }
	.select_img img{margin: 20px 0;}
</style>
<script type="text/javascript">
$(function(){
 	var select_cateCode = '${books.cateCode}';
 	var select_cateParent = '${books.cateParent}';
  	var select_cateName = '${books.cateName}';

  if(select_cateParent != null && select_cateParent != '') {
   $(".category1").val(select_cateParent);
   $(".category2").val(select_cateCode);
   $(".category2").children().remove();
   $(".category2").append("<option value='"
         + select_cateCode + "'>" + select_cateName + "</option>");
  } else {
   $(".category1").val(select_cateCode);
   //$(".category2").val(select_cateCode);
   // select_cateCod가 부여되지 않는 현상이 있어서 아래 코드로 대체
   $(".category2").append("<option value='" + select_cateCode + "' selected='selected'>전체</option>");
  } 
});
  /* var select_cateCode = '${books.cateCode}';
  var select_cateParent = '${books.cateParent}';
  var select_cateName = '${books.cateName}';

  if (select_cateParent != null && select_cateParent != '') {
  $(".category1").val(select_cateParent);
  //$(".category2").val(select_catecode);
  $(".category2").children().remove();
  $(".category2").append("<option value='" + select_cateParent + "'>전체</option>");
  //$(".category2").append("<option value='" + select_catecode + "' selected='selected'>" + select_catename + "</option>");

  var cate2Arr = new Array();
  var cate2Obj = new Object();

  // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
  for (var i = 0; i < jsonData.length; i++) {

  if (jsonData[i].tier == "2") {
  cate2Obj = new Object(); //초기화
  cate2Obj.cateCode = jsonData[i].cateCode;
  cate2Obj.cateName = jsonData[i].cateName;
  cate2Obj.cateParent = jsonData[i].cateParent;

  cate2Arr.push(cate2Obj);
  }
  }

  var cate2Select = $("select.category2");

  for (var i = 0; i < cate2Arr.length; i++) {
  if (select_cateParent == cate2Arr[i].cateParent) {
  if (select_cateCode == cate2Arr[i].cateCode) {
  cate2Select.append("<option value='" + select_cateCode + "' selected='selected'>" + select_cateName + "</option>");
  } else {
  cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>" + cate2Arr[i].cateName + "</option>");
  }
  }
  }

  } else {
  $(".category1").val(select_cateCode);
  //$(".category2").val(select_cateCode);
  // select_cateCode가 부여되지 않는 현상이 있어서 아래 코드로 대체
  $(".category2")
  .append("<option value='" + select_cateCode + "' selected='selected'>전체</option>");
  }
}); */

/* $("#back_Btn").click(function(){
	  window.history.back();
	  //location.href = "/student/detailBookList?bookId=" + ${books.bookId};
	  
	 }); */

	 function goBack(){
		 window.history.back();
	 }
  </script>
<script type="text/javascript">
/* $("#bookImg").change(function(){
		
		var reader = new FileReader;
		reader.onload=function(data){
			$(".select_img img").attr("src", data.target.result).width(500);
		reader.readAsDataURL(this.files[0]);
	}
}); */
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}

</script>
</head>
<body>
<section id="container">
	<aside>
		<%@include file="include/aside.jsp" %>
	</aside>
	<div id="container_box"> 
	<h2>교재 내용</h2>
		<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
			<input type="hidden" name="bookId" value="${books.bookId}"/>
			
			<label>분류</label>
				<select class="category1">
				<option value="">선택</option>
				</select>
					 
			<label>수업 카테고리</label>
				<select class="category2" name="cateCode">
				<option value="">선택</option>
				</select>
			
				<div class="inputArea">
					<label for="bookName">상품명</label>
					<input type="text" id="bookName" name="bookName" value="${books.bookName }" />
				</div>
					
				<div class="inputArea">
					<label for="publisher">글쓴이</label>
					<input type="text" id="publisher" name="publisher" value="${books.publisher }" />
				</div>
					
				<div class="inputArea">
					<label for="bookPrice">상품가격</label>
					<input type="number" id="bookPrice" name="bookPrice" value="${books.bookPrice }" />
				</div>
					
				<div class="inputArea">
					<label for="bookStock">상품수량</label>
					<input type="number" id="bookStock" name="bookStock" value="${books.bookStock }" />
				</div>
					
				<div class="inputArea">
					<label for="bookInfo">상품소개</label>
					<textarea rows="5" cols="50" id="bookInfo" name="bookInfo" value="${books.bookInfo }">${books.bookInfo }</textarea>
				</div>
				
				<div class="inputArea">
						<label for="bookImg">이미지</label>
						<input type="file" id="bookImg" name="file" accept=".png, .jpeg, .gif" onchange="readURL(this)" style="height: 30px;" />
						<div class="select_img">
						<img id="preview" style="height: 500px;" src="${books.bookImg }" />
						<input type="hidden" name="bookImg" value="${books.bookImg }"/>
						<input type="hidden" name="bookThumbImg" value="${books.bookThumbImg }"/>
						</div>
					</div>
					<%=request.getRealPath("/") %>
						
				<div class="inputArea">
					<button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
		 			<button type="button" id="back_Btn" class="btn btn-warning" value="뒤로가기" onclick="goBack();" >뒤로가기</button>
				</div>
	</form>
	</div>
</section>
</body>
</html>