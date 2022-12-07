<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>장바구니 신청</h1>
	${userid }
	2022학년도 2학기 수강신청 개설강좌     과목명 조회  	
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
					<td><input type="button" value="신청" onclick="submit('${lec.id}','${userid}')"></td>		
				</tr>	
			</c:forEach>	
		</table>
</body>
</html>