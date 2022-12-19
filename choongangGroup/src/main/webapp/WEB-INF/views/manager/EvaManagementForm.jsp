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
<style> @import url('https://fonts.googleapis.com/css2?family=Crimson+Pro:wght@300&family=Old+Standard+TT:ital@0;1&family=Unbounded:wght@300&display=swap'); </style>
<style type="text/css">
	#headFont{
		font-size : 18px;
		font-weight : 600;
		margin : 50px;
	}
	.score{
    	font-size: 50px;
    	font-family: 'Crimson Pro', serif;
    	color : green;		
	}
	.koreafont{
		font-size: 22px;
		color : green;		
		font-family: 'Crimson Pro', serif;
	}
	.koreafont-1{
		font-size: 18px;
		color : gray;
		font-weight : 600;
		font-family: 'Crimson Pro', serif;
	}
	 .star {
    position: relative;
    font-size: 2rem;
    color: #aaa9a9;
  }
  
  .star span {
    width: 0;
    position: absolute; 
    left: 0;
    color: #fff58c;
    overflow: hidden;
    pointer-events: none;
    -webkit-text-fill-color: gold;
  }
  .review{
  	color : gray;
  	padding-left : 100px;
  	padding-bottom : 30px;
  }
  .bi-alexa{
  	padding-right : 20px;
  }
</style>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		var str = "";
		const urlParams = new URL(location.href).searchParams;
		var pname = urlParams.get('pname');
		
		if (pname == null){
			$("#profName").val("유상신").prop("selected",true);
		}
 		if (pname != null){
			$("#profName").val(pname).prop("selected", true);
		} 
		
		// 강의 이름 select Box
		$.ajax({
			url : '/manager/findProf',
			data : {pname : pname},
			dataType : 'json',
			success  : function(data){
				$.each(data,function(index,item){
					str += "<option value='" + item.lecId + "'>" + item.lecName + '(' + item.type +item.typeCode+item.lecid+')'+"</option>";
				});
			
				var lecid = urlParams.get('lecId')
				$('#lecName').append(str);
				
				if (lecid == null){
					$("#lecName").val(eq[0]).prop("selected",true);
				}
				if (lecid != null){
					$("#lecName").val(lecid).prop("selected", true);
				}
			}
		});

		// 강의 이름이 변경되었을 때
		$('#lecName').on('change',function(){
			var optionName = $("#lecName").val();
			var pname = $("#profName").val();
			
			location.href = "/manager/EvaManagementForm?lecId=" + optionName + "&pname=" + pname;
		});
		
		
		$('#profName').on('change',function(){
			var optionName = $("#profName").val();
			location.href = "/manager/EvaManagementForm?pname=" + optionName +'&lecId=0';
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
					<a href="/manager/approval" class="nav__logo">학사관리</a>
				</div>
				<div class="nav__list">
					<div href="" class="nav__link collapses">
						<!-- <ion-icon name="folder-outline" class="nav__icon"></ion-icon> -->
						<!-- <i class="bi bi-gear-fill nav__icon" name="folder-outline"></i> -->
						<i class="bi bi-mortarboard-fill nav__icon" name="folder-outline"></i>
						<span class="nav_name">학사관리</span>

						<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

						<ul class="collapse__menu" style="width: 200px;">
							<a href="/manager/studentManage" class="collapse__sublink">학생관리</a></br>
							<a href="/manager/professorManage" class="collapse__sublink">교수관리</a></br>
							<a href="/manager/EvaManagementForm" class="collapse__sublink">강의 평가 관리</a></br>
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
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light" style="min-height: 550px;"> 
                    	<div class = "row" style="margin-bottom: 50px;background-color: rgb(39, 40, 70);color: white;">
                    		<div class = "col-5 m-2" style="line-height: 2.5;font-weight: 700;font-size: 17px;">
                    			강의 평가
                    		</div>
                    		<div class = "col-1 m-2" style="line-height: 2.5;font-weight: 700;font-size: 17px;">
                    			교수 이름
                    		</div>
                    		<div class = "col-2 m-2">
	                    		<select class="form-select" id = "profName" aria-label="Default select example">
	                				<c:forEach var="i" begin="0" end="${profList.size()-1 }">
	                					<option value="${profList.get(i)}">${profList.get(i)}</option>
	                				</c:forEach>
	                    		</select>
                    		</div>
                    		<div class = "col-1 m-2" style="line-height: 2.5;font-weight: 700;font-size: 17px;">
                    			강의 이름  
                    		</div>
                    		<div class = "col-2 m-2">
	                    		<select class="form-select" id = "lecName" aria-label="Default select example">
	                    		</select>
                    		</div>
                    	</div>
                    	<div class = "row" style="margin-bottom: 40px;">
                    	<div class="col-1" id = "headFont">
                    		만족도
                    	</div>
                    		<div class = "col-2 border-end border-2" style="text-align: center;">
                    			<span class="score">${total.totalAvg}</span><br>
                    			<span class = "koreafont-1">평균만족도</span>
                    		</div>
                   			<div class = "col-2 border-end border-2" style="text-align: center;">
                    			<span class="score">${total.totalCnt}</span><span class = "koreafont">명</span><br>
                    			<span class = "koreafont-1">수강인원</span>
                    		</div>
                    		<div class = "col-2 border-end border-2" style="text-align: center;">
                    			<span class="score">${total.evaCnt}</span><span class = "koreafont">명</span><br>
                    			<span class = "koreafont-1">평가인원</span>
                    		</div>
                    		<div class = "col-2" style="text-align: center;">
                    			<span class="score">
                    			<fmt:formatNumber value="${total.evaCnt/total.totalCnt }"  type="percent"></fmt:formatNumber>
                    			</span><br>
                    			<span class = "koreafont-1">평가참여율</span>
                    		</div>
                    	</div>
                    	
                    	<div class = "row">
                    	<c:if test="${evaList.size()==0}">
                    		<div class="col-2"></div>
	                    		<div class = "col-3">
	                    			수업내용(5점)
									<span class="star">
									  ★★★★★
									  <span style="width:0%">★★★★★</span>
									</span>
	                    			 (0점)
	                    		</div>
	                    		<div class = "col-3">
	                    			수업방법(5점)  
	                    			<span class="star">
									  ★★★★★
									  <span style="width:0%">★★★★★</span>
									</span>
	                    			 (0점)
	                    		</div>
	                    		<div class = "col-3">
	                    			수업유형(5점)
	                    			<span class="star">
									  ★★★★★
									  <span style="width:0%">★★★★★</span>
									</span>
	                    			 (0점)
	                    		</div>
                    		</c:if>
	                   
                    	<c:if test="${evaList.size()!=0}">
                    		<div class="col-1"></div>
                    	<c:forEach var="eva" begin="0" end="${evaList.size()-1}" items="${evaList }">
                    	
                    		<c:if test="${eva.bigCategory == 10}">
	                    		<div class = "col-3">
	                    			수업내용(5점)
									<span class="star">
									  ★★★★★
									  <span style="width:${eva.avg*18.8}%">★★★★★</span>
									</span>
	                    			 (${eva.avg}점)
	                    		</div>
                    		</c:if>
                    		<c:if test="${eva.bigCategory == 20}">
	                    		<div class = "col-3">
	                    			수업방법(5점)  
	                    			<span class="star">
									  ★★★★★
									  <span style="width:${eva.avg*18.8}%">★★★★★</span>
									</span>(${eva.avg}점)
	                    		</div>
                    		</c:if>
                    		<c:if test="${eva.bigCategory == 30}">
	                    		<div class = "col-3">
	                    			수업유형(5점)
	                    			<span class="star">
									  ★★★★★
									 <span style="width:${eva.avg*18.8}%">★★★★★</span>
									 </span> (${eva.avg}점)
	                    		</div>
                    		</c:if>
                    	</c:forEach>
                    	</c:if>
                    	</div>
                    		<div class ="border-bottom border-3 m-3 pb-3" style ="padding-left : 25px;font-weight: 700;">수강후기</div>
							<c:if test="${reviewList.size() != 0}">
                    			<c:forEach var="review" items="${reviewList}">
	                    		<div class = "review">
                    				<i class="bi bi-alexa"></i>${review.review}
    	                		</div>
                    			</c:forEach>
							</c:if>
                    	</div>
                    	
                    </div>
                    	
                    <!-- footer -->
       
        </div>
        <jsp:include page="../footer.jsp"></jsp:include>
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="/js/main.js"></script>
</body>
</html>