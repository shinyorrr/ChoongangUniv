<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
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
</head>
<body>
<section id="container">
	<aside>
		<%@include file="include/aside.jsp" %>
	</aside>
	<div id="container_box"> 
		<h2>교재 등록</h2>
			<form action="" role="form" method="post" autocomplete="off" enctype="multipart/form-data">
 				
					 <label>대분류</label>
					 <select class="category1">
					  <option value="">선택</option>
					 </select>
					 
					 <label>중분류</label>
					 <select class="category2" name="cateCode">
					 			<option value="">선택</option>
					 </select>
<%-- 					 <label>대분류</label>
					 <select class="category1">
					 <c:forEach var="category" items="${category }">
					 <c:if test="${category.cateCode eq 100 }">
					  <option value="${category.cateCode }">${category.cateName }</option>
					  </c:if>
					  </c:forEach>
					 </select>
					 
					 <label>중분류</label>
					 <select class="category2" name="cateCode">
					 	<c:forEach var="category1" items="${category }">
					 		<c:if test="${category1.cateParent eq 100 }">
					 			<option value="${category1.cateCode }">${category1.cateName }</option>
					 		</c:if>
					 	</c:forEach>
					 
					 </select> --%>
					 	
					<div class="inputArea">
						<label for="bookName">상품명</label>
							<input type="text" id="bookName" name="bookName" />
					</div>
					
					<div class="inputArea">
						<label for="publisher">글쓴이</label>
							<input type="text" id="publisher" name="publisher" />
					</div>
					
					<div class="inputArea">
						<label for="bookPrice">상품가격</label>
							<input type="number" id="bookPrice" name="bookPrice" />
					</div>
					
					<div class="inputArea">
						<label for="bookStock">상품수량</label>
						<input type="number" id="bookStock" name="bookStock" />
					</div>
					
					<div class="inputArea">
						<label for="bookInfo">상품소개</label>
						<textarea rows="5" cols="50" id="bookInfo" name="bookInfo"></textarea>
					</div>
					
					<div class="inputArea">
						<label for="bookImg">이미지</label>
						<input type="file" id="bookImg" name="file" accept=".png, .jpeg, .gif" onchange="readURL(this)" style="height: 30px;" />
						<div class="select_img"><img id="preview" style="height: 500px;" src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg" /></div>
					</div>
					<%=request.getRealPath("/") %>
					<div class="inputArea">
						<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
					</div>
				
			</form>
	</div>
</section>

</body>
</html>