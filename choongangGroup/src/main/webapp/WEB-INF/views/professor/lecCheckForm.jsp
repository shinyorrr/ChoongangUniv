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
	<link rel="stylesheet" href="/css/stylesLec.css">
	<link rel="stylesheet" href="/css/styles.css">
	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="/js/main.js"></script>

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">

	
	</script>
</head>

<body class="" id="body-pd">
	<nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
			<a href="/" class="navbar-brand">
				<img class="img-fluid" src="/images/logo2.png" alt="logo2" style="height: 40px;"><use xlink:href="#bootstrap"></use></svg>
			</a>

			<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
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
	<div class="container-fluid w-100" style=" background-color: rgb(214, 225, 237);">
		<div class="row">

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
						<i class="bi bi-bookmark-fill me-2"></i>강의관리 &gt; 전자출석부</div>
					<!----- card content 내용 ------>
						<div class="col-12 rounded-bottom overflow-auto bg-white p-5" style="min-height: 550px;">
							
							<h2>전자출석부</h2><hr>
							<br>
							
							<div class="mt-1 mb-4 py-4 px-3" style="border-collapse: collapse; border: 1px solid #BDBDBD;">
								<div class="mb-2">
									<div style="font-size: 1.4em; display: inline-block;">(${lecture.typeCode}${lecture.id}) <b>${lecture.name}</b> _ ${lecture.grade}학년</div>
									<button style="display: inline-block; float: right;" type="button" class="btn btn-primary btn-sm"
											onclick="location.href='lecMgMain?userid=${userid}'" >&nbsp; 강의 목록보기  &nbsp;</button>
									<button style="display: inline-block; float: right;" type="button" class="btn btn-dark btn-sm"
											onclick="location.href='lecAttendExcel?excelDownload=true&id=${lecture.id}'" >&nbsp; 엑셀 다운로드  &nbsp;</button>
								</div>
								
								<%-- ${ param.id != null ? param.id : 'NULL' } --%>
								<div class="font09 text-start" style="display:inline;">${lecture.day1}요일 &nbsp;${lecture.time1}
								<c:choose>
									<c:when test="${lecture.day2 == null || lecture.day2 == ''}">
										 - ${lecture.time1 + (lecture.hour1 -1)}교시
									</c:when>  
									<c:otherwise >
										<c:if test="${lecture.hour1 > 1}"> - ${lecture.time1 + (lecture.hour1 -1)}</c:if>교시&nbsp;/ 
										${lecture.day2}요일 ${lecture.time2}
										<c:if test="${lecture.hour2 > 1}"> - ${lecture.time2 + (lecture.hour2 - 1)}</c:if> 교시
									</c:otherwise>
								</c:choose>
								&nbsp;&nbsp;&#183;&nbsp;&nbsp; ${lecture.building} ${lecture.room} &nbsp;&nbsp;&#183;&nbsp;&nbsp;강의학생 : <b>${lecture.studCount}</b>명</div>
							</div>
	
							<table class="table table-bordered table-sm font09" >
								<thead class="table-secondary">
									<tr style="text-align: center;">
										<th scope="col" style="vertical-align: middle; width: 3%;">No</th>
										<th scope="col" style="vertical-align: middle; width: 6%;"></th>
										<th scope="col" style="vertical-align: middle; width: 20%;">학생정보</th>
										<th scope="col" style="vertical-align: middle; width: 3%;">No</th>
										<th scope="col" style="vertical-align: middle; width: 6%;"></th>
										<th scope="col" style="vertical-align: middle; width: 20%;">학생정보</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="mem" items="${memList}">
									<c:set var="i" value="${i+1}"></c:set>
									<c:if test="${i%2 == 1}">
											<tr>
									</c:if>
												<td  style="text-align: center; vertical-align: middle;" >${i}</td>
												<td  class="d-flex py-2">
													<div class="m-1 mx-2 bg-secondary align-self-center" style=" height:70px; width: 78%;"></div>
												</td>
												<td class="p-3 mb-0">
													<div class=" px-2" style="font-size:1em; "><b >${mem.name}</b>  
														<p class="font09 mb-0" style="margin-top:3px;">${mem.userid}</p>
														<p class="font09 mt-0 mb-0">${mem.major} <span class="fontColorGr1 mb-0"> &nbsp;&#183; &nbsp; ${mem.grade}학년</span></p>
													</div>
												</td>

									<c:if test="${i%2 == 0}">
											</tr>
									</c:if>
									</c:forEach>
							</table>
						</div>
					
					<!-- footer -->
					<footer class="col-12" style="height: 60px; font-size: 12px;">
						@2022 ChoongAng University. All Rights Reserved.
					</footer>    
				</div>
			</main>
		</div>
	</div>

</body>
</html>