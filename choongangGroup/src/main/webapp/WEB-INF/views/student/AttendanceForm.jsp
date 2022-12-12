<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Required meta tags -->


 <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>



<title>Insert title here</title>
</head>


<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<h6>출석</h6>
<hr>
	<div style="margin-left: 300px;">
			<span class="badge text-bg-secondary">출결</span>
			<span class="badge text-bg-success">지각</span>
			<span class="badge text-bg-danger">결석</span>
	
	

<%-- 
        <input type="hidden"  name="userid"  value="${userid}">
 			<select class="form-select form-select-lg mb-3 " aria-label=".form-select-lg example" name="lec_id">

				<option selected disabled>평가과목선택</option>
				<c:forEach var="l" items="${lecList}" >
				<option value="${l.lec_id}">${l.lec_name}</option> 

				</c:forEach>

			</select>

 --%>



</div>
<%-- 	<div>	
		<table>	
		<c:forEach var="a" items="${attendanceList }">
		 순번 (자동으로 1부터  숫자 메겨지게하기위해서 적어줌)
		<c:set var="sum" value="${sum+1 }" />
	
		<tr>   
				<th>${sum}주차</th>
				<th>${a.date } </th>
				<th>${a.status } </th>	
		</tr>
		</c:forEach>
		</table>				
	</div>
 --%>



</body>
</html>