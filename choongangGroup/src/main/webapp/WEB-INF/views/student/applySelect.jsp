<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/bootstrap.css">
</head>
<script type="text/javascript">
function submit(obj){
	obj.submit();
	
}

</script>
<body>
	<h1>수강신청</h1>
	${userid }
	<div>2022학년도 2학기 수강신청 개설강좌     과목명 조회  
		<form action="applyForm"  method="get">
			<input type="hidden" name="userid" value="${userid }">
			<select name="select" onchange="submit(this.form)">
				<option label="강의 목록"/>
				<option value="like">수강 장바구니</option >				
				<option value="all">수강 전체 과목</option>			
			</select>			
		</form>
		
		
</body>
</html>