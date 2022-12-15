<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
	function requestPay() {

		//var IMP = window.IMP; // 생략가능
		IMP.init('imp47214821');

		IMP.request_pay({
			pg : 'kakaopay',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '중앙 대학교',
			amount : $ParseInt(("#amount")),
			buyer_email : 'abcMartek@siot.do',
			buyer_name : '이례영', //구매자 이름
			buyer_tel : '010-5014-6344',
			buyer_addr : '',
			buyer_postcode : ''
		}, function(rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}

			alert(msg);
		});
	}
</script>
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

section#content ul li {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin-bottom: 20px;
}

section#content .orderList span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
	margin-right: 10px;
}
</style>
</head>
<body>
	<section id="content">
		<aside>
			<%@include file="include/aside.jsp"%>
		</aside>
		<div id="container_box">

			<div>
				<input type="hidden" name="orderId" id="orderId"
					value="${orderList.orderId}"> <input type="hidden"
					name="orderName" id="orderName" value="${orderList.orderName}">
				<input type="hidden" name="amount" id="amount"
					value="${orderList.amount}"> <input type="hidden"
					name="Phone" id="Phone" value="${orderList.Phone}">
				<p>
					<span>주문번호</span>${orderList.orderId}</p>
				<p>
					<span>수령인</span>${orderList.orderName}</p>
				<p>
					<span>가격</span>
					<fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" />
					원
				</p>
				<p>
					<span>수령장소</span>${orderList.bookLoca}</p>
				<p>
					<span>상태</span>${orderList.state}</p>
			</div>
			<div class="inputArea">
				<button type="submit" class="order_btn" onclick="requestPay()">주문</button>
				<button type="button" class="cancel_btn">취소</button>
			</div>
		</div>
	</section>
</body>
</html>