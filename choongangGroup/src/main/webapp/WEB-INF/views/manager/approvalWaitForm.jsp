<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp"%>
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
    
          <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
  			<jsp:include page="navHeader.jsp"></jsp:include>
          </ul>
        </header>
    </nav>
    <!-- /header -->
    <!-- side nav bar -->
    <div class="l-navbar" id="navbar">
		<nav class="navv">
			<div>
				<div class="nav__brand">
					<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="/manager/approval" class="nav__logo">결재관리</a>
				</div>
				<div class="nav__list">
					<div href="${pageContext.request.contextPath}/manager/approval" class="nav__link collapses">
						<!-- <ion-icon name="folder-outline" class="nav__icon"></ion-icon> -->
						<!-- <i class="bi bi-gear-fill nav__icon" name="folder-outline"></i> -->
						<i class="bi bi-clipboard2-check-fill nav__icon" name="folder-outline"></i>
						<span class="nav_name">전자결재</span>

						<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

						<ul class="collapse__menu" style="width: 200px;">
							<a href="/manager/approvalWrite" class="collapse__sublink">새 결재 진행</a></br>
							<a href="/manager/approvalWait" class="collapse__sublink">결재 대기중 문서</a></br>
                            <a href="/manager/approvalProcess" class="collapse__sublink">기안 진행중 문서</a></br>
                            <a href="/manager/approvalEnd" class="collapse__sublink">기안 완료 문서</a></br>
						</ul>
					</div>
					<div href="${pageContext.request.contextPath}/manager/approval" class="nav__link collapses">
						<!-- <ion-icon name="folder-outline" class="nav__icon"></ion-icon> -->
						<!-- <i class="bi bi-gear-fill nav__icon" name="folder-outline"></i> -->
						<i class="bi bi-pencil-fill nav__icon" name="folder-outline"></i>
						<span class="nav_name">강의관리</span>

						<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
						
						<ul class="collapse__menu" style="width: 200px;">
							<a href="/manager/lecManagement" class="collapse__sublink">강의 정보 관리</a></br>
							<a href="/manager/makeupManagement" class="collapse__sublink">휴&middot; 보강 관리</a></br>
						</ul>
					</div>
				</div>
				<a href="/logout" class="nav__link"> <ion-icon
						name="log-out-outline" class="nav__icon"></ion-icon> <span
					class="nav_name">로그아웃</span>
				</a>
			</div>
		</nav>
	</div>
    <!-- /side nav bar -->
    <!-- main content -->
    <div class="container-fluid w-100" style=" background-color: rgb(214, 225, 237)">
        <div class="row">
        <!-- content header -->
		<jsp:include page="contentHeader.jsp"></jsp:include>
                    <!-- card header -->
                    <div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;"> 
                        <i class="bi bi-bookmark-fill me-2"></i>전자결재 <i class="bi bi-chevron-right"></i>결재 대기중 문서
                    </div>
                    <!-- card content -->  
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                        <div id="titleInBox" style="font-weight: bold; font-size: 19px;">결재 대기 문서 목록</div>
                        <div class="btnProcess" style="font-size: 12px; color: #7F7F7F; text-align: right;">총 문서 : ${waitTotal}건</div>
						<div id="containerBox">
							<div style="border-top: 1px dashed #c9c9c9; margin-top: 10px;"></div>
                    
                    	<!----------------------------- 조회 테이블 시작  ---------------------------->
                        <table class="table table-hover" style="font-size: 14px; text-align: center;">
								<thead>
									<tr>
										<th>문서번호</th>
										<th>기안일</th>
										<th>결재양식</th>
										<th>사번</th>
										<th style="width: 57%;">제목</th>
										<th>첨부</th>
										<th>결재상태</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="wait" items="${waitList}">
										<tr>
											<td>
												<a href="apprWaitDetail?approval_no=${wait.approval_no}">${wait.approval_no}</a>
											</td>
											<td>${wait.writeday}</td>
											<td>${wait.approval_sort_name}</td>
											<td>${wait.userid}</td>
											<td>${wait.title}</td>
											<c:if test="${wait.file_path ne null }">
												<td><i class="bi bi-file-earmark"></i></td>
											</c:if>
											<c:if test="${wait.file_path eq null }">
												<td>&nbsp;</td>
											</c:if>
											<c:if test="${wait.approval_status eq 0}">
												<td>대기중<td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							
							
							<!-- 페이징 번호 설정 -->
							<nav aria-label="Page navigation example">
							  <ul class="pagination justify-content-center">
							  <c:if test="${page.startPage > page.pageBlock }">
							    <li class="page-item">
							      <a class="page-link" href="approvalWait?currentPage=${page.startPage - page.pageBlock}" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
							    </c:if>  
							    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							    <li class="page-item">
								    <a class="page-link" href="approvalWait?currentPage=${i}">${i}</a>
							    </li>
							    </c:forEach>
							    <c:if test="${page.endPage < page.totalPage}">
							    <li class="page-item">
							      <a class="page-link" href="approvalWait?currentPage=${page.startPage + page.pageBlock}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
							    </c:if>
							  </ul>
							</nav>
                    </div>
                </div>
            </main>
            <jsp:include page="../footer.jsp"></jsp:include>
        </div>
    </div>
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="/js/main.js"></script>
</body>
</html>