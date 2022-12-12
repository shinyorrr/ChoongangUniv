<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		var str = "";
		$.ajax({
			url : '/findProf',
			dataType : 'json',
			success  : function(data){
				$.each(data,function(index,item){
					str += "<option value='" + item + "'>" + item + "</option>";
				});
			
 			const urlParams = new URL(location.href).searchParams;
			var pname = urlParams.get('pname');
			$('#profOption').append(str);
			console.log("pname --> " + pname);
			if (pname == null){
				$(".form-select").val("오태우").prop("selected",true);
			}
			if (pname != null){
				$(".form-select").val(pname).prop("selected", true);
			}
			}
		});
		
		$('.form-select').on('change',function(){
			var optionName = $(".form-select").val();
			location.href = "/EvaManagementForm?pname=" + optionName;
		});

	});
	

	
	
</script>



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
            <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">결재관리</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">게시판 관리</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">근태 관리</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">부서 관리</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">주소록 관리</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">학사 관리</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">쪽지함 관리</a></li>
            <li><a href="#" class="nav-link px-2 link-dark">교재 관리</a></li>
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
                    <a href="#" class="nav__logo"></a>
                </div>
        	<div href="#" class="nav__link">
                        <ion-icon name="folder-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">게시판 관리</span>
			</div>
           		<ul class="collapse__menu" style="width: 180px; margin-left : 10px">
           			<div class="row">
                    <a href="#" class="collapse__sublink">공지사항 글쓰기</a>
                    <a href="#" class="collapse__sublink">Group</a><br>
                    <a href="#" class="collapse__sublink">Members</a>
           			
           			</div>
             	</ul>
        	</div>
               
               
        </nav>
    </div>
    <!-- /side nav bar -->
    <!-- main content -->
    <div class="container-fluid w-100" style=" background-color: rgb(214, 225, 237)">
        <div class="row">
        
            
            
            <!-- content header -->
             <jsp:include page="contentHeader.jsp"></jsp:include>
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                    	<div class = "row border-bottom border-4">
                    		<div class = "col-8 m-2" style="line-height: 2.5;">
                    			강의 평가
                    		</div>
                    		<div class = "col-1 m-2" style="line-height: 2.5;">
                    			교수 이름  
                    		</div>
                    		<div class = "col-2 m-2">
	                    		<select class="form-select" id = "profOption" aria-label="Default select example">
	                    		</select>
                    		</div>
                    	</div>
                    	<div class = "m-2">
                    		만족도
                    	</div>
                    	<div class = "row">
                    		<div class = "col-1">
                    			평균 만족도
                    			${total.totalAvg}
                    		</div>
                    		<div class = "col-1">
                    			수강 인원
                    			${total.totalCnt}
                    		</div>
                    		<div class = "col-1">
                    			평가 인원
                    			${total.evaCnt}
                    		</div>
                    		<div class = "col-1">
                    			평가 참여율
                    			<fmt:formatNumber value="${total.evaCnt/total.totalCnt }"  type="percent"></fmt:formatNumber>
                    		</div>
                    	</div>
                    	<div class = "row">
                    	<c:if test="${evaList.size()==0}">
                    		<div class = "col-1">
	                    			수업내용 <br>
	                    			0
	                    	</div>
	                    	<div class = "col-1">
	                    			수업방법 <br>
	                    			0
	                    	</div>
	                    	<div class = "col-1">
	                    			수업유형 <br>
	                    			0
	                    	</div>
                    	</c:if>
                    	<c:if test="${evaList.size()!=0}">
                    	<c:forEach var="eva" begin="0" end="${evaList.size()-1}" items="${evaList }">
                    		<c:if test="${eva.bigCategory == 10}">
	                    		<div class = "col-1">
	                    			수업내용 ${eva.avg}
	                    		</div>
                    		</c:if>
                    		<c:if test="${eva.bigCategory == 20}">
	                    		<div class = "col-1">
	                    			수업방법  ${eva.avg}
	                    		</div>
                    		</c:if>
                    		<c:if test="${eva.bigCategory == 30}">
	                    		<div class = "col-1">
	                    			수업유형
	                    		</div>
                    		</c:if>
                    	</c:forEach>
                    	</c:if>
                    	</div>
                    	
                    </div>
                    <!-- footer -->
       
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