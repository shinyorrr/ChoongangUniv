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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function submit(obj){
		obj.submit();
		
	}
	
	function submit(lecId, userid){
		$.ajax({
			url:"/apply",
			data:{lecId : lecId , userid : userid},
			dataType:'text',
			success:function(data){
				const result = $.trim(data);

				if(result == 1){
				alert("성공")
				location.reload();
				}else if(result == 0){
					alert("중복된 강의입니다.")
				}else if(result ==2){
					alert("시간이 중복되었습니다.")
				}else{
					alert("최대학점을 초과했습니다 [신청가능 최대학점 : 21학점]")
				}
			}		
		});	
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
		
	
		
		<table>
			<tr>
				<th>강의코드</th><th>강의명</th><th>학년</th><th>강의시간</th><th>교수명</th>
				<th>이수구분</th><th>전공</th><th>학점</th><th>&nbsp;&nbsp;</th>
			</tr>
			
			<!-- 수강 장바구니 -->			
			<c:if test="${select eq 'like'}">
			<c:forEach var="list" items="${list }">
				<tr>
					<td>${list.lecture.id }</td><td>${list.lecture.name }</td><td>${list.lecture.grade }</td>
					<td>${list.lecture.day1}${list.lecture.time1}, ${list.lecture.day2}${list.lecture.time2}</td><td>${list.lecture.prof }</td><td>${list.lecture.type }</td>
					<td>${list.lecture.major }</td><td>${list.lecture.unitScore }</td>
					<td><input type="button" value="신청" onclick="submit('${list.lecture.id}','${userid}')"></td> 			
				</tr>	
			</c:forEach>
			</c:if>	
			
			<!-- 수강 전체 과목 -->
			<c:if test="${select eq 'all'}">
			<c:forEach var="lec" items="${list }">
				<tr>
					<td>${lec.id }</td><td>${lec.name }</td><td>${lec.grade }</td>
					<td>${lec.day1}${lec.time1}, ${lec.day2}${lec.time2}</td><td>${lec.prof }</td><td>${lec.type }</td>
					<td>${lec.major }</td><td>${lec.unitScore }</td>
					<td><input type="button" value="신청" onclick="submit('${lec.id}','${userid}')"></td>	
				</tr>	
			</c:forEach>
			</c:if>	
			
		</table>		
	</div>
</body>
</html>