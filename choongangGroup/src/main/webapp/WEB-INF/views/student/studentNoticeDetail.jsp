<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="/css/styles.css">
    <title>SideBar sub menus</title>
<!-- Ajax  -->
</head>

<body class="" id="body-pd" onload="printClock()">
    <!-- header -->
    <!-- <nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
        <a class="navbar-brand">
            <button class="btn ms-2" type="button">
                <img class="img-fluid" src="/images/logo2.png" alt="logo2" style="height: 40px;">
            </button>
        </a>
    </nav> -->
    <nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
          <a href="/" class="navbar-brand">
            <img class="img-fluid" src="/images/logo2.png" alt="logo2" style="height: 40px;"><use xlink:href="#bootstrap"></use></svg>
          </a>
    
        </header>
    </nav>
    <!-- /header -->
    <!-- side nav bar -->
    <div class="l-navbar" id="navbar">
        <nav class="navv">
			<div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                   <!--  <a href="#" class="nav__logo">카테고리</a> -->
                </div>
                <div class="nav__list">
                	<div href="#" class="nav__link collapses">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">학사관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu" style="width: 200px;">
                            <li><a href="/student/listEmp" class="collapse__sublink">학적정보 조회</a></li>
                            <li><a href="/professor/lecMgMain?userid=${userid}" class="collapse__sublink">강의목록 조회</a></li>
                            
                            <li><a href="#" class="collapse__sublink">시간표 조회</a></li>
                            <li><a href="/professor/lecCreateList" class="collapse__sublink">과제 업로드</a></li>

                        </ul>
                    </div>
                    

					<a href="/student/gradeList" class="nav__link">
	                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
	                    <span class="nav_name">성적 관리</span>
	                </a>
		

					<a href="/student/evaluationList" class="nav__link">
	                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
	                    <span class="nav_name">강의 평가</span>
	                </a>


					<a href="/student/applyIndex" class="nav__link">
	                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
	                    <span class="nav_name">수강 신청</span>
	                </a>
                    <div href="/student/shopList" class="nav__link collapses">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">교재 구매</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu" style="width: 200px;">
                            <li><a href="/student/shopList" class="collapse__sublink">교재 목록</a></li>
                            <li><a href="/student/cartList" class="collapse__sublink">장바구니</a></li>
                            <li><a href="/student/orderList" class="collapse__sublink">주문 목록</a></li>
                        </ul>
                    </div>
                </div>
                <a href="/logout" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">Log out</span>
                </a>
            </div>
		</nav>
    </div>
    <!-- /side nav bar -->
    <!-- main content -->
    <div class="container-fluid w-100" style=" background-color: rgb(214, 225, 237)">
        <div class="row">
            
            
            <!-- content header -->
            <div class="col-12 px-5 py-4" style=" background-color: rgb(95, 142, 241)">
				<div class="d-flex flex-row mb-2 mt-2">
					<div>
						<span class="text-white h4">안녕하세요. <span class="fw-bold">${name}</span>님!</span>
					</div>
					<div class="border border-1 border-white rounded-pill text-white ms-2"  style="height: 25px;">
						<div class="font09 align-items-center">&nbsp; 학생  &nbsp;</div>
					</div>
					<div><i class="text-white bi-gear-fill mx-2">  </i></div>
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
                    <!-- card header -->
                    <div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;"> 
                        <i class="bi bi-bookmark-fill me-2"></i>공지사항 관리 <i class="bi bi-chevron-right"></i> <a style="text-decoration: none; color: white;"  href="/notice/noticeList">공지사항</a> <i class="bi bi-chevron-right"></i> 상세내용
                    </div>
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
		                	<div class="container">
		                      	<div class="mb-3">                  		
			                      	<input id="noticeNum" type="hidden" value="${notice.noticeNum}">
			                      	<input id="noticeHit" type="hidden" value="${notice.noticeHit}">    
			                   </div>                 	
		                       <div class="mb-3">
		                     		<label class="form-label">제목</label>
		                     		<input id="noticeTitle1" name="noticeTitle" type="text" class="form-control" value="${notice.noticeTitle}" readonly>
		                     	</div>
		                     	<div>
		                     		<label class="form-label">내용</label>
		                     		<textarea id="noticeContent1" name="noticeContent" class="form-control" rows="3" style="height: 300px;" readonly="readonly" >${notice.noticeContent}</textarea>           	
		                      	</div>
		                  	 </div>
                  	</div>

                    <!-- footer -->
                    <footer class="col-12" style="height: 60px;">
                        @2022 ChoongAng University. All Rights Reserved.
                    </footer>    
                </div>
            </main>
        </div>
    </div>
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="/js/main.js"></script>
</body>
</html>