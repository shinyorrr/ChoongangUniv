<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/css/timetable.css">
<link rel="stylesheet" href="/css/styles.css">


    <title>SideBar sub menus</title>
</head>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">


	function submit(lecId, userid){
		$.ajax({
			url:"/student/like",
			data:{lecId : lecId , userid : userid},
			dataType:'text',
			success:function(data){
				const result = $.trim(data);

				if(result == 1){
				alert("성공")
				location.reload();
				}else if(result == 0){
					alert("중복된 강의입니다.")
				}else if(result == 2){
					alert("시간이 중복되었습니다.")
				}else{
					alert("최대학점을 초과했습니다 [신청가능 최대학점 : 21학점]")
				}
			}		
		});	
	}
	
	$(document).ready(function(){
	var color = '#';
	var letters = ['f6c9cc', 'a8c0c0', 'FEBF36', 'FF7238', '6475A0', 'acc7bf', '5e5f67', 'c37070', 'eae160', 'bf7aa3', 'd7d967'];
	color += letters[Math.floor(Math.random() * letters.length)]; 
	document.getElementById('wrap').style.background = color; 
	document.getElementById('wrap2').style.background = color; 
	});
	

    </script>



<body class="" id="body-pd">
  
    <nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
          <a href="/" class="navbar-brand">
            <img class="img-fluid" src="/images/logo2.png" alt="logo2" style="height: 40px;"><use xlink:href="#bootstrap"></use></svg>
          </a>
    
  
        </header>
    </nav>
    <!-- /header -->
   	<!----------------------- side nav bar ---------------------------------->
    <div class="l-navbar" id="navbar">
        <nav class="navv">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                 
                </div>
                <div class="nav__list">
                	<div href="#" class="nav__link collapses">
                        <i class="bi bi-person-rolodex"></i>
                        <span class="nav_name">학사관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu" style="width: 200px;">
                            <li><a href="/student/listEmp" class="collapse__sublink">학적정보 조회</a></li>
                            <li><a href="/student/lectureListForm" class="collapse__sublink">강의목록 조회</a></li>
                            
                            <li><a href="/student/timetable" class="collapse__sublink">시간표 조회</a></li>
                           

                        </ul>
                    </div>
                    

					<a href="/student/gradeList" class="nav__link">
	                    <i class="bi-mortarboard"></i>
	                    <span class="nav_name">&nbsp;성적 관리</span>
	                </a>
		

					<a href="/student/evaluationList" class="nav__link">
	                    <i class="bi-pencil"></i>
	                    <span class="nav_name">&nbsp;강의 평가</span>
	                </a>


					<a href="/student/applyIndex" class="nav__link">
	                    <i class="bi bi-box-arrow-up-right"></i>
	                    <span class="nav_name">&nbsp;수강 신청</span>
	                </a>
                    <div href="/student/shopList" class="nav__link collapses">
                        <i class="bi bi-book"></i>
                        <span class="nav_name">&nbsp;교재 구매</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu" style="width: 200px;">
                            <li><a href="/student/shopList" class="collapse__sublink">교재 목록</a></li>
                            <li><a href="/student/cartList" class="collapse__sublink">장바구니</a></li>
                            <li><a href="/student/orderList" class="collapse__sublink">주문 목록</a></li>
                        </ul>
                    </div>
                </div>
                <a href="/logout" class="nav__link">
                    <i class="bi-power"></i>
                    <span class="nav_name">&nbsp; Log out</span>
                </a>
            </div>
        </nav>
    </div>
    <!-- /side nav bar -->
<jsp:include page="header.jsp"></jsp:include>
	<!-- main content -->
	<div class="row">
		
	
    <div class="container-fluid w-100" style=" background-color: rgb(214, 225, 237)">
		
            <main class="col-9 h-100 w-100">
                <div class="row m-5">
                    <!-- card header -->
                    <div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;"> 
                        <i class="bi bi-bookmark-fill me-2"></i>학생서비스 <i class="bi bi-chevron-right"></i>수강신청 <i class="bi bi-chevron-right"></i>장바구니 신청
                    </div>
                    
                    <!------------------- 장바구니 신청 ------------------------------>  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                    	<div class="d-flex flex-row">                    		
                    	 	<div class="col-6 mx-2 ">
                    	 	<!-----------------장바구니 전체 ------------------------>
		                    <!--메인 제목-->
	                        <div class="mt-3 mb-3">                    
	                       	  <span class="fs-2 fw-bold">장바구니 </span>                         
	                        </div> 
	                       	
	                       	<!--  검색상단바 -->
	                                         	
	                       	<div class="fw-bold fs-6 " style="background-color:#EAEAEA; height: 45px;">
	                       		<span style="line-height: 45px; margin-left: 10px;">${year }학년도 ${semester }학기 개설강좌</span>
	                       		
	                    		<!-- 강의명으로 검색 -->
	                       		<form action="${pageContext.request.contextPath}/student/likeForm" method="get" class="row row-cols-lg-auto g-3 float-end me-5 fs-6 ">
		                       		  <span style="line-height: 45px;">강의명 :</span>
		                       		  
									  <div class="col-12">							    
									  	<div class="input-group">				     
									      <input type="text" name="lecName" class="form-control form-control-sm mt-2" placeholder="강의명으로 검색">
									    </div>
									  </div>
									  <!-- 강의목록 정렬 Select -->
									 <div class="col-12" >
									 	<div class="input-group mt-2 ">	
				                       		<input type="hidden" name="userid" value="${userid }">
				                       		<button type="button" class="btn btn-primary btn-sm fs-6" name="lecName" onclick="submit()">전체목록</button>
				                       						                    		
				                       	</div>
									</div>	
								</form>							
	                       	</div>
	
								<!-- 리스트 -->
								<table class="table table-striped">
									<thead>
										<th>강의코드</th><th>강의명</th><th>학년</th><th>강의시간</th><th>교수명</th>
										<th>이수구분</th><th>전공</th><th>학점</th><th>&nbsp;&nbsp;</th>
									</thead>
									<c:forEach var="lec" items="${lectureList.content }">
										<tr>
											<td>${lec.id }</td><td>${lec.name }</td><td>${lec.grade }</td>
											<td>${lec.day1}${lec.time1}<c:if test="${lec.hour1==2}">${lec.time1+1}</c:if>,
											    ${lec.day2}${lec.time2}<c:if test="${lec.hour2==2}">${lec.time2+1}</c:if></td><td>${lec.prof }</td>
											<td>${lec.type }</td>
											<td>${lec.major }</td><td>${lec.unitScore }</td>
											<td><input type="button" value="신청" onclick="submit('${lec.id}','${userid}')"></td>		
										</tr>	
									</c:forEach>	
								</table>
								
								
								<!------------------------------------- 페이징 영역 시작 ------------------------------------------>
								<div class="text-xs-center">
									<ul class="pagination justify-content-center">
									
										<!-- 이전 -->
										<c:choose>
											<c:when test="${lectureList.first}"></c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/student/likeForm/?userid=${userid }&lecName=">처음</a></li>
												<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/student/likeForm/?page=${lectureList.number-1}&userid=${userid }&lecName=">&larr;</a></li>
											</c:otherwise>
										</c:choose>
							
										<!-- 페이지 그룹 -->
										<c:forEach begin="${startBlockPage}" end="${endBlockPage}" var="i">
											<c:choose>
												<c:when test="${lectureList.pageable.pageNumber+1 == i}">
													<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/student/likeForm/?userid=${userid }&page=${i-1}&lecName=">${i}</a></li>
												</c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/student/likeForm/?userid=${userid }&page=${i-1}&lecName=">${i}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										
										<!-- 다음 -->
										<c:choose>
											<c:when test="${lectureList.last}"></c:when>
											<c:otherwise>
												<li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/student/likeForm/?page=${lectureList.number+1}&userid=${userid }&lecName=">&rarr;</a></li>
												<li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/student/likeForm/?page=${lectureList.totalPages-1}&userid=${userid }&lecName=">마지막</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
								<!-- 페이징 영역 끝 -->
							</div>
							
							<!-- 세로줄 -->
							<div class="d-flex mx-3" style="height: 750px;">
  							<div class="vr"></div>
							</div>
							
							
							<div class="col-5 ms-4"> <!-----------------장바구니  신청된 강의------------------------>
								<!-- 신청강의 목록 제목-->
		                        <div class="mt-3 mb-3">                    
		                       	  <span class="fs-2 fw-bold">장바구니 담긴 목록</span> 
		                        </div>
		                        
		                        <!-- 총 신청 학점 -->
		                        <div class="fw-bold fs-6 " style="background-color:#EAEAEA; height: 45px;">
	                       		<span style="line-height: 45px; margin-left: 10px;">총 신청학점 : &nbsp;<span style="color: red;">${unit }</span>학점</span>
		                        </div>
		                       
		                       
			<%-- 					<table class="table table-striped">
								<thead>
									<tr>
										<th>강의코드</th><th>강의명</th><th>학년</th><th>강의시간</th><th>교수명</th>
										<th>이수구분</th><th>전공</th><th>학점</th>
									</tr>
								</thead>
								
								
								<c:forEach var="list" items="${list }">
									<tr>
										<td>${list.lecture.id }</td><td>${list.lecture.name }</td><td>${list.lecture.grade }</td>
										<td>${list.lecture.day1}${list.lecture.time1}, ${list.lecture.day2}${list.lecture.time2}</td><td>${list.lecture.prof }</td><td>${list.lecture.type }</td>
										<td>${list.lecture.major }</td><td>${list.lecture.unitScore }</td>
												
									</tr>	
								</c:forEach>
								</table> --%>
							<!-- ffebf0 베핑    #FFF0F5     연두#F2F9E8 내픽#F2F8F8-->
								<!--------------------------------- 시간표 -------------------------------------->
							<div class="mt-1 timetable" >
								<table class="timetable" style="background-color: #F2F8F8 ; color: 	#003A9D" >								
												<thead >
												<tr >
													<th style="width: 6%; ">시간</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th>											
												</tr>
												</thead>									
												<tbody>			
													
									<c:forEach var="j" begin="1" end="7">	
										<tr>
											<td style="width: 6%">${j }교시</td>	
											
											<c:forEach var="d" items="${day }">
															
												<c:forEach var="lec" items="${list }" >	
													<c:if test="${lec.lecture.day1 eq d and lec.lecture.time1 le j and lec.lecture.time1+lec.lecture.hour1 gt j}">
														<c:set var="day1" value="${lec.lecture.day1 }"></c:set> 
														<c:set var="name1" value="${lec.lecture.name }"></c:set>
														<c:set var="time1" value="${lec.lecture.time1 }"></c:set>
														<c:set var="hour1" value="${lec.lecture.hour1 }"></c:set>
													</c:if>	
													
													
													
													<c:if test="${lec.lecture.day2 eq d and lec.lecture.time2 le j and lec.lecture.time2+lec.lecture.hour2 gt j}">
														<c:set var="day2" value="${lec.lecture.day2 }"></c:set> 
														<c:set var="name2" value="${lec.lecture.name }"></c:set>
														<c:set var="time2" value="${lec.lecture.time2 }"></c:set>
														<c:set var="hour2" value="${lec.lecture.hour2 }"></c:set>
													</c:if>															
												</c:forEach>
												
												<c:choose>
													<c:when test="${day1 eq d and time1+hour1 gt j}"> 
													 	<td style="background-color: #6799FF; color: white;">${name1 }</td>
													</c:when>
													<c:when test="${day2 eq d and time2+hour2 gt j}"> 
													 	<td style="background-color: #B2CCFF; color: white">${name2 }</td>
													</c:when>
													<c:otherwise>
														<td></td>
													</c:otherwise>
												</c:choose>
											</c:forEach>	
											</tr>
										</c:forEach>	
													 
									</tbody>																	
								</table> 
								
								
							</div>	
								
								
								

																				
							</div>
						</div>
                    </div>
                    <!-- footer -->
                    <footer class="col-12" style="height: 60px;">
                        footer
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