<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
/* function submit(obj){
	obj.submit();
} */

function lecList(select){
	var select = document.getElementById("select").value;
	alert("시작")
	alert("select--->"+select)
	$.ajax({
		url : "/applyList",
		data : {select : select},
		success: function(data){
			var str = '<tr>';
			
			$.each(data, (index, lec)=>{
				str += '<td>' + lec.id + '</td>';
				str += '<td>' + lec.name + '</td>';
				str += '<td>' + lec.grade + '</td>';
				str += '<td>' + lec.day1 + lec.time1 + '</td>';
				str += '<td>' + lec.day2 + lec.time2 + '</td>';
				str += '<td>' + lec.prof + '</td>';
				str += '<td>' + lec.type + '</td>';
				str += '<td>' + lec.major + '</td>';
				str += '<td>' + lec.unitScore + '</td>';
				
				
				str += '</tr>'
				
			});
			$("#lecList").html(str);
			}
		
		});
	
	}

</script>
<body>
	<h1>수강신청</h1>
	${userid }
	<div>2022학년도 2학기 수강신청 개설강좌     과목명 조회  
		
			<input type="hidden" value="${userid }" name="userid">
			<select id="select" onchange="lecList()">
				<option label="강의 목록"/>
				<option value="like">수강 장바구니</option >				
				<option value="all">수강 전체 과목</option>			
			</select>			
		
		
		<table style="border: 1px solid black">
				<thead>
					<tr>
						<th>강의코드</th><th>강의명</th><th>학년</th><th>강의시간</th><th>교수명</th>
						<th>이수구분</th><th>전공</th><th>학점</th><th>&nbsp;&nbsp;</th>
					</tr>
				</thead>		
				<tbody id = "lecList"></tbody>
		</table>

	
<%-- 			<!-- 수강 전체과목 선택시 -->
			
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
			 --%>
			
			
		
	</div>
<%-- 	<div>
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
	</div> --%>
</body>
</html>