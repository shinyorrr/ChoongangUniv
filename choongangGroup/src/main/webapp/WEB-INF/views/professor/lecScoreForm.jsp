<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="header.jsp"%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Content</title>
	<!-- bottSTrap CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous"/>
<!-- bootStrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- CSS -->
<link rel="stylesheet" href="/css/styles.css">
<link rel="stylesheet" href="/css/stylesLec.css">
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
<!-- IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<!-- JS -->
<script src="/js/main.js"></script>

<!--------- DATE PICKER --------->
 
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
/* function onlyNumber(obj) {
	  obj.value = obj.value.replace(/[^0-9]/g, "");
	} */
//강의 리스트 클릭시 강의 정보 띄우기
function lecUpdate(id) {
	$.ajax({
		url 	: "lecFindById",
		data	: {"id" : id},
		dataType: 'text',
		success	: function(data){
			var lec = JSON.parse(data);
			$('#lecId').val(id);
			$('#lecGrade').html(lec.grade);
			$('#lecTypeCode').html(lec.type);
			$('#lecUnitScore').html(lec.unitScore);
			$('#lecMajor').html(lec.major);
			
			$.ajax({
				url 	: "lecScoreForm",
				data	: {"id" : id},
				dataType: 'text',
				success	: function(data){
					console.log("나는 JSON : " + JSON.parse(data));
					console.log(JSON.parse(data).grList);
					console.log(JSON.parse(data).memList);
					var html = "<tbody>";
					if(data.length > 0){
						$('#scoreTable > tbody').empty();
						$.each(JSON.parse(data).memList, function(index, item){
							html += "<tr>";
							html += "<th scope='row' style='text-align: center; vertical-align: middle;'></th>";
						 	html += "<td style='text-align: center; vertical-align: middle;'>" + item.userid +"</td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>" + item.grade +"</td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>" + item.name +"</td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>" + item.major +"</td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>"; 
						 	html += "<input class='form-control onlynum' type='text' id='attendanceScore" + index + "' value='0'></td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>"; 
						 	html += "<input class='form-control onlynum' type='text' id='midtermScore" + index + "' value='0' ></td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>"; 
						 	html += "<input class='form-control onlynum' type='text' id='finalsScore" + index + "' value='0' ></td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>"; 
						 	html += "<input class='form-control onlynum' type='text' id='reportScore" + index + "' value='0' ></td>"; 
						 	
						 	html += "<td style='text-align: center; vertical-align: middle;'>"; 
						 	html += "<input class='form-control' type='text' id='avgScore" + index + "'></td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>"; 
						 	html += "<input class='form-control' type='text' id='totalScore" + index + "' ></td>"; 
						 	html += "<td class='px-2' style='text-align: center; vertical-align: middle;'>"; 
						 	html += "<input class='form-control' type='text' id='scoreF" + index + "'>"; 
						 	html += "<input type='hidden' id='scoreId" + index + "'></td>"; 
							
						 	html += "</tr>"; 
						});
						$('#scoreTable > thead').after(html); 
						$.each(JSON.parse(data).grList, function(index, item){
							if(item != null) {
								$('#attendanceScore' + index).val(item.attendance);
								$('#midtermScore' + index).val(item.midterm);
								$('#finalsScore' + index).val(item.finals);
								$('#reportScore' + index).val(item.report);
								$('#totalScore' + index).val(item.total);
								$('#scoreId' + index).val(item.id);
							}
						});
					}   //appned 쓰기
					html += "</tbody>";
					 
					 
				}
			});
		}
	});
}

// 성적 넘기기
function lecScoreSave(){
	var inputData = [];
	$("#scoreTable > tbody tr" ).each(function(){
		inputData.push(
		{
			userid :	 $(this).find("td").eq(0).text(),
			attendance : $(this).find("td").eq(4).find("input").val(),
			midterm :	 $(this).find("td").eq(5).find("input").val(),
			finals : 	 $(this).find("td").eq(6).find("input").val(),
			report :	 $(this).find("td").eq(7).find("input").val(),
			id :	 	 $(this).find("td").eq(10).find("input[type=hidden]").val(),
			total : 	 ""
		});
	});
	console.log(JSON.stringify(inputData));
 	$.ajax({
 		method  : "post",
		url 	: "lecScoreSave",
		data	: {data  : JSON.stringify(inputData), 
				   lecId : $('#lecId').val()},
		dataType: 'json',
		traditional: true, //배열 넘길때 사용
		success	: function(data){
			 
		}
	}); 
	
}

$(document).ready(function(){
	$(document).on('propertychange change keyup paste input', '.onlynum', function() {
		console.log($(this).val());
	    $(this).val($(this).val().replace(/[^0-9]/g, ""));
	    $(this).val(Number($(this).val()));
	    if(Number($(this).val()) > 100) {
	    	$(this).val(100);
	    }
	    if($(this).val() == "") {
	    	$(this).val(0);
	    }
	})
});

</script>
<style>

	table { 
		border-collapse: collapse; width: 100%;
	}
	/* td { 
	background: #fff; } */
	
	
	.tableFixHead {
	  overflow: auto;
	  height: 130px;
	}
	
	.tableFixHead thead th {
	  position: sticky;
	  top: 0;
	}
		
</style>
	
</head>

<body class="" id="body-pd">

	<nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
			<a href="/" class="navbar-brand">
				<img class="img-fluid" src="/images/logo2.png" alt="logo2" style="height: 40px;">
				<use xlink:href="#bootstrap"></use>
			</a>

			<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">Features</a></rotli>
				<li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">About</a></li>
			</ul>
		</header>
	</nav>
	
	<!-- side nav bar -->
<div class="l-navbar" id="navbar">
	<nav class="navv">
		<div>
			<div class="nav__brand">
				<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
			</div>
			<div class="nav__list">
				<a href="#" class="nav__link active">
					<div style="width: 20px; height: 20px;">
						<i class="bi bi-mortarboard nav__icon "></i>
					</div>
					<span class="nav_name">학사관리</span>
				</a>
				<a href="#" class="nav__link">
					<div style="width: 20px; height: 20px;">
						<i class="bi bi-file-earmark-text nav__icon "></i>
					</div>
					<span class="nav_name">결재</span>
				</a>

				<div href="#" class="nav__link collapses">
					<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">Projects</span>

					<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

					<ul class="collapse__menu">
						<a href="#" class="collapse__sublink">Data</a>
						<a href="#" class="collapse__sublink">Group</a>
						<a href="#" class="collapse__sublink">Members</a>
					</ul>
				</div>

				<a href="#" class="nav__link">
					<ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">Analytics</span>
				</a>

				<div href="#" class="nav__link collapses">
					<ion-icon name="people-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">Team</span>

					<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

					<ul class="collapse__menu">
						<a href="#" class="collapse__sublink">Data</a>
						<a href="#" class="collapse__sublink">Group</a>
						<a href="#" class="collapse__sublink">Members</a>
					</ul>
				</div>

				<a href="#" class="nav__link">
					<ion-icon name="settings-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">Settings</span>
				</a>
			</div>
 				<a href="#" class="nav__link">
				<ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">Log out</span>
			</a>
		</div>
	</nav>
</div>
	<!-- /side nav bar -->

<!------- main content ------------>
<div class="container-fluid w-100 row" style=" background-color: rgb(214, 225, 237);">
	<!-- <div class="row"> -->

		<!-- content header -->
		<div class="col-12 p-4" style="height: 150px; background-color: rgb(95, 142, 241); vertical-align: middle;">
			<div class="d-flex flex-row" >
				<div class="text-white h4">안녕하세요. <b>${name }</b>님!</div>
					<span class="border border-1 border-white border-bottom rounded-pill text-white px-2 pt-1 pb-0 ms-2 me-3"
								style="font-size: 12px; height: 24px;">교수</span>
					<i class="text-white bi-gear-fill mx-2" style="height: 18px;"></i>
			</div>
			<div class="d-flex text-white" style="font-size: 14px;">${major} | ${position}</div>
			<div class="d-flex flex-low text-white" style="font-size: 14px;">
				<i class="bi bi-envelope-fill me-3 ml-0 "></i>${email }
			</div>
		</div>

	<!------------- card header  컨텐츠 폼------------->
		<main class="col-9 h-100 w-100">
			<div class="row m-5">
			<!------------- 컨텐츠 경로 ------------->
				<div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;">
					<i class="bi bi-bookmark-fill me-2"></i>성적관리
				</div>
				<!----- card content 내용 ------>
				<div class="col-12 rounded-bottom overflow-auto bg-white p-5" style="min-height: 550px;">
					<h2>성적관리</h2>
					<hr class="mb-5">
					
					<div class="row mb-2">
						<div class="col-md-6">
							<div class="fw-bold" style="font-size: 1.2em; display: inline;">강의 리스트</div>
							<div class="font08" style="display: inline; float: right;">총 <b>${lecCnt}</b> 건</div>
								
								<div class="mt-2" style="height: 300px;border: solid 1px #bdbebe;">
								
								<table class="table table-bordered table-hover table-sm font09" style="align:center;" id="lecTable">
									<thead class="table-secondary">
										<tr style="text-align: center;">
											<th scope="col" style="vertical-align: middle; width: 5%;">번호</th>
											<th scope="col" style="vertical-align: middle; width: 10%;">과목코드</th>
											<th scope="col" style="vertical-align: middle; width: 20%;">과목명</th>
											<th scope="col" style="vertical-align: middle; width: 8%;">성적입력</th>
										</tr>
									</thead>
									<tbody >
									<c:forEach var="lec" items="${lecList}">
										<c:set var="i" value="${i+1}"></c:set>
										<tr  onclick="lecUpdate(${lec.id})">
											<th class="text-center">${i}</th>
											<td class="text-center">${lec.typeCode}${lec.id}</td>
											<td class="text-center">${lec.name}</td>
										<c:choose>
											<c:when test="${lec.scoreStatus eq '0'}">
												<td class="text-center text-danger fw-bold">미입력</td>
											</c:when>
											<c:otherwise>
												<td class="text-center text-primary fw-bold">마감</td>
											</c:otherwise>
										</c:choose>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								</div>
								
							</div>
						
						<div class="col-md-6">
						<div class="fw-bold" style="font-size: 1.2em;">성적입력정보</div>
							<div class="mt-2 p-4" style="height: 300px;border: solid 1px #bdbebe;">
					
						<div class="fw-bold item-start my-2" style="display: inline; float: left;">강의정보</div>
						
						<table class="table font08 text-center table-bordered">
							<tr>
								<th class="table-secondary text-center" scope="col" style="vertical-align:middle; width:15%;">이수구분</th>
								<td class="p-2" id="lecTypeCode">
								</td>
								<th class="table-secondary me-0" scope="col" style="vertical-align:middle; width:10%;">전공</th>
								<td id="lecMajor">
									
								</td>
								<th class="table-secondary me-0" scope="col" style="vertical-align:middle; width:10%;">학점</th>
								<td id="lecUnitScore">
									
								</td>
								<th class="table-secondary me-0" scope="col" style="vertical-align:middle; width:10%;">학년</th>
								<td id="lecGrade">
									
								</td>
							</tr>
						</table>
						
						<div class="fw-bold item-start my-2" style="display: inline; float: left;">성적등급 분포 현황</div>
						
						<table class="table-sm font08 text-center table-bordered">
							<thead class="table-secondary">
								<tr >
									<th scope="col"></th>
									<th scope="col">A+</th>
									<th scope="col">A0</th>
									<th scope="col">B+</th>
									<th scope="col">B0</th>
									<th scope="col">C+</th>
									<th scope="col">C0</th>
									<th scope="col">D+</th>
									<th scope="col">D0</th>
									<th scope="col">F</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>가능인원</th>
									<td> 명/ %</td>
									<td> 명/ %</td>
									<td> 명/ %</td>
									<td> 명/ %</td>
									<td> 명/ %</td>
									<td> 명/ %</td>
									<td> 명/ %</td>
									<td> 명/ %</td>
									<td> 명/ %</td>
								</tr>
								<tr>
									<th>배정인원</th>
									<td> 0명 </td>
									<td> 0명 </td>
									<td> 0명 </td>
									<td> 0명 </td>
									<td> 0명 </td>
									<td> 0명 </td>
									<td> 0명 </td>
									<td> 0명 </td>
									<td> 0명 </td>
								</tr>
								<tr>
									<th>배정비율</th>
									<td> 0% </td>
									<td> 0% </td>
									<td> 0% </td>
									<td> 0% </td>
									<td> 0% </td>
									<td> 0% </td>
									<td> 0% </td>
									<td> 0% </td>
									<td> 0% </td>
								</tr>
							</tbody>
						</table>
						
					</div>	
	
				</div>
				
				<br>
				<div >
 				
				<div class="my-5"></div>
				
				<div class="mt-2 fw-bold" style="font-size: 1.2em; display: inline;">강의학생</div>
				<div class="mx-0 px-0" style="display: inline; float: right;">
					<button type="button" style="  display: inline-block" class="btn btn-primary btn-sm  px-4"
							id="lecScoreSave" onclick="lecScoreSave()">&nbsp;&nbsp; 저장 &nbsp;&nbsp;</button>
					<button type="button" id="lecScoreCal" onclick="lecScoreCal()" style=" display: inline-block;" class="px-4 btn btn-dark btn-sm me-1"
							>등급계산</button>
				</div>
				<div class="my-3"></div>
				
				
				<input type="hidden" id="lecId" name="id">
				
				<table class="table font09 text-center" id="scoreTable">
					<thead class="table-secondary">
						<tr style="text-align: center;">
							<th scope="col" style="vertical-align: middle; width: 4%;">상태</th>
							<th scope="col" style="vertical-align: middle; width: 12%;">학번</th>
							<th scope="col" style="vertical-align: middle; width: 5%;">학년</th>
							<th scope="col" style="vertical-align: middle; width: 10%;">이름</th>
							<th scope="col" style="vertical-align: middle; width: 13%;">전공</th>
							
							<th scope="col" style="vertical-align: middle; width: 5%;">출결<span class="font08">(20%)</span></th>
							<th scope="col" style="vertical-align: middle; width: 5%;">중간<span class="font08">(30%)</span></th>
							<th scope="col" style="vertical-align: middle; width: 5%;">기말<span class="font08">(30%)</span></th>
							<th scope="col" style="vertical-align: middle; width: 5%;">과제<span class="font08">(20%)</span></th>
							<th scope="col" style="vertical-align: middle; width: 5%;">총점</th>
							<th scope="col" style="vertical-align: middle; width: 5%;">등급</th>
							<th class="px-1" scope="col" style="vertical-align: middle; width: 8%;">&nbsp; 재수강여부 &nbsp;</th>
						</tr>
					</thead>
					<%-- <tbody>
						<tr>
							<th scope="row" style="text-align: center; vertical-align: middle;"></th>
							<td style="text-align: center; vertical-align: middle;">${mem.userid}</td>
							<td style="text-align: center; vertical-align: middle;">${mem.grade}</td>
							<td style="text-align: center; vertical-align: middle;">${mem.name}</td>
							<td style="text-align: center; vertical-align: middle;">${mem.major}</td>
							
							<td style="text-align: center; vertical-align: middle;">
								<input class="form-control" type="text" name="attendance" id="attendanceScore"  >
							</td>
							<td style="text-align: center; vertical-align: middle;">
								<input class="form-control" type="text" name="midterm" id="midtermScore"  >
							</td>
							<td style="text-align: center; vertical-align: middle;">
								<input class="form-control" type="text" name="finals" id="finalsScore"  >
							</td>
							<td style="text-align: center; vertical-align: middle;">
								<input class="form-control" type="text" name="report" id="reportScore"  >
							</td>
							<td style="text-align: center; vertical-align: middle;">
								<input class="form-control" type="text" name="avgScore" id="avgScore"  >
							</td>
							<td style="text-align: center; vertical-align: middle;">
								<input class="form-control" type="text" name="total" id="totalScore"  >
							</td>
							<td class="px-2" style="text-align: center; vertical-align: middle;">
								<input class="form-control" type="text" name="scoreF" id="scoreF">
							</td>
						</tr>
						
					</tbody> --%>
					</table>
				</div>
				
				
				
				
				</div>
			</div>
			</div>
		</main>
					
		<!-- footer -->
		<footer class="col-12" style="height: 60px; font-size: 12px;">
			@2022 ChoongAng University. All Rights Reserved.
		</footer>    
</div>

</body>
</html>