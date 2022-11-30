<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>안내문</h1>
<hr>
장바구니 기간 : 
수강신청 기간

<br>
장바구니
<button value="장바구니" onclick="location.href='likeMain?userid=${userid}'"></button>
수강신청
<button value="수강신청" onclick="location.href='applySelect?userid=${userid}'"></button>
</body>
</html>