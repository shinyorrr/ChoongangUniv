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
	function chk(){
		$(document).ready(function(){
		var state = $('#state').val();
		var orderId = $('#orderId').val();
		var state1_btn = $('#state1_btn').val();
		var data = {
				state : state,
				state1_btn : state1_btn,
				orderId : orderId
		};
		
		
		if(state != "준비 완료"){
		$.ajax({
			url : "/manager/adminOrderView",
			type : "post",
			data : data,
			success : function() {
				alert("준비가 완료되었습니다.");
				location.reload();
				/* location.href = "redirect:/admin/adminOrderView"; */
			},
			error : function() {
				alert("준비가 실패하였습니다.");
					}
				});
		} else{
			alert("준비완료된 건입니다.");
		}
		});	
	}
</script>
<script type="text/javascript">

	$(document).ready(function(){
		var state = $("#state").val();
		/* const target = document.getElementById('#state1_btn');
		const tar = document.getElementById('#state2_btn');  */
		if(state == '주문취소'){
			$("#state1_btn").attr('disabled', 'disabled');
		}
		else {
				$("#state1_btn").attr('disabled',false);
		}
	});
		
</script>
<script type="text/javascript">

	$(document).ready(function(){
		var state = $("#state").val();
		/* const target = document.getElementById('#state1_btn');
		const tar = document.getElementById('#state2_btn');  */
		if(state == '수령 완료'){
			$("#state1_btn").attr('disabled', 'disabled');
		}
		else {
				$("#state1_btn").attr('disabled',false);
		}
	});
		
</script>
</head>
<body>
<section id="content">
  <aside>
		<%@include file="include/aside.jsp" %>
	</aside>
	<div id="container_box"> 
<div class="orderInfo">
  <c:forEach items="${orderView}" var="orderView" varStatus="status">
  
  <c:if test="${status.first}">
   <p><span>주문자</span>${orderView.userId}</p>
   <p><span>수령인</span>${orderView.orderName}</p>
   <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
   <p><span>준비상태</span>${orderView.state}</p>
   <p><span>결제상태</span>${orderView.billState}</p>
							<div class="StateChange">
								<form action="/manager/adminOrderView" role="form" method="post" id="stateForm" name="stateForm" class="stateForm">
								
									<input type="hidden" name="bookId" id="bookId" value="${orderView.bookId}" />
									<input type="hidden" name="orderId" id="orderId" value="${orderView.orderId}" />
									<input type="hidden" name="state" id="state" class="state" value="${orderView.state}" />
									<input type="hidden" name="amount" id="amount" class="amount" value="${orderView.amount}" />
									<input type="hidden" name="cartStock" id="cartStock" class="cartStock" value="${orderView.cartStock}" />
									<input type="hidden" name="bookStock" id="bookStock" class="bookStock" value="${orderView.bookStock}" />
									 
<!-- 									<button type="submit" name="state1_btn" id="state1_btn" class="state1_btn" onclick="chk()" value="준비완료">준비 완료</button> -->
									<button type="button" name="state1_btn" id="state1_btn" class="state1_btn" value="준비 완료" onclick="chk()">준비 완료</button>
									<!-- <script type="text/javascript">
									function chk(){
										var isDisabled = false;
										
										$('#state1_btn').click(function () {

										    if (isDisabled) {  //<-( 1 ) 수행가능여부 검사
										      alert("이미 작업이 수행중입니다.");
										      return false;
										    } else {
										      isDisabled = true; //<-( 2 ) 실행 불가능하도록 flag 변경
										      doSomthing();
										      isDisable = false;    //(3)수행가능하도록 열어준다. settimeout을통해 X초 뒤에 풀어주는것도 방법이다.
										    }
										});
									</script> -->
									<button type="submit"  name="state1_btn" id="state1_btn"  class="state1_btn" value="수령 완료">수령 완료</button>
									
								</form>
							</div>
  </c:if>
  
 </c:forEach>
</div>

<ul class="orderView">
 <c:forEach items="${orderView}" var="orderView" varStatus="status"> 
 <li>
  <div class="thumb">
   <img src="${orderView.bookThumbImg}" />
  </div>
  <div class="bookInfo">
   <p>
    <span>상품명</span>${orderView.bookName}<br />
    <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.bookPrice}" /> 원<br />
    <span>구입 수량</span>${orderView.cartStock} 개<br />
    <span>재고 수량</span>${orderView.bookStock} 개<br />
    <span>준비상태</span>${orderView.state}<br />
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