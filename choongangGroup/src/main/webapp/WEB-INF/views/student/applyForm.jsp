<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

		function submit(obj){
			obj.submit();
			
		}

		function apply(lecId, userid){
			$.ajax({
				url:"/student/apply",
				data:{lecId : lecId , userid : userid},
				dataType:'text',
				success:function(data){
					const result = $.trim(data);

					if(result == 1){
					alert("성공")
					location.reload();
					}else if(result == 0){
						alert("중복된 강의입니다.")
					}else if(result ==2){
						alert("시간이 중복되었습니다.")
					}else{
						alert("최대학점을 초과했습니다 [신청가능 최대학점 : 21학점]")
					}
				}		
			});	
		}
		
</script>

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

<body class="" id="body-pd">
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
            <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">About</a></li>
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
                    <a href="#" class="nav__logo">Bedimcode</a>
                </div>
                <div class="nav__list">
                    <a href="#" class="nav__link active">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="#" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">Messenger</span>
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
    <!-- main content -->
    <div class="container-fluid w-100" style=" background-color: rgb(214, 225, 237)">
        <div class="row">
            
            
            <!-- content header -->
            <div class="col-12 pt-4" style="height: 150px; background-color: rgb(95, 142, 241)">
                <div class="d-flex flex-row mb-3">
                    <div>
                        <span class="text-white h4">안녕하세요. <span class="fw-bold">김중앙</span>님!</span>
                    </div>
                    <div class="border border-1 border-white border-bottom rounded-pill text-white px-2 pt-1 ms-2 h6">교수</div>
                    <div>
                        <i class="text-white bi-gear-fill mx-2"></i>
                    </div>
                </div>
                <div class="row">
                    <div>
                        <span class="text-white h6">이공대학 컴퓨터공학과 | 정교수</span>
                    </div>
                </div>
                <div class="d-flex flex-low">
                    <div>
                        <i class="bi bi-envelope-fill text-white"></i>
                    </div>
                    <div>
                        <span class="text-white ms-3">test123@naver.com</span>
                    </div>
                </div>
                
            </div>
            <main class="col-9 h-100 w-100">
                <div class="row m-5">
                    <!-- card header -->
                    <div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;"> 
                        <i class="bi bi-bookmark-fill me-2"></i>교수서비스 <i class="bi bi-chevron-right"></i>학사관리 <i class="bi bi-chevron-right"></i>강의 시간표 조회
                    </div>
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                        <!-------------------------------------------------- 본문 --------------------------------------------------->             
                        
	                        <!--메인 제목-->
	                        <div class="mt-3 mb-3">                    
	                       	  <span class="fs-2 fw-bold">수강신청 </span>                         
	                        </div> 
	                       	
	                       	<!--  검색상단바 -->
	                        <!-- class="fw-bold border rounded-top " style="background-color:#EAEAEA; height: 45px;" -->	                       	
	                       	<div class="fw-bold fs-5 " style="background-color:#EAEAEA; height: 45px;">
	                       		<span style="line-height: 45px; margin-left: 10px;">${year }학년도 ${semester }학기 개설강좌</span>
	                       		
	                    		<!-- 강의명으로 검색 -->
	                       		<form action="${pageContext.request.contextPath}/student/applyForm" method="get" class="row row-cols-lg-auto g-3 float-end me-5" >
		                       		  <span style="line-height: 45px;">강의명 :&nbsp;</span>
		                       		  
									  <div class="col-12">							    
									  	<div class="input-group">				     
									      <input type="text" name="lecName" class="form-control mt-1" placeholder="강의명으로 검색">
									    </div>
									  </div>
									 
									 <!-- 강의목록 정렬 Select -->
									 <div class="col-12">	
			                       		<input type="hidden" name="userid" value="${userid }">
										<select class="form-select mt-1" name="select" onchange="submit(this.form)">
											<option label="강의 목록"/>
											<option value="like">수강 장바구니</option >				
											<option value="all">수강 전체 과목</option>			
										</select>	
									</div>	
									 
								</form>
	                       	</div>
							
						
							<!----------- 강의 리스트 -------------->
							<table class="table table-striped mt-5">
								<thead>
									<tr>
										<th>강의코드</th><th>강의명</th><th>학년</th><th>강의시간</th><th>교수명</th>
										<th>이수구분</th><th>전공</th><th>학점</th><th>신청</th>
									</tr>
								</thead>
								<!-- 수강 장바구니 -->			
								<c:if test="${select eq 'like'}">
								<c:forEach var="list" items="${lectureList.content }">
									<tr>
										<td>${list.lecture.id }</td><td>${list.lecture.name }</td><td>${list.lecture.grade }</td>
										<td>${list.lecture.day1}${list.lecture.time1}, ${list.lecture.day2}${list.lecture.time2}</td><td>${list.lecture.prof }</td><td>${list.lecture.type }</td>
										<td>${list.lecture.major }</td><td>${list.lecture.unitScore }</td>
										<td><input type="button" value="신청" onclick="apply('${list.lecture.id}','${userid}')"></td> 			
									</tr>	
								</c:forEach>
								</c:if>	
								
								<!-- 수강 전체 과목 -->
								<c:if test="${select eq 'all'}">
								<c:forEach var="lec" items="${lectureList.content }">
									<tr>
										<td>${lec.id }</td><td>${lec.name }</td><td>${lec.grade }</td>
										<td>${lec.day1}${lec.time1}, ${lec.day2}${lec.time2}</td><td>${lec.prof }</td><td>${lec.type }</td>
										<td>${lec.major }</td><td>${lec.unitScore }</td>
										<td><input type="button" value="신청" onclick="apply('${lec.id}','${userid}')"></td>	
									</tr>	
								</c:forEach>
								</c:if>	
								
							</table>	
							
							<!------------------------------------- 페이징 영역 시작 ------------------------------------------>
								<div class="text-xs-center">
									<ul class="pagination justify-content-center">
									
										<!-- 이전 -->					
										<c:choose>
										<c:when test="${select eq 'all' }">
											  <c:choose>
												<c:when test="${lecture_lectureList.last}"></c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/student/applyForm/?userid=${userid }&select=${select}&lecture_page=0&lecName=">처음</a></li>
													<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/student/applyForm/?lecture_page=${lectureList.number-1}&select=${select}&userid=${userid }&lecName=">&larr;</a></li>
												</c:otherwise>
											  </c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${applicationLec_lectureList.last}"></c:when>
												<c:otherwise>
													<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/student/applyForm/?userid=${userid }&select=${select}&applicationLec_page=0&lecName=">처음</a></li>
													<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/student/applyForm/?applicationLec_page=${lectureList.number-1}&select=${select}&userid=${userid }&lecName=">&larr;</a></li>
												</c:otherwise>
											  </c:choose>
										
										</c:otherwise>										  
										</c:choose>

										<!-- 페이지 그룹 -->			
										<c:choose>
											<c:when test="${select eq 'all' }">
												  <c:forEach begin="${startBlockPage}" end="${endBlockPage}" var="i">
														<c:choose>
															<c:when test="${lecture_lectureList.pageable.pageNumber+1 == i}">
																<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/student/applyForm/?userid=${userid }&lecture_page=${i-1}&select=${select}&lecName=">${i}</a></li>
															</c:when>
															<c:otherwise>
																<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/student/applyForm/?userid=${userid }&lecture_page=${i-1}&select=${select}&lecName=">${i}</a></li>
															</c:otherwise>
														</c:choose>
												  </c:forEach>
											</c:when>
											<c:otherwise>
												  <c:forEach begin="${startBlockPage}" end="${endBlockPage}" var="i">
														<c:choose>
															<c:when test="${applicationLec_lectureList.pageable.pageNumber+1 == i}">
																<li class="page-item disabled"><a class="page-link" href="${pageContext.request.contextPath}/student/applyForm/?userid=${userid }&applicationLec_page=${i-1}&select=${select}&lecName=">${i}</a></li>
															</c:when>
															<c:otherwise>
																<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/student/applyForm/?userid=${userid }&applicationLec_page=${i-1}&select=${select}&lecName=">${i}</a></li>
															</c:otherwise>
														</c:choose>
												  </c:forEach>										
											</c:otherwise>										  
										</c:choose>
										
										<!-- 다음 -->
										<c:choose>
										<c:when test="${select eq 'all' }">
											  <c:choose>
												<c:when test="${lecture_lectureList.last}"></c:when>
												<c:otherwise>
													<li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/student/applyForm/?lecture_page=${lectureList.number+1}&userid=${userid }&select=${select}&lecName=">&rarr;</a></li>
													<li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/student/applyForm/?lecture_page=${lectureList.totalPages-1}&userid=${userid }&select=${select}&lecName=">마지막</a></li>
												</c:otherwise>
											  </c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${applicationLec_lectureList.last}"></c:when>
												<c:otherwise>
													<li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/student/applyForm/?applicationLec_page=${lectureList.number+1}&userid=${userid }&select=${select}&lecName=">&rarr;</a></li>
													<li class="page-item "><a class="page-link" href="${pageContext.request.contextPath}/student/applyForm/?applicationLec_page=${lectureList.totalPages-1}&userid=${userid }&select=${select}&lecName=">마지막</a></li>
												</c:otherwise>
											  </c:choose>
										
										</c:otherwise>										  
										</c:choose>
										
									</ul>
								</div>
								<!-- 페이징 영역 끝 -->
							</div>
							<!------------------------------------------------------------------------------------------------------------>	
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