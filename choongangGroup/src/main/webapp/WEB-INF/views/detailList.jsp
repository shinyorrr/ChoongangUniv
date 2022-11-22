<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<h1>학적 정보 조회 </h1>

<!-- 학적 조회 /수정 버튼  -->

			 	
<input type="radio" class="btn-check" name="options" id="option1" autocomplete="off" checked>
<label class="btn btn-secondary" for="option1"  >학적조회</label>

<input type="radio" class="btn-check" name="options" id="option2" autocomplete="off">
<label class="btn btn-secondary" for="option2">학적수정</label>


<div class="card mb-3" style="width: 200px; height: 200px; ">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="..." class="img-fluid rounded-start" alt="이미지">
    </div>
        
  </div>
 
</div>

<table border="1">

			<tr><th>성명</th><td>${emp.job } </td> 			<th>학번</th><td>여자</td>       <th>국적</th><td>여자</td></tr>
			<tr><th>휴대전화</th><td> ${emp.job }</td>			<th>학년</th><td>여자</td>      <th>주소</th><td>여자</td></tr>
			<tr><th>성별</th><td>${emp.job }</td> 			<th>학적상태</th><td>여자</td>    <th>E-Mail</th><td>여자</td></tr>
			                                    			<th>졸업여부</th><td>여자</td>     <th>지도교수</th><td>여자</td></tr>
			<tr><th>계좌번호</th><td>${emp.hiredate }</td> 	<th>전형</th><td>여자</td>      <th>최종변동</th><td>여자</td></tr>
			<tr><th>입금계좌</th><td>${emp.com }</td> 			<th>부전공</th><td>여자</td>     <th>입합전형</th><td>여자</td></tr>
			<tr><th>입학 일자</th><td>${emp.mgr }</td>			<th>성명</th><td>여자</td>       <th>비상연락망</th><td>여자</td></tr>
	

</table>






</body>
</html>