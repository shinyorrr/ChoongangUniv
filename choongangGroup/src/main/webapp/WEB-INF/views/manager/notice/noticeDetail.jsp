<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../header.jsp" %>
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
<script type="text/javascript">

	/**=== 게시판 수정 ===*/
	function updateFormNotice(){
		alert("수정폼");
		$("#noticeTitle1").hide();
		$("#noticeContent1").hide();
		$("#beforeButton").hide();
		$("#deleteButton").hide();
		$("#noticeTitle2").show();
		$("#noticeContent2").show();
		$("#afterButton").show();
	}
	
	function updateNotice(){
		alert("수정완료!");
		var vnoticeNum = $("#noticeNum").val();
		var vnoticeTitle = $("#noticeTitle2").val();
		var vnoticeContent = $("#noticeContent2").val();
			
		console.log("vnoticeNum -> " + vnoticeNum);
		console.log("vnoticeTitle -> " + vnoticeTitle);
		console.log("vnoticeNum -> " + vnoticeContent);
		
		if(vnoticeTitle === null || !vnoticeTitle){
			alert("제목을 입력하세요.");
			return false;
		}
		if(vnoticeContent === null || !vnoticeContent){
			alert("내용을 입력하세요.");
			return false;
		}
		
		
				
		$.ajax({
			url		 : "/updateNotice",
			data	 : { noticeNum : vnoticeNum , noticeTitle : vnoticeTitle, noticeContent : vnoticeContent},
			dataType : 'text',
			success	 : function(data){
				$("#noticeTitle1").val(vnoticeTitle);
				$("#noticeContent1").val(vnoticeContent);
			}
		});
		$("#noticeTitle1").show();
		$("#noticeContent1").show();
		$("#noticeTitle2").hide();
		$("#noticeContent2").hide();
		$("#beforeButton").show();
		$("#afterButton").hide();
		$("#deleteButton").show();

	}
	
	/* 게시물 삭제 */
	function deleteNotice(){
		console.log("삭제 시작");
		var dnoticeNum = $("#noticeNum").val();
		console.log("dnoticeNum -> " + dnoticeNum);
		
		$.ajax({
			url 	: "/deleteNotice",
			data	: {noticeNum : dnoticeNum},
			success : function(data){
				alert("삭제 되었습니다.");
				location.href = "/notice/noticeList";
			}
		});
	}
	
	
	

</script>
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
            <li><a href="/manager/main" class="nav-link px-2 link-secondary">Home</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">전자 결재</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">학사 관리</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">교재 관리</a></li>
            <li><a href="/notice/noticeList" class="nav-link px-2 link-dark">공지사항 관리</a></li>
            <li><a href="/message/messageList" class="nav-link px-2 link-dark">쪽지함</a></li>
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
                    <a href="/notice/noticeList" class="nav__logo">공지사항 관리</a>
                </div>
                <div class="nav__list">
                    <a href="/noticeWrite" class="nav__link active">
                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">공지사항 글쓰기</span>
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
                        <span class="text-white h4">공지사항 조회 <span class="fw-bold">김중앙</span>님!</span>
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
                        <i class="bi bi-bookmark-fill me-2"></i>공지사항 관리 <i class="bi bi-chevron-right"></i> <a style="text-decoration: none; color: white;"  href="/notice/noticeList">공지사항</a>
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
		                     		<input id="noticeTitle2" type="text" class="form-control" value="${notice.noticeTitle}" style="display: none;">
		                     	</div>
		                     	<div>
		                     		<label class="form-label">내용</label>
		                     		<textarea id="noticeContent1" name="noticeContent" class="form-control" rows="3" style="height: 300px;" readonly="readonly" >${notice.noticeContent}</textarea>
		                     		
		                     		<textarea id="noticeContent2" class="form-control" rows="3" style="height: 300px; display: none;">${notice.noticeContent}</textarea>            	
		                      	</div>
		                      	<c:set value='<%=(String)session.getAttribute("userid") %>' var="userid"/>
									<c:if test="${notice.userid eq userid}">
		                      	<div style="margin: 10px;">
			                        	<button id="beforeButton" type="button" class="btn btn-outline-primary"  onclick="updateFormNotice()">수정</button>
			                        	<button id="afterButton" type="button" class="btn btn-outline-primary"  onclick="return updateNotice()" style="display: none;">수정완료</button>
			                        	<button id="deleteButton" type="button" class="btn btn-outline-danger" onclick="deleteNotice()">삭제</button>	    
			                    </div>
			                    </c:if>
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