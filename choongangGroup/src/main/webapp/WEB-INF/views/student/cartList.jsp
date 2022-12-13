<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function allChk(){
	 var chk = $("#allCheck").prop("checked");
	 if(chk) {
	  $(".chBox").prop("checked", true);
	 } else {
	  $(".chBox").prop("checked", false);
	 }
	$(".chBox").click(function(){
	  $("#allCheck").prop("checked", false);
	 });
}


	    	  /* var confirm_val = confirm("정말 삭제하시겠습니까?");
	    	  
	    	  if(confirm_val) {
	    	   var checkArr = new Array();
	    	   
	    	   $("input[class='chBox']:checked").each(function(){
	    	    checkArr.push($(this).attr("data-cartNum"));
	    	   });
	    	    
	    	   $.ajax({
	    	    url : "/student/deleteCart",
	    	    type : "post",
	    	    data : { chbox : checkArr },
	    	    success : function(){
	    	     location.href = "/student/cartList";
	    	    }
	    	   });
	    	  }  */
function selectDelete_btn(){
	var cartNum = $("#cartNum").val();
	   
	   
	   console.log("cartNum" + cartNum);
	   
	   var data = {
			cartNum : cartNum
	     };
	   
	   $.ajax({
	    url : "/student/deleteCart",
	    type : "post",
	    data : data,
	    success : function(result){
	     alert("삭제 성공");
	     location.href="/student/cartList";
	    },
	    error : function(){
	     alert("삭제 실패인데 성공?");
	     location.href="/student/cartList";
	    }
	   });
}
	</script>
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
	.allCheck { float:left; width:200px; }
	.allCheck input { width:16px; height:16px; }
	.allCheck label { margin-left:10px; }
	.delBtn { float:right; width:300px; text-align:right; }
	.delBtn button { font-size:18px; padding:5px 10px; border:1px solid #eee; background:#eee;}
	
	.checkBox { float:left; width:30px; }
	.checkBox input { width:16px; height:16px; }
	.listResult { padding:20px; background:#eee; }
	.listResult .sum { float:left; width:45%; font-size:22px; }
	
	.listResult .orderOpne { float:right; width:45%; text-align:right; }
	.listResult .orderOpne button { font-size:18px; padding:5px 10px; border:1px solid #999; background:#fff;}
	.listResult::after { content:""; display:block; clear:both; }
</style>
</head>
<body>
<section id="content">
 <aside>
		<%@include file="include/aside.jsp" %>
	</aside>
	<div id="container_box"> 
	<ul>
	 <li>
		  <div class="allCheck">
		   <input type="checkbox" class="allCheck" name="allCheck" id="allCheck" onclick="allChk()" /><label for="allCheck">모두 선택</label> 
		  </div>
	  
		  <div class="delBtn">
		   <button type="button" class="selectDelete_btn" onclick="selectDelete_btn()">선택 삭제</button> 
		  </div>
	 </li>
	 <c:set var="sum" value="0"/>
	  <c:forEach items="${cartList}" var="cartList">
	<p></p><p></p>
	  
	  <li>
	  <div class="checkBox">
	  	<input type="checkbox" class="chBox" name="chBox" id="chBox" data-cartNum="${cartList.cartNum}"/>
	  </div>
	   <div class="thumb">
	    <img src="${cartList.bookThumbImg}" style="width: 200px; height: 150px; object-fit: contain;" />
	   </div>
	   <div class="bookInfo">
	    <p>
	   <input type="hidden" value="${cartList.userId }">
	   <input type="hidden" value="${cartList.cartNum }" id="cartNum" class="cartNum" name="cartNum">
	     <span>상품명 : </span>${cartList.bookName}<br />
	     <span>개당 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.bookPrice}" /><br />
	     <span>구입 수량 : <%-- <input type="number" value="${cartList.cartStock}" id="cartStock" name="cartStock"> --%></span>${cartList.cartStock}<br />
	     <span>최종 가격 : </span><fmt:formatNumber pattern="###,###,###" value="${cartList.bookPrice * cartList.cartStock}" />
	    </p>    
	    <div class="delete">
	     <button type="button" class="delete_btn" onclick="selectDelete_btn()"<%--  data-cartNum="${cartList.cartNum}"  --%>>삭제</button>
	    </div>

	   </div>
	   
	  </li>
	  <c:set var="sum" value="${sum + (cartList.bookPrice*cartList.cartStock)}"/>
  	</c:forEach>
 </ul>
 
	 <div class="listResult">
	 <div class="sum">
	  총 합계 : <fmt:formatNumber pattern="###,###,###" >
	  <c:out value="${sum}"/>
	  </fmt:formatNumber> 원
	 </div>
	 <div class="orderOpne">
	  <button type="button"class="orderOpen_btn">주문 정보 입력</button>
	  <script type="text/javascript">

	  </script>
	 </div>
	</div>
	
	
	<div class="orderInfo">
	 <form role="form" method="post" autocomplete="off">
	    
	  <input type="hidden" id="amount" name="amount" value="${sum}" />
	  
	   <div class="inputArea">
		  <label for="orderName">수령인</label>
		  <input type="text" name="orderName" id="orderName" required="required" />
	  </div>  
	  
	  <div class="inputArea">
	   <label for="Phone" style="width: auto;">수령인 연락처</label>
	   <input type="tel" name="Phone" id="Phone" required="required" />
	  </div>
	  
	  <div class="inputArea">
	   <button type="submit" class="order_btn">주문</button>
	   <button type="button" class="cancel_btn">취소</button> 
	   <script type="text/javascript">
			 $(".orderOpen_btn").click(function(){
			  $(".orderInfo").slideDown();
			  $(".orderOpen_btn").slideUp();
		  });
		  
	   $(".cancel_btn").click(function(){
		  $(".orderInfo").slideUp();
		  $(".orderOpen_btn").slideDown();
	  });
	  </script>
	  </div>
	  
	 </form> 
	</div>
 </div>
</section>
</body>
</html>