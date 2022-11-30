<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="masthead-content">
        <div class="container">
            <!-- 주문 폼 시작-->
            <form action="/pay" method="post">
                <h1 class="masthead-heading mb-0">결제 테스트</h1>
                상품<input type="text" name="itemName"><br><br>
                주문자 <input type="text" size="10" name="username"><br><br>
                가격 <input type="text" size="5" name="price"><br>
                <button type="submit" class="btn btn-primary btn-xl rounded-pill mt-5">결제하기</button>
            </form>
            <!-- 주문 폼 끝-->
        </div>
    </div>
    <div class="bg-circle-1 bg-circle"></div>
    <div class="bg-circle-2 bg-circle"></div>
    <div class="bg-circle-3 bg-circle"></div>
    <div class="bg-circle-4 bg-circle"></div>
</body>
</html>