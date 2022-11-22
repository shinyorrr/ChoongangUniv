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

<body>
	<h1>수강신청</h1>
	${userid }
	<table border="1">
		<tr>
			<th>강의코드</th><th>강의명</th><th>학년</th><th>강의시간</th><th>교수명</th>
			<th>이수구분</th><th>전공</th><th>학점</th><th>&nbsp;&nbsp;</th>
		</tr>
		<c:forEach var="lec" items="${list }">
			<tr>
				<td>${lec.id }</td><td>${lec.name }</td><td>${lec.grade }</td>
				<td>${lec.day1}${lec.time1}, ${lec.day2}${lec.time2}</td><td>${lec.prof }</td><td>${lec.type }</td>
				<td>${lec.major }</td><td>${lec.unitScore }</td>
				<td><input type="button" value="신청" onclick="location.href='apply?lecId=${lec.id}&&userid=${userid}'"></td>		
			</tr>	
		</c:forEach>	
	</table>
</body>
</html>