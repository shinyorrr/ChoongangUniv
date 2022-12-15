<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container_box table td {
	width: 100px;
}

section#container {
	padding: 20px 0;
	border-top: 2px solid #eee;
	border-bottom: 2px solid #eee;
}

section#container::after {
	content: "";
	display: block;
	clear: both;
}

aside {
	float: left;
	width: 200px;
}

div#container_box {
	float: right;
	width: calc(100% - 200px - 20px);
}

aside {
	float: left;
	width
	200px;
}

aside ul li {
	text-align: center;
	margin-bottom: 10px;
}

aside ul li a {
	display: block;
	width: 100%;
	padding: 10px 0;
}

aside ul li a:hover {
	background: #eee;
}

.inputArea {
	border: 1px;
	margin: 10px 0;
}

select {
	width: 100px;
}

label {
	display: inline-block;
	width: 70px;
	padding: 5px;
}

label[for='bookInfo'] {
	display: block;
}

input {
	width: 150px;
}

textarea#bookInfo {
	width: 400px;
	height: 180px;
}

.orderInfo {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin: 20px 0;
}

.orderInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
}

.orderView li {
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #999;
}

.orderView li::after {
	content: "";
	display: block;
	clear: both;
}

.thumb {
	float: left;
	width: 200px;
}

.thumb img {
	width: 200px;
	height: 200px;
}

.bookInfo {
	float: right;
	width: calc(100% - 220px);
	line-height: 2;
}

.bookInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 100px;
	margin-right: 10px;
}

.orderInfo {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin: 20px 0;
}

.orderInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
}

.orderView li {
	margin-bottom: 20px;
	padding-bottom: 20px;
	border-bottom: 1px solid #999;
}

.orderView li::after {
	content: "";
	display: block;
	clear: both;
}

.thumb {
	float: left;
	width: 200px;
}

.thumb img {
	width: 200px;
	height: 200px;
}

.bookInfo {
	float: right;
	width: calc(100% - 220px);
	line-height: 2;
}

.bookInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 100px;
	margin-right: 10px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
	function requestPay(){
		console.log("amount -> "+ $('#amount').val());
		var billState = $('#billState').val();
		var state = $("#state").val();
		if(state != '주문취소'){
		if(billState != '결제완료'){
		//var IMP = window.IMP; // 생략가능
		IMP.init('imp47214821');
		IMP.request_pay({
			pg : 'kakaopay',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '중앙 대학교',
			amount : $('#amount').val(),
			buyer_email : 'abcMartek@siot.do',
			buyer_name : '이례영', //구매자 이름
			buyer_tel : '010-5014-6344',
			buyer_addr : '',
			buyer_postcode : ''
		}, function(rsp) {
			if(rsp.success){
				
			var billState = $("#state2_btn").val();
			var orderId = $("#orderId").val();
			console.log("orderId"+orderId);
			console.log("billState"+billState);
			var data = {
					orderId:orderId,
					billState:billState
			};

			$.ajax({
				url : "/student/billChange",
				type : "post",
				data : data,
				success : function(rsp) {
					alert("결제가 완료되었습니다.");
					location.href = "/student/orderList";
				},
				error : function() {
					alert("결제에 실패하였습니다.");
					location.href = "/student/orderList";
						}
					});
				}
		});
		}else{
			alert("이미 결제 된 건 입니다.");
		}
		}else{
			alert("주문 취소 된 건입니다.");
		}
	}
</script>
<script type="text/javascript">

	$(document).ready(function(){
		var state = $("#state").val();
		/* const target = document.getElementById('#state1_btn');
		const tar = document.getElementById('#state2_btn');  */
		if(state == '주문취소'){
			$("#state1_btn").attr('disabled', 'disabled');
			$("#state2_btn").attr('disabled', 'disabled');
		}
		else {
				$("#state1_btn").attr('disabled',false);
				$("#state2_btn").attr('disabled',false);
		}
	});
		
</script>
</head>
<body>
	<section id="content">
		<aside>
			<%@include file="include/aside.jsp"%>
		</aside>
		<div id="container_box">
		<div class="orderInfo">
			<c:forEach items="${orderView}" var="orderView" varStatus="status">

				<c:if test="${status.first}">
					<p>
						<span>수령인</span>
						${orderView.orderName}
					</p>
					<p>
						<span>가격</span>
						<fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원
					</p>
					<p>
						<span>수령장소</span>${orderView.bookLoca}
					</p>
					<p>
						<span>상태</span>${orderView.state }
					</p>
					<p>
						<span>결제상태</span>${orderView.billState }
					</p>
					<div class="StateChange">
						<form action="/student/orderView" role="form" method="post"	id="stateForm" name="stateForm" class="stateForm">
							<input type="hidden" name="userId" value="${orderView.userId }">
							<input type="hidden" name="orderId" value="${orderView.orderId}" />
							<input type="hidden" name="state" id="state" class="state"	value="${orderView.state }" />
							<input type="hidden" name="billState" id="billState" class="billState"	value="${orderView.billState }" />
							<button type="submit" name="state1_btn" id="state1_btn"	class="state1_btn" value="주문취소" onclick="btnDisabled()" >주문취소</button>
							
						</form>
						<form action="/student/billChange" role="form" method="post"	id="stateForm" name="stateForm" class="stateForm">
							<input type="hidden" name="userId"  value="${orderView.userId }">
							<input type="hidden" name="orderId" id="orderId" value="${orderView.orderId}" />
							<input type="hidden" name="amount" id="amount" value="${orderView.amount}" />
							<input type="hidden" name="billState" id="billState" class="billState"	value="" />
								<button type="button" name="state2_btn" id="state2_btn"	class="state2_btn" value="결제 완료" onclick="requestPay()">결제</button>
						</form>
					</div>
				</c:if>

			</c:forEach>
		</div>

		<ul class="orderView">
			<c:forEach items="${orderView}" var="orderView">
				<li>
					<div class="thumb">
						<img src="${orderView.bookThumbImg}"
							style="width: 200px; height: 150px; object-fit: contain;" />
					</div>
					<div class="bookInfo">
						<p>
							<span>상품명</span>
							${orderView.bookName}<br /> 
							<span>개당 가격</span>
							<fmt:formatNumber pattern="###,###,###"	value="${orderView.bookPrice}" /> 원<br /> 
							<span>구입 수량</span>
							${orderView.cartStock} 개<br /> 
							<span>최종가격</span>
							<fmt:formatNumber pattern="###,###,###"	value="${orderView.bookPrice * orderView.cartStock}" />	원<br /> 
							<span>상태</span>${orderView.state }<br/>
							<span>결제상태</span>${orderView.billState }
					</div>
				</li>
			</c:forEach>
		</ul>
		</div>
	</section>
</body>
</html>