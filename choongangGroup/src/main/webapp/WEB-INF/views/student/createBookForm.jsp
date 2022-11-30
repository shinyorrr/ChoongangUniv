<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="bookCreateList" method="post">
				<table class="table table-bordered table-sm mt-2 " style="font-size: 0.8em;">
						<tr style="text-align: center;">
							<th scope="col" style="vertical-align: middle; width: 4%;">책 코드</th>
							<td class="text-center"><input type="number" name="createCnt" value="${Book.bookid}"></td>
						</tr>
						<tr style="text-align: center;">
							<th scope="col" style="vertical-align: middle; width: 4%;">책 이름</th>
							<td class="text-center"><input type="text" name="createCnt" value="${Book.bookname}"></td>
						</tr>
						<tr style="text-align: center;">
							<th scope="col" style="vertical-align: middle;">책 가격</th>
							<td class="text-center"><input type="number" name="createCnt" value="${Book.bookprice}"></td>
						</tr>
						<tr style="text-align: center;">
							<th scope="col" style="vertical-align: middle;">재고</th>
							<td class="text-center"><input type="number" name="createCnt" value="${Book.stockQuantity}"></td>
						</tr>
				</table>
	</form>
	
</body>
</html>