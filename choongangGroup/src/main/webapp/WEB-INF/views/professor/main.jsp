<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bottSTrap CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">		
<!-- bootStrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- CSS -->
<link rel="stylesheet" href="/css/styles2.css">
<link rel="stylesheet" href="/css/stylesLec.css">

	<title>Professor Main</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	if($("#mainCheck").val() != "1") {
		 location.href="/professor/professorMain";  
	}
	
});

</script>
<body id="body-pd">
	<!-- header -->
	<nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
			<a href="/professor/main" class="navbar-brand  ms-3">
				<img class="img-fluid" src="/images/logo2.png" alt="logo2" style="height: 40px;"></svg>
			</a>

			<!-- <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">About</a></li>
			</ul> -->
		</header>
	</nav>
	<input type="hidden" id="mainCheck" value="${mainCheck}">
	<!-- /header -->
	
	<!-- side nav bar -->
	<%-- <div class="l-navbar" id="navbar">
		<nav class="navv">
<<<<<<< HEAD
			<div class="nav__brand">
				<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
				<a href="#" class="nav__logo"></a>
			</div>
			<a href="/professor/calenderForm" class="nav__link active">
				<i class="bi bi-calendar-plus nav__icon" ></i>
				<span class="nav_name">캘린더</span>
			</a>
			<a href="/logout" class="nav__link">
				<ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">Log out</span>
			</a>
			

			<div href="#" class="nav__link collapses ">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">학사관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

				<ul class="collapse__menu  " style="width: 180px;">
					<a href="#" class="collapse__sublink mt-2 mb-2" style="font-size: 0.875rem;">강의시간표</a>
					<a href="/professor/lecMgMain?userid=${userid}" class="collapse__sublink mb-1 ms-0" style="font-size: 0.875rem;">강의관리</a>
					<a href="#" class="collapse__sublink ms-3" style="font-size: 0.8rem;">전자출석부</a>
					<a href="#" class="collapse__sublink ms-3 mb-2"  style="font-size: 0.8rem;">과제관리</a>
					
					<a href="#" class="collapse__sublink mb-2" style="font-size: 0.875rem;">강의계획서</a>
					<a href="/professor/lecCreateList" class="collapse__sublink mb-2" style="font-size: 0.875rem;">강의개설</a>
					<!-- <a href="#" class="collapse__sublink mb-1" style="font-size: 0.875rem;">강의정보</a>
					<a href="#" class="collapse__sublink ms-3"  style="font-size: 0.8rem;">강의계획서</a>
					<a href="#" class="collapse__sublink ms-3 mb-2"  style="font-size: 0.8rem;">강의개설</a> -->
					<a href="/professor/lecScore" class="collapse__sublink mb-2" style="font-size: 0.875rem;">성적관리</a>
					<a href="#" class="collapse__sublink mb-2" style="font-size: 0.875rem;">휴&#183;보강 신청</a>
					<a href="#" class="collapse__sublink mb-2" style="font-size: 0.875rem;">내선번호관리</a>
				</ul>
			</div>

			<div class="nav__list">
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
					<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">결재</span>
				</a>
				<!-- <a href="#" class="nav__link">
					<ion-icon name="people-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">내선번호관리</span>
=======
			<div>
				<div class="nav__brand">
					<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="#" class="nav__logo"></a>
				</div>
				<!-- <a href="/professor/calenderForm" class="nav__link active">
					<i class="bi bi-calendar-plus nav__icon" ></i>
					<span class="nav_name">캘린더</span>
>>>>>>> refs/heads/youna
				</a> -->
				
				<div class="nav__list">
					<a href="/notice/noticeList" class="nav__link">
						<ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
						<span class="nav_name">공지사항</span>
					</a>
		
					<div href="#" class="nav__link collapses ">
						<i class="bi bi-mortarboard-fill nav__icon"></i>
						<span class="nav_name mt-1">학사관리</span>
						<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
						<ul class="collapse__menu" style="width: 180px;">
							<a href="#" class="collapse__sublink mt-2 mb-3" style="font-size: 0.85rem; display: block;">강의시간표</a>
							<a href="/professor/lecMgMain?userid=${userid}" class="collapse__sublink mb-1" style="display: block;font-size: 0.85rem;">강의관리</a>
							<a  class="collapse__sublink ms-3" style="font-size: 0.8rem; display: block;">전자출석부</a>
							<a href="#" class="collapse__sublink ms-3 mb-3"  style="font-size: 0.8rem; display: block;">과제관리</a>
							
							<a href="#" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">강의계획서</a>
							<a href="/professor/lecCreateList" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">강의개설</a>
							<!-- <a href="#" class="collapse__sublink mb-1	" style="font-size: 0.875rem;">강의정보</a>
							<a href="#" class="collapse__sublink ms-3"  style="font-size: 0.8rem;">강의계획서</a>
							<a href="#" class="collapse__sublink ms-3 mb-2"  style="font-size: 0.8rem;">강의개설</a> -->
							<a href="/professor/lecScore" class="collapse__sublink mb-3" style="font-size: 0.875rem; display: block;">성적관리</a>
							<a href="#" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">휴&#183;보강 신청</a>
							<a href="#" class="collapse__sublink" style="font-size: 0.85rem; display: block;">내선번호관리</a>
						</ul>
					</div>
	
					<a href="#" class="nav__link">
						<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_name">결재</span>
					</a>
					<a href="#" class="nav__link">
						<ion-icon name="settings-outline" class="nav__icon"></ion-icon>
						<span class="nav_name">개인정보관리</span>
					</a>
				</div>
				<a href="/logout" class="nav__link">
					<ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">Log out</span>
				</a>
			</div>
		</nav>
<<<<<<< HEAD
	</div> --%>
	
	<!-- side nav bar -->
    <div class="l-navbar" id="navbar">
        <nav class="navv">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href="#" class="nav__logo">Bedimcode</a>
                </div>
                <div class="nav__list">
                	<div href="#" class="nav__link collapses">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">학사관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu" style="width: 200px;">
                            <li><a href="#" class="collapse__sublink">강의시간표</a></li>
                            <li><a href="/professor/lecMgMain?userid=${userid}" class="collapse__sublink">강의관리</a></li>
                            <li><a href="#" class="collapse__sublink ms-3">전자출석부</a></li>
                            <li><a href="/professor/reportList" class="collapse__sublink ms-3">과제관리</a></li>
                            <li><a href="#" class="collapse__sublink">강의계획서</a></li>
                            <li><a href="/professor/lecCreateList" class="collapse__sublink">강의개설</a></li>
                            <li><a href="/professor/lecScore" class="collapse__sublink">성적관리</a></li>
                            <li><a href="/professor/makeupPage" class="collapse__sublink">휴&#183;보강 신청</a></li>
                            <li><a href="#" class="collapse__sublink">내선번호관리</a></li>
                        </ul>
                    </div>
                    <a href="#" class="nav__link active">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="/message/messageList" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">쪽지함</span>
                    </a>

                    
					
                    <a href="/notice/noticeList" class="nav__link">
                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">공지사항</span>
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
                <a href="/logout" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">Log out</span>
                </a>
            </div>
        </nav>
    </div>
    <!-- /side nav bar -->

=======
	</div>
	<!-- /side nav bar -->
	
	
>>>>>>> refs/heads/youna
	<!-- main content -->
	<div class="container-fluid w-100" style=" background-color: rgb(214, 225, 237)">
		<div class="row">
		
			<!-- content header -->
			<div class="col-12 px-5 py-4" style=" background-color: rgb(95, 142, 241)">
				<div class="d-flex flex-row mb-2 mt-2">
					<div>
						<span class="text-white h4">안녕하세요. <span class="fw-bold">${username}</span>님!</span>
					</div>
					<div class="border border-1 border-white rounded-pill text-white ms-2"  style="height: 25px;">
						<div class="font09 align-items-center">&nbsp; 교수  &nbsp;</div>
					</div>
					<div><i class="text-white bi-gear-fill mx-2"></i></div>
				</div>
				<div class="row">
					<div>
						<span class="text-white font09">${major} | ${position} </span>
					</div>
				</div>
				<div class="d-flex flex-low mb-2">
					<div><i class="bi bi-envelope-fill text-white"></i></div>
					<div><span class="text-white ms-2 font09">${email}</span></div>
				</div>
			</div>

			<main class="col-9 h-100 w-100">
				<div class="row m-5">
				
					<!-- card content -->  
					<div class="row mb-2 pe-0 ps-2" >
						<div class="col-md-5 me-3 rounded overflow-auto bg-light p-4" style="min-height: 400px;"> 
							<h5 style="display: inline;">강의목록</h5><p class="font08" style="display: inline; float: right;">총 <b style="color: red; ">${lecCnt}</b>개의 수업이 있습니다</p><br>
							<hr>
							<input type="hidden" name="gubun" value="1">
							<c:forEach var="lec" items="${lecList}">
									<p class="mb-1" style="font-size: 1em;">(${lec.typeCode}${lec.id}) <b>${lec.name}</b> _${lec.grade}학년</p>
										<p class="mb-1 font08"  style="display: inline;">수강인원 : <b>${lec.studCount}</b>명</p>
										<div class="font08" style="display: inline; float: right;">
										<%-- 총 수업시간 : <b style="color: red">6</b>/${lec.maxCount}
											&nbsp; &#183; &nbsp; 휴강 : <b>${statusCnt1}</b> &nbsp; &#183; &nbsp; 보강 : <b>${statusCnt2}</b> --%>
											<button type="button" class="btn btn-secondary btn-sm  font08 ms-5"  style="display: inline; "
													onclick="location.href='lecAttendanceCheck?id=${lec.id}'">&nbsp; 전자출석부  &nbsp;</button>
											<button type="button" class="btn btn-primary btn-sm font08"	  style="display: inline;"
													onclick="location.href='reportList?id=${lec.id}'">&nbsp; 과제조회  &nbsp;</button>
										</div>
										<hr class="my-3">	
										<!-- <button type="button" class="btn btn-secondary btn-sm">강의평가조회</button> -->
										<!-- <hr> -->
									
									<%--  <c:if  test ="${lec.status eq null ||lec.status eq ''}">
										<div>style="font-size: 1.4em; font: #BDBDBD;">개설된 강의가 없습니다.</div>
									</c:if> --%>
							</c:forEach>
							
							
					<%-- 	<c:forEach var="lec" items="${lecList}">
							<c:if test ="${lec.status eq '0'}">
								<p style="font-size: 1.4em;">(${lec.typeCode}${lec.id}) <b>${lec.name}</b> _${lec.grade}학년</p>
									<p class="mb-1 font09">수강인원 : <b>${lec.studCount}</b>명</p>
									<div class="font09">총 수업시간 : <b style="color: red">6</b>/${lec.maxCount}
										&nbsp; &#183; &nbsp; 휴강 : <b>${statusCnt1}</b> &nbsp; &#183; &nbsp; 보강 : <b>${statusCnt2}</b>
										<button type="button" class="btn btn-danger btn-sm ms-5 font09"
												onclick="location.href='lecAttendanceCheck?id=${lec.id}'">&nbsp; 출결관리  &nbsp;</button>
										<button type="button" class="btn btn-primary btn-sm font09"	
												onclick="location.href='reportList?id=${lec.id}'">&nbsp; 과제조회  &nbsp;</button>
									</div>
									<hr class="my-4">	
							</c:if>
								
						</c:forEach> --%>
						</div>
						<div class="col-md-3 me-3 rounded overflow-auto bg-light p-4" style="min-height: 400px;"> 
							<h5>공지사항</h5><hr>

						</div>
						<div class="col-md-3  rounded overflow-auto bg-light p-4" style="max-height: 300px;"> 
							<!-- <h5>캘린더</h5><hr> -->
							<button type="button" style="width: 30%;" class="btn btn-primary btn-sm me-1" 
									onclick="location.href='/professor/lecMgMain?userid=${userid}'">강의관리</button>
							<button type="button" style="width: 30%;" class="btn btn-primary btn-sm me-1" 
									onclick="location.href='/professor/lecScore'">성적관리</button>

							<button type="button" style="width: 30%;" class="btn btn-primary btn-sm me-1" 
									onclick="location.href='/professor/lecCreateList'">강의개설</button>

							<%-- <button type="button" style="width: 30%;" class="btn btn-warning btn-sm my-2" 
									onclick="location.href='/professor/calenderForm?userid=${userid}'">캘린더</button> --%>

						</div>
					</div>
					
					<!-- footer -->
					<footer class="col-12 mt-5" style="height: 60px; font-size: 12px;">
						@2022 ChoongAng University. All Rights Reserved.
					</footer> 
				</div>
			</main>
		</div> 
	</div> <!-- container div end -->
	
	<!-- NavBar 관련 IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="/js/main.js"></script>
</body>
</html>