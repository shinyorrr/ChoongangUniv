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
		.font09 {
			font-size: 0.9em;
		}
		.font08 {
			font-size: 0.8em;
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
								style="font-size: 12px; height: 24px;">${position }</span>
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
					<i class="bi bi-bookmark-fill me-2"></i>교수서비스 &gt; 학사관리 &gt; 강의 시간표 조회
				</div>
				<!----- card content 내용 ------>
				<div class="col-12 rounded-bottom overflow-auto bg-white p-5" style="min-height: 550px;">
					<h2>강의개설</h2>
					<hr>
					<div class="mt-3">
						<div class="form-group col-md-3 px-0 text-left" style="display:inline; float:left;">
							<label  class="me-1 pe-0" style="font-size: 0.9rem;">년도/학기</label>
							<input class="form-control form-control-sm m-0" type="text" placeholder="년도" style="width: 45%; display: inline-block;">
							<select class="form-select-sm" style="height: 31px; width: 20%">
								<option style="font-size: 0.8rem;">학기</option>
								<option value="1">1</option>
								<option value="2">2</option>
							</select>
						</div>
	
					<div class="row col-md-5" style="float:left;">
	
						<div class="form-check col-md-2 mb-0 ms-3 pe-0 align-self-center " style="font-size: 0.9rem; " >
							<input type="checkbox" class="form-check-input" id="exampleCheck2" style="display: inline-block;">
							<label class="form-check-label " for="exampleCheck2">교양</label>
						</div>
						<div class="form-check col-md-2 mb-0 align-self-center" style="font-size: 0.9rem;" >
							<input type="checkbox" class="form-check-input" id="exampleCheck1" style="display: inline-block;">
							<label class="form-check-label" for="exampleCheck1">전공</label>
						</div>
	
	
						<div class="input-group ps-0 " style="width: 62%;">
							<label class="form-label ms-3 me-2 mb-0 align-self-center" style="font-size: 0.9rem; ">강의명</label>
							<input class="form-control form-sm rounded-1" type="text" aria-describedby="button-search" style="height: 31px;">
	
							<button class="btn btn-secondary btn-sm" id="button-search" type="button">검색</button>
						</div>
					</div>
	
	
	
					<div class="col-2 ms-3   col-md-4 themed-grid-col text-right px-0 text-end" style="float: right;">
						<button type="submit" style="width: 20%;" class="btn btn-primary btn-sm me-1"
								form="lecSave">신규</button>
						<button type="button" style="width: 20%;" class="btn btn-dark btn-sm me-1">저장</button>
						<button type="button" style="width: 20%;" class="btn btn-danger btn-sm">삭제&nbsp;</button>
					</div>
				</div>
	
				<br>
				<div class="mt-4 form-group" style="font-size: 0.9rem;">
					<div class="px-0 text-start " style="display: inline-block; float:left;">
						<p class="fw-bold ">개설강좌 목록</p>
					</div>
					<div style="display: inline; float: right;">
					<span >총건수 <b>1</b>건 &nbsp;&#183; &nbsp;현재페이지 <b>1</b> 페이지</span>
	<!--             페이지 넘버링
	                   <div class="dropdown text-end">-->
	<!--                <button class="btn btn-sm btn-light dropdown-toggle border-secondary  " type="button"-->
	<!--                        data-bs-toggle="dropdown" aria-expanded="false" style="height: 31px;">1-->
	<!--                </button>-->
	<!--                <ul class="dropdown-menu ">-->
	<!--                  <li><button class="dropdown-item" type="button">1</button></li>-->
	<!--                  <li><button class="dropdown-item" type="button">2</button></li>-->
	<!--                  <li><button class="dropdown-item" type="button">3</button></li>-->
	<!--                </ul>-->
	<!--              </div>-->
					</div>
				</div>
	
 				<div style="width:100%;height:140px;overflow-y:auto;overflow-x:hidden; border: solid 1px gray;">
				<table class="table table-bordered table-sm mt-2 " style="font-size: 0.8em;">
					<thead class="table-light">
						<tr style="text-align: center;">
							<th scope="col" style="vertical-align: middle; width: 4%;">순번</th>
							<th scope="col" style="vertical-align: middle; width: 15%;">강의번호</th>
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
	
					
					<tbody>
					<c:forEach var="lec" items="${lecList}">
						<c:set var="i" value="${i+1}"></c:set>
						<tr>
							<td class="text-center">${i }</td>
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
	
				<br>
				<div class="mt-2 fw-bold ">개설강좌 상세정보</div>
				<br>
	<!--          <table class="table table-bordered table-sm mt-2 " style="font-size: 0.8em; text-align: center;">-->
	<!--            <tr>-->
	<!------------------------------------------------------------------------------------->
				<form id="lecSave" action="/lecSave" method="post">
				<%-- <input type="hidden" name="prof" value="${name}"> --%>
				
				<div class="container font08">
				
					<div class="row row-cols-4 ps-0" style="float:left;">
						<div class="col form-inline text-start ps-0" style="display: inline; float:left;">
							년도/학기
							<input class="form-control ms-2 form-inline form-control-sm text-start font09" type="text" name="year" placeholder="년도" 
									style= "margin:0 !important; width:40%;">
							<select class="form-select ms-1 form-inline form-select-sm me-0 font09"  name="semester" style="margin: 0 !important;  width:40%;">
								<option value="1" selected>1</option>
								<option value="2">2</option>
							</select>
							<!-- <input class="form-control form-control-sm" type="text" name="semester" placeholder="학기" style="width:20%;  disply:inline; margin-right:0;"> -->
						</div>
						
						<div class="col " >
							<label class="col-form-label me-2">이수구분</label>
							<select class="form-select form-select-sm me-0 font09"  name="type" style="width: 40%; margin-left: 0;">
								<option selected>선택</option>
								<option value="전공">전필</option>
								<option value="전필">전선</option>
								<option value="교양">교양</option>
							</select>
						</div>
						
						<div class="col " style="display: inline">
							<label class="col-form-label me-2">전공</label>
							<!-- <input class="downBorder form-control form-control-sm" type="text" name="major" style="width:50%;"> -->
							<select class="form-select form-select-sm font09"  name="major" style="margin: 0;">
								<option selected>전공선택</option>
								<option value="컴퓨터공학과">컴퓨터공학과</option>
								<option value="소프트웨어과">소프트웨어과</option>
								<option value="전산과">전산과</option>
								<option value="경영학과">경영학과</option>
							</select>
						</div>
						
						<div class="col" style="display:inline;">
							대상학년
							<select class="form-select form-select-sm me-0 font09"  name="grade" style="width: 40%; margin: 0;">
								<option selected value="1">1 학년</option>
								<option value="2">2 학년</option>
								<option value="3">3 학년</option>
								<option value="4">4 학년</option>
							</select>
						</div>
						<!-------------------------------------------------------------------------------->
						
						<br>
						<div class="col text-start ps-0 " style="display: inline">
							<label class="col-form-label me-2 ">강의명</label>
							<input class="form-control form-control-sm text-start font09" type="text" name="name" placeholder="강의명을 입력해주세요" style="width:auto;">
						</div>
						
						<div class="col">
							<label class="col-form-label me-2">강의번호</label>
							<input class="form-control form-control-sm text-start font09" type="text" name="subjectGubun"style="width:50%;" readonly>
							
						</div>
						
						<div class="col py-0 ">
							<label class="col-form-label me-2">강의시작일</label>
							<input type="date" name="register_start" class="form-control font09" >
							 <!-- <input type="text" name="register_start" id="datePicker" class="form-control font09" value="2023-03-02" /> -->
							 <!-- <div class="input-group date">
								<input type="text" class="form-control">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-calendar"></i>
								</span>
							</div> -->
						</div>
						<div class="col">
							<label class="col-form-label me-2">총시수</label>
								<select class="form-select form-select-sm me-0"  name="maxCount" style="width: 30%; margin: 0;">
									<option selected value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
								</select>
						</div>
						
					<!--------------------------------------------------------------------------->
						<div class="col text-start ps-0" style="display: inline">
							<label class="col-form-label">학점</label>
							<select class="form-select form-select-sm me-0 font09"  name="unitScore" style="width: 30%; margin: 0;">
								<option selected value="1">1 학점</option>
								<option value="2">2 힉점</option>
								<option value="3">3 학점</option>
							</select>
						</div>
						
						
						
						<div class="col" >
							<label class="col-form-label me-2">수강인원</label>
							<input class="form-control form-control-sm text-start" type="text" name="studCount"style="width:20%;">
						</div>
					
						
						
						<div class="col" style="display:inline;">
							강의동
							<select class="form-select form-select-sm me-0 font09"  name="building" style="width: 40%; margin-right: 0;">
								<option selected value="중앙동 ">중앙동</option>
								<option value="정보동">정보동</option>
							</select>
						</div>
						<div class="col" style="display:inline;">
							강의실
							<select class="form-select form-select-sm me-0 font09"  name="room" style="width: 40%; margin: 0;">
								<option selected value="301호 ">301호</option>
								<option value="302호">302호</option>
							</select>
						</div>
						
					<!--------------------------------------------------------------------------->
					<!-- <div class="row font08" style="float:left;"> -->
						<div class="col col-6 text-start ps-0" style="display: inline; ">
							<label class="col-form-label me-1">강의일 1</label>
							<select class="form-select form-select-sm me-0 font09" name="day1"
										style="width: 25%; margin: 0; display: inline;">
									<option value="월" selected>월요일</option>
									<option value="화">화요일</option>
									<option value="수">수요일</option>
									<option value="목">목요일</option>
									<option value="금">금요일</option>
							</select>
							<select class="font09 form-select form-select-smfont09" name="time1"
									style="width: 40%; margin: 0; display: inline;">
								<option selected>시간</option>
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
						<!-- <br> -->
						<div class="col col-6 " style="display: inline; ">
							<label class="col-form-label me-1 ">강의일 2</label>
							<select class="form-select form-select-sm me-0 font09" name="day2"
										style="width: 25%; margin: 0; display: inline;">
									<option value="월" selected>월요일</option>
									<option value="화">화요일</option>
									<option value="수">수요일</option>
									<option value="목">목요일</option>
									<option value="금">금요일</option>
							</select>
							<select class="font09 form-select form-select-smfont09" name="time2"
									style="width: 40%; margin: 0; display: inline;">
								<option selected>시간</option>
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
						
					</div>
				</div>
				</form>
			</div>
		</main>
					
		<!-- footer -->
		<footer class="col-12" style="height: 60px; font-size: 12px;">
			@2022 ChoongAng University. All Rights Reserved.
		</footer>    
</div>

</body>
</html>