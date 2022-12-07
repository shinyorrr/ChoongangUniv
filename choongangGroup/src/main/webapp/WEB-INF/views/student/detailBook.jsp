<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>교재정보</h2>
<table>
			<tr><th>책코드</th><td>${blist.bookid }</td></tr>
			<tr><th>책이름</th><td>${blist.bookname }</td></tr>
			<tr><th>책금액</th><td>${blist.bookprice }</td></tr>
			<tr><th>재고수량</th><td>${blist.stockQuantity }</td></tr>
			<tr><td colspan="2">
			 <input type="button" value="목록"
			 	onclick="location.href='bookList'"	>
			  <input type="button" value="수정"
			 	onclick="location.href='updateFormBook?bookid=${blist.bookid}'"	>
			 	 <input type="button" value="삭제"
			 	onclick="location.href='delete?bookid=${blist.bookid}'"></td>
			 	</tr>
</table>
</body>
</html>