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
<script src="/js/bootstrap-datepicker.js"></script>

<!--------- DATE PICKER --------->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" > -->
<link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
 
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).on('focus',".date", function(){
    $(this).datepicker({format: 'yyyy-mm-dd'});
})

function lecUpdate(id) {
	console.log("강의 클릭 ===> " + id);
	$.ajax({
		url 	: "lecFindById",
		data	: {"id" : id},
		dataType: 'text',
		success	: function(data){
			console.log("성공===> " + data );
			var lec = JSON.parse(data);
			console.log("==>" + lec.name);
			document.getElementById("lecName").value=lec.name;
			document.getElementById("lecGrade").value=lec.grade;
			document.getElementById("lecBuilding").value=lec.building;
			document.getElementById("lecRoom").value=lec.room;
			document.getElementById("lecDay1").value=lec.day1;
			document.getElementById("lecTime1").value=lec.time1;
			document.getElementById("lecDay2").value=lec.day2;
			document.getElementById("lecTime2").value=lec.time2;
			document.getElementById("lecMaxStud").value=lec.maxStud;
			document.getElementById("lecMaxCount").value=lec.maxCount;
			document.getElementById("lecTypeCode").value=lec.typeCode;
			document.getElementById("lecUnitScore").value=lec.unitScore;
			document.getElementById("lecYear").value=lec.year;
			document.getElementById("lecSemester").value=lec.semester;
			document.getElementById("lecMajor").value=lec.major;
			document.getElementById("lecId").value=lec.id;
			
		}
	});
}
function lecDelete() {
	var id = document.getElementById("lecId").value;
	console.log("강의 클릭 ===> " + id);
	if(confirm("삭제하시겠습니까?") == true){
		$.ajax({
			url 	: "lecDelete",
			data	: {"id" : id},
			dataType: 'text',
			success	: function(data){
				window.location.reload();
			}
		});
	} else{
		return false;
	}
	
}

function newLec(){
	document.getElementById("lecName").value = "";
	document.getElementById("lecGrade").value= "1";
	document.getElementById("lecBuilding").value= "중앙동";
	document.getElementById("lecRoom").value= "101호";
	document.getElementById("lecDay1").value= "월";
	document.getElementById("lecTime1").value= "1교시";
	document.getElementById("lecDay2").value= "선택";
	document.getElementById("lecTime2").value= "선택";
	document.getElementById("lecMaxStud").value= "";
	document.getElementById("lecMaxCount").value= "15";
	document.getElementById("lecTypeCode").value= "";
	document.getElementById("lecUnitScore").value= "1";
	document.getElementById("lecYear").value= "";
	document.getElementById("lecSemester").value= "1";
	document.getElementById("lecMajor").value= "";
	document.getElementById("lecId").value= ""
}

   // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.


/* 	function deptDelete(index){
		console.log(index);
		var vdeptno = $("#deptno"+index).text();
		if(confirm("삭제하시겠습니까?") == true){
			$.ajax({
				url 	: "/deptDelete",
				data	: {deptno : vdeptno},
				dataType: 'text',
				success	: function(data){
						$('#deptNum'+index).remove();
				}
			});
		} else{
			return false;
		}
	}
	
	function updateForm(vIndex){
		console.log(vIndex);
		$("#deptnoSpan"+vIndex).text(" ");
		$("#dnameSpan"+vIndex).text(" ");
		$('#deptnoInput'+vIndex).show();
		$('#dnameInput'+vIndex).show();
		$('#afterUpdate'+vIndex).show();
		$('#beforeUpdate'+vIndex).hide();
	}
	
	function updateDept(vIndex){
		var vdeptno  = $("#deptnoInput"+vIndex).val();
		var vdname 	 = $("#dnameInput"+vIndex).val();
		var vupDeptno= $('#upDeptno'+vIndex).val();
	
		console.log("vdeptno--> " + vdeptno);
		
		$.ajax({
			url 	: "/deptUpdate",
			data	: {deptno : vdeptno , dname : vdname , upDeptno : vupDeptno},
			dataType: 'text',
			success : function(data){
				$('#deptnoSpan'+vIndex).text(vdeptno);
				$('#dnameSpan'+vIndex).text(vdname);
			},
		});
		$('#deptnoInput'+vIndex).hide();
		$('#dnameInput'+vIndex).hide();
		$('#afterUpdate'+vIndex).hide();
		$('#beforeUpdate'+vIndex).show();
	} */
	
	
		/* $(document).ready(function(){
			$('#insert').on('click',function(){
				$.ajax({
					url : ""
				})
			})
		}) */
	</script>
<style>
	table { 
		border-collapse: collapse; width: 100%;
	}
	th, td { 
	background: #fff; }
	
	
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
					<i class="bi bi-bookmark-fill me-2"></i>학사관리 &gt; 강의정보 &gt; 강의개설</div>
				<!----- card content 내용 ------>
				<div class="col-12 rounded-bottom overflow-auto bg-white p-5" style="min-height: 550px;">
					<h2>강의개설</h2>
					<hr>
					<div class="mt-4  " >
						<div class="fw-bold item-start" style="display: inline; float: left;">개설강좌 목록</div>
						<div class="font08" style="display: inline; float: right;">
							<span >총건수 <b>1</b>건 &nbsp;&#183; &nbsp;현재페이지 <b>1</b> 페이지</span>
						</div>
					</div>
					<br>
					<div class="mt-4" style="display: inline;">
						<div class="mt-4 form-group col-md-5 px-0 text-left" style="display:inline; float:left;">
							<label  class="me-2 pe-0 font09">년도/학기</label>
							<select class="form-select-sm" name="year" style="width: 13%; ">
								<option selected value="">선택 </option>
								<option value="2022">2022 </option>
								<option value="2021">2021</option>
								<option value="2020">2020</option>
								<option value="2019">2019</option>
								<option value="2018">2018</option>
								<option value="2017">2017</option>
								<option value="2016">2016</option>
								<option value="2015">2015</option>
								<option value="2014">2014</option>
								<option value="2014">2013</option>
								<option value="2012">2012</option>
							</select><span class="font09 ms-1">년</span>
							<select class="ms-2 form-select-sm" style="width: 12%" name="semester">
								<option class=""selected>선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
							</select><span class="font09 ms-1">학기</span>
							
							<div class="form-check pe-0" style="display: inline;">
								<input type="checkbox" name="typeCode" value="M"  id="exampleCheck1" >
								<label class="form-check-label font09">전필</label>
							</div>
							<div class="form-check  pe-0" style="display: inline;">
								<input type="checkbox" name="typeCode" value="S"  id="exampleCheck2">
								<label class="form-check-label font09">전선</label>
							</div>
							<div class="form-check" style="display: inline;">
								<input type="checkbox" name="typeCode" value="C" id="exampleCheck3" >
								<label class="form-check-label font09" >교양</label>
							</div>
						</div>
	
					<div class="mt-4 row col-md-7" style="float:left; display: inline;">
						<div class="input-group px-0 " style="width: 40%;">
							<label class="form-label me-2 mb-0 align-self-center font09">강의명</label>
							<input class="form-control form-sm rounded-1" type="text" name="name"
									aria-describedby="button-search" style="height: 31px;">
	
							<button class="btn btn-secondary btn-sm" id="button-search" type="button"
									onclick="lecSearch()">검색</button>
						</div>
					</div>
	
					
	
	<br>
				<div class="mt-4 mb-2 form-group mx-0 font09" style="display: inline;">
					
						<!-- <p class="fw-bold ">개설강좌 목록</p> -->
					
				
					<div class="mx-0 px-0 text-end">
						<button type="button" style="width: 10%; display: inline;" class="btn btn-primary btn-sm me-1"
								onclick="newLec()">신규</button>
						<button type="submit" style="width: 10%; display: inline;" class="btn btn-dark btn-sm me-1"
								form="lecSave">저장</button>
						<button type="button" style="width: 10%; display: inline;" class="btn btn-danger btn-sm"
						        onclick="lecDelete()">삭제&nbsp;</button>
					</div>
				</div>
	
				<br>
				<div >
 				<div class="tableFixHead font08 mx-0" style="width:100%; border-collapse: collapse; border: solid 1px #bdbdbd;" >
				<table class="table table-bordered table-hover table-sm mt-2 " style="align:center;" id="lecTable">
					<thead class="table-secondary">
						<tr style="text-align: center;">
							<th scope="col" style="vertical-align: middle; width: 4%;">순번</th>
							<th scope="col" style="vertical-align: middle; width: 10%;">강의번호</th>
							<th scope="col" style="vertical-align: middle; width: 10%;">교수명</th>
							<th scope="col" style="vertical-align: middle;">강의명</th>
							<th scope="col" style="vertical-align: middle; width: 7%;">개설년도</th>
							<th scope="col" style="vertical-align: middle; width: 7%;">학기</th>
							<th scope="col" style="vertical-align: middle; width: 15%;">전공</th>
							<th scope="col" style="vertical-align: middle; width: 7%;" >이수구분</th>
							<th scope="col" style="vertical-align: middle; width: 7%;">학점</th>
							<th scope="col" style="vertical-align: middle; width: 7%;">승인여부</th>
						</tr>
					</thead>
	
					
					<tbody >
					<c:forEach var="lec" items="${lecList}">
						<c:set var="i" value="${i+1}"></c:set>
						<tr onclick="lecUpdate(${lec.id})">
							<th class="text-center">${i }</th>
							<td class="text-center">${lec.typeCode}${lec.id}</td>
							<td class="text-center">${lec.prof}</td>
							<td class="text-center">${lec.name}</td>
							<td class="text-center">${lec.year}</td>
							<td class="text-center">${lec.semester}</td>
							<td class="text-center">${lec.major}</td>
							<td class="text-center">${lec.type}</td>
							<td class="text-center">${lec.unitScore}</td>
							<c:choose>
							<c:when test="${lec.status == null || ''}">
								<td class="text-center text-danger fw-bold">미승인</td>
							</c:when>
							<c:otherwise>
								<td class="text-center text-primary fw-bold">승인</td>
							</c:otherwise>
							</c:choose>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</div>
				</div>
				<br>
				<div class="mt-2 fw-bold ">개설강좌 상세정보</div>
				<br>
				<form id="lecSave" action="/professor/lecSave" method="post">
				
				<input type="hidden" id="lecId" name="id">
				
				<table class="table font09 text-center">
					<tr>
						<th class="table-secondary text-center " scope="col" style="width: 9%; vertical-align:middle;">년도</th>
						<td class="p-2" style="width:16%;">
							<input class="form-control text-center mx-0 form-inline form-control-sm " type="text" placeholder="개설년도" 
									id="lecYear" name="year" >
						</td>
						<th class="table-secondary me-0" scope="col" style="vertical-align:middle; width: 9%;">학기</th>
						<td>
							<select id="lecSemester" name="semester" class="form-select form-select-sm me-0" >
								<option value="1" selected>1</option>
								<option value="2">2</option>
							</select>
						</td>
						<th class="table-secondary" scope="col" style="width: 9%; vertical-align:middle;">총시수</th>
						<td>
							<select id="lecMaxCount" name="maxCount" class="form-select form-select-sm me-0" style="margin: 0;">
								<option value="14">14</option>
								<option selected value="15">15</option>
							</select>
						</td>
						<th class="table-secondary" scope="col" style="width: 9%; vertical-align:middle;">학점</th>
						<td>
							<select id="lecUnitScore" name="unitScore" class="form-select form-select-sm me-0 " style="margin: 0;">
							<!-- <option selected value="1">1 학점</option> -->
							<option selected value="2">2 힉점</option>
							<option value="3">3 학점</option>
						</select>
						</td>
					</tr>
					
					
					<tr>
						<th class="table-secondary text-center" scope="col" style="width: 9%; vertical-align:middle;">이수구분</th>
						<td class="p-2">
							<select id="lecTypeCode" name="typeCode" class="form-select form-select-sm me-0 " style="margin-left: 0;">
								<option value="" selected>선택</option>
								<option value="M">전필</option>
								<option value="S">전선</option>
								<option value="C">교양</option>
							</select>
						</td>
						<th class="table-secondary me-0" scope="col" style="vertical-align:middle; width: 9%;">전공</th>
						<td>
							<select id="lecMajor" name="major" class="form-select form-select-sm " style="margin: 0;">
								<option value="공통" selected>공통</option>
								<option value="컴퓨터공학과">컴퓨터공학과</option>
								<option value="AI학과">AI학과</option>
								<option value="경영학과">경영학과</option>
						</select>
						</td>
						<th class="table-secondary" scope="col" style="width: 9%; vertical-align:middle;">대상학년</th>
						<td  style="width:16%;">
							<select id="lecGrade" name="grade" class="form-select form-select-sm me-0 " style="margin: 0;">
								<option selected value="1">1 학년</option>
								<option value="2">2 학년</option>
								<option value="3">3 학년</option>
								<option value="4">4 학년</option>
							</select>
						</td>
						<th class="table-secondary" scope="col" style="width: 9%; vertical-align:middle;">수강인원</th>
						<td>
							<input id="lecMaxStud" name="maxStud" class="form-control form-control-sm text-start" type="text" >
						</td>
					</tr>

					
					<tr>
						<th class="table-secondary text-center" scope="col" style="width: 9%; vertical-align:middle;">강의명</th>
						<td colspan="3" class="p-2" style="width:16%;">
							<input id="lecName" name="name" class="form-control form-control-sm text-start " 
								type="text" placeholder="강의명을 입력해주세요" >
						</td>
						<th class="table-secondary me-0" scope="col" style="vertical-align:middle;">건물명</th>
						<td>
							<select id="lecBuilding" name="building" class="form-select form-select-sm me-0 " style=" margin-right: 0;">
								<option selected value="중앙동 ">중앙동</option>
								<option value="정보동">정보동</option>
								<option value="종합강의동">종합강의동</option>
							</select>
						</td>
						<th class="table-secondary" scope="col" style="width: 9%; vertical-align:middle;">호수</th>
						<td>
							<select id="lecRoom" name="room" class="form-select form-select-sm me-0 " style="margin: 0;">
								<option selected value="101호 ">101호</option>
								<option value="102호">102호</option>
								<option value="103호">103호</option>
								<option value="201호">201호</option>
								<option value="202호">202호</option>
								<option value="203호">203호</option>
							</select>
						</td>
					</tr>
					</table>
					
					
					<table class="table font09 text-center">
						<tr>
						<th class="table-secondary text-center" scope="col" style="width: 9%; vertical-align:middle;">강의일1</th>
						<td class="p-2">
							<select id="lecDay1" name="day1" class="form-select form-select-sm me-0 " 
									style="margin: 0;">
								<option value="" selected>선택</option>
								<option value="월">월요일</option>
								<option value="화">화요일</option>
								<option value="수">수요일</option>
								<option value="목">목요일</option>
								<option value="금">금요일</option>
						</select>
						</td>
						<th class="table-secondary me-0" scope="col" style="vertical-align:middle;width: 9%;">강의시간1</th>
						<td style="width: 18%; margin-right: 0;">
							<select id="lecTime1" name="time1" class=" form-select form-select-sm">
								<option selected value="">선택</option>
								<option value="1교시">1교시 (09:00-09:50)</option>
								<option value="2교시">2교시 (10:00-10:50)</option>
								<option value="3교시">3교시 (11:00-11:50)</option>
								<option value="4교시">4교시 (12:00-12:50)</option>
								<option value="5교시">5교시 (13:00-13:50)</option>
								<option value="6교시">6교시 (14:00-14:50)</option>
								<option value="7교시">7교시 (15:00-15:50)</option>
								<option value="8교시">8교시 (16:00-16:50)</option>
								<option value="9교시">9교시 (17:00-17:50)</option>
							</select>
						</td>
						<th class="table-secondary text-center" scope="col" style="width: 9%; vertical-align:middle;">강의일2</th>
						<td class="p-2">
							<select id="lecDay2" name="day2" class="form-select form-select-sm me-0 " 
									style="margin: 0;">
								<option value="" selected>선택</option>
								<option value="월">월요일</option>
								<option value="화">화요일</option>
								<option value="수">수요일</option>
								<option value="목">목요일</option>
								<option value="금">금요일</option>
							</select>
						</td>
						<th class="table-secondary me-0" scope="col" style="vertical-align:middle; width: 9%;">강의시간2</th>
						<td style="width: 18%; margin-right: 0;">
							<select id="lecTime2" name="time2" class=" form-select form-select-sm" >
								<option selected value="">선택</option>
								<option value="1교시">1교시 (09:00-09:50)</option>
								<option value="2교시">2교시 (10:00-10:50)</option>
								<option value="3교시">3교시 (11:00-11:50)</option>
								<option value="4교시">4교시 (12:00-12:50)</option>
								<option value="5교시">5교시 (13:00-13:50)</option>
								<option value="6교시">6교시 (14:00-14:50)</option>
								<option value="7교시">7교시 (15:00-15:50)</option>
								<option value="8교시">8교시 (16:00-16:50)</option>
								<option value="9교시">9교시 (17:00-17:50)</option>
							</select>
						</td>
					</tr>
				</table>
				</form>	
					
				<!-- 	<input id="lecName" name="name" class="form-control form-control-sm text-start " 
							type="text" placeholder="강의명을 입력해주세요" style="width:auto;">
				
				
				<div class="container font08">
				
					<div class="row row-cols-4 ps-0" style="float:left;">
						<div class="col form-inline text-start ps-0" style="display: inline; float:left;">
							년도/학기
							<input class="form-control ms-2 form-inline form-control-sm text-start font09" type="text" placeholder="년도" 
									id="lecYear" name="year" style= "margin:0 !important; width:40%;">
							<select id="lecSemester" name="semester" class="form-select ms-1 form-inline form-select-sm me-0 font09"  style="margin: 0 !important;  width:40%;">
								<option value="1" selected>1</option>
								<option value="2">2</option>
							</select>
							<input class="form-control form-control-sm" type="text" name="semester" placeholder="학기" style="width:20%;  disply:inline; margin-right:0;">
						</div>
						
						<div class="col " >
							<label class="col-form-label me-2">이수구분</label>
							<select id="lecTypeCode" name="typeCode" class="form-select form-select-sm me-0 font09" style="width: 40%; margin-left: 0;">
								<option value="" selected>선택</option>
								<option value="M">전필</option>
								<option value="S">전선</option>
								<option value="C">교양</option>
							</select>
						</div>
						
						<div class="col " style="display: inline">
							<label class="col-form-label me-2">전공</label>
							<select id="lecMajor" name="major" class="form-select form-select-sm font09" style="margin: 0;">
								<option value="공통" selected>공통</option>
								<option value="컴퓨터공학과">컴퓨터공학과</option>
								<option value="AI학과">AI학과</option>
								<option value="경영학과">경영학과</option>
							</select>
						</div>
						
						<div class="col" style="display:inline;">
							대상학년
							<select id="lecGrade" name="grade" class="form-select form-select-sm me-0 font09" style="width: 40%; margin: 0;">
								<option selected value="1">1 학년</option>
								<option value="2">2 학년</option>
								<option value="3">3 학년</option>
								<option value="4">4 학년</option>
							</select>
						</div>
						----------------------------------------------------------------------------
						
						<br>
						<div class="col text-start ps-0 " style="display: inline">
							<label class="col-form-label me-2 ">강의명</label>
							<input id="lecName" name="name" class="form-control form-control-sm text-start font09" type="text" placeholder="강의명을 입력해주세요" style="width:auto;">
						</div>
						
						<div class="col">
							<label class="col-form-label me-2">강의번호</label>
							<input class="form-control form-control-sm text-start font09" type="text" name="id"style="width:50%;" readonly>
							
						</div>
						
						<div class="col py-0 ">
							<label class="col-form-label me-2">강의시작일</label>
							<input type="date" name="register_start" class="form-control font09" >
							 <input type="text" name="register_start" id="datePicker" class="form-control font09" value="2023-03-02" />
							 <div class="input-group date">
								<input type="text" class="form-control">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-calendar"></i>
								</span>
							</div>
						</div>
						<div class="col">
							<label class="col-form-label me-2">총시수</label>
								<select id="lecMaxCount" name="maxCount" class="form-select form-select-sm me-0" style="width: 30%; margin: 0;">
									<option value="14">14</option>
									<option selected value="15">15</option>
								</select>
						</div>
						
					-----------------------------------------------------------------------
						<div class="col text-start ps-0" style="display: inline">
							<label class="col-form-label">학점</label>
							<select id="lecUnitScore" name="unitScore" class="form-select form-select-sm me-0 font09" style="width: 30%; margin: 0;">
								<option selected value="1">1 학점</option>
								<option selected value="2">2 힉점</option>
								<option value="3">3 학점</option>
							</select>
						</div>
						
						<div class="col" >
							<label class="col-form-label me-2">수강인원</label>
							<input id="lecMaxStud" name="maxStud" class="form-control form-control-sm text-start" type="text" style="width:20%;">
						</div>
					
						
						
						<div class="col" style="display:inline;">
							강의동
							<select id="lecBuilding" name="building" class="form-select form-select-sm me-0 font09" style="width: 40%; margin-right: 0;">
								<option selected value="중앙동 ">중앙동</option>
								<option value="정보동">정보동</option>
								<option value="종합강의동">종합강의동</option>
							</select>
						</div>
						<div class="col" style="display:inline;">
							강의실
							<select id="lecRoom" name="room" class="form-select form-select-sm me-0 font09" style="width: 40%; margin: 0;">
								<option selected value="101호 ">101호</option>
								<option value="102호">102호</option>
								<option value="103호">103호</option>
								<option value="201호">201호</option>
								<option value="202호">202호</option>
								<option value="203호">203호</option>
							</select>
						</div>
						
					-----------------------------------------------------------------------
					<div class="row font08" style="float:left;">
						<div class="col col-6 text-start ps-0" style="display: inline; ">
							<label class="col-form-label me-1">강의일 1</label>
							<select id="lecDay1" name="day1" class="form-select form-select-sm me-0 font09" 
										style="width: 25%; margin: 0; display: inline;">
									<option value="월" selected>월요일</option>
									<option value="화">화요일</option>
									<option value="수">수요일</option>
									<option value="목">목요일</option>
									<option value="금">금요일</option>
							</select>
							<select id="lecTime1" name="time1" class="font09 form-select form-select-smfont09" 
									style="width: 40%; margin: 0; display: inline;">
								<option selected value="1교시">1교시 (09:00-09:50)</option>
								<option value="2교시">2교시 (10:00-10:50)</option>
								<option value="3교시">3교시 (11:00-11:50)</option>
								<option value="4교시">4교시 (12:00-12:50)</option>
								<option value="5교시">5교시 (13:00-13:50)</option>
								<option value="6교시">6교시 (14:00-14:50)</option>
								<option value="7교시">7교시 (15:00-15:50)</option>
								<option value="8교시">8교시 (16:00-16:50)</option>
								<option value="9교시">9교시 (17:00-17:50)</option>
							</select>
						</div>
						<br>
						<div class="col col-6 " style="display: inline; ">
							<label class="col-form-label me-1 ">강의일 2</label>
							<select id="lecDay2" name="day2" class="form-select form-select-sm me-0 font09" 
									style="width: 25%; margin: 0; display: inline;">
									<option value="" selected>선택</option>
									<option value="월">월요일</option>
									<option value="화">화요일</option>
									<option value="수">수요일</option>
									<option value="목">목요일</option>
									<option value="금">금요일</option>
							</select>
							<select id="lecTime2" name="time2" class="font09 form-select form-select-smfont09"
									style="width: 40%; margin: 0; display: inline;">
								<option selected value="">시간</option>
								<option value="1교시">1교시 (09:00-09:50)</option>
								<option value="2교시">2교시 (10:00-10:50)</option>
								<option value="3교시">3교시 (11:00-11:50)</option>
								<option value="4교시">4교시 (12:00-12:50)</option>
								<option value="5교시">5교시 (13:00-13:50)</option>
								<option value="6교시">6교시 (14:00-14:50)</option>
								<option value="7교시">7교시 (15:00-15:50)</option>
								<option value="8교시">8교시 (16:00-16:50)</option>
								<option value="9교시">9교시 (17:00-17:50)</option>
							</select>
						</div>
						
					</div> -->
					
					
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