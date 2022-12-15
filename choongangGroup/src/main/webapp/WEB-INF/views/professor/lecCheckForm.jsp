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

	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">

	
	</script>
</head>

<body id="body-pd">
	<nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
			<a href="/professor/main" class="navbar-brand">
				<img class="img-fluid ms-3" src="/images/logo2.png" alt="logo2" style="height: 40px;"><use xlink:href="#bootstrap"></use></svg>
			</a>
		</header>
		
		<div class=" flex-row float-end ms-4" style="float: right;">
			<span class="text-primary h5" ><b>${member.name}</b>님</span>
			<i class="text-primary bi-gear-fill mx-2"></i>
			<span class="text-primary mx-3  font09">${member.major} | ${member.position} </span>
			<%-- <i class="bi bi-envelope-fill text-primary"></i>
			<span class="text-primary ms-2 font09">${email}</span>--%>			
		</div>
	</nav>
	
	<!-- side nav bar -->
	<div class="l-navbar" id="navbar">
		<nav class="navv">
			<div>
				<div class="nav__brand"><ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="#" class="nav__logo"></a>
				</div>
				<!-- <a href="/professor/calenderForm" class="nav__link active"><i class="bi bi-calendar-plus nav__icon" ></i>
					<span class="nav_name">캘린더</span>
				</a> -->

				<div class="nav__list">
					<a href="/notice/noticeList" class="nav__link"><ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
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
							<a href="/professor/lecScore" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">성적관리</a>
							<a href="#" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">휴&#183;보강 신청</a>
							<a href="#" class="collapse__sublink" style="font-size: 0.85rem; display: block;">내선번호관리</a>
						</ul>
					</div>
	
					<a href="#" class="nav__link"><ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
						<span class="nav_name">결재</span>
					</a>
					<a href="#" class="nav__link"><ion-icon name="settings-outline" class="nav__icon"></ion-icon>
						<span class="nav_name">개인정보관리</span>
					</a>
				</div>
				<a href="/logout" class="nav__link"><ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">Log out</span>
				</a>
			</div>
		</nav>
	</div>
	<!-- /side nav bar -->

	<!------- main content ------------>
	<div class="container-fluid w-100" style=" background-color: rgb(214, 225, 237);">
		<div class="row">


			<!------------- card header  컨텐츠 폼------------->
			<main class="col-9 h-100 w-100">
			
				
				<div class="row m-5">
					<!------------- 컨텐츠 경로 ------------->
					<div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;">
						<i class="bi bi-bookmark-fill me-2"></i>강의관리 &gt; 전자출석부</div>
					<!----- card content 내용 ------>
						<div class="col-12 rounded-bottom overflow-auto bg-white p-5" style="min-height: 550px;">
							
							<h2>전자출석부</h2><hr>
							
							<!-- 강의 목록 select box -->
							<select class="form-select form-select-sm w-28 my-2 font09" id="selectLec" aria-label="Default select" onchange="showMemberList(0)">
								<c:forEach var="lecList" items="${lecList}">
									<option value="${lecList.id }">(${lecList.typeCode}${lecList.id}) <b>${lecList.name}</b> _${lecList.grade}학년</option>
								</c:forEach>
							</select>
							
							<div class="mt-1 mb-4 py-4 px-3" style="border-collapse: collapse; border: 1px solid #BDBDBD;">
								<div class="mb-2">
									<div style="font-size: 1.4em; display: inline-block;">(${lecture.typeCode}${lecture.id}) <b>${lecture.name}</b> _ ${lecture.grade}학년</div>
									<div style="float: right;">
										<button style="display: inline-block; " type="button" class="btn btn-primary btn-sm me-2"
												onclick="location.href='lecMgMain'" >&nbsp; 강의 목록보기  &nbsp;</button>
										<button style="display: inline-block;" type="button" class="btn btn-dark btn-sm"
												onclick="location.href='lecAttendExcel?excelDownload=true&id=${lecture.id}'" >&nbsp; 엑셀 다운로드  &nbsp;</button>
									</div>
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
													<div class="m-1 mx-2 bg-white align-self-center" style="width: 70%; ">
														<img src="../upload/hj/${mem.image}" style="width: 100%;"  class="img-fluid " >
													</div>
												</td>
												<td class="p-3 mb-0">
													<div class=" px-2" style="font-size:1em; "><b >${mem.name}</b>  
														<p class="font09 mb-0" style="margin-top:3px;">${mem.userid}</p>
														<p class="font09 mt-0 mb-0">${mem.major} <span class="fontColorGr1 mb-0"> &nbsp; &nbsp; ${mem.grade}학년</span></p>
													</div>
												</td>

									<c:if test="${i%2 == 0}">
											</tr>
									</c:if>
									</c:forEach>
							</table>
						</div>
					
					<!-- footer -->
               <footer class="col-12 mt-5" style="height: 60px; font-size: 12px;">
               <jsp:include page="../footer.jsp"></jsp:include>
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