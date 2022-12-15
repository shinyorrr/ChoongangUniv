<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<style> @import url('https://fonts.googleapis.com/css2?family=Crimson+Pro:wght@300&family=Old+Standard+TT:ital@0;1&family=Unbounded:wght@300&display=swap'); </style>
<style type="text/css">
	.tdwidth{
		min-width: 150px;
	}

    #overflow {
        margin : 0 auto;
        overflow : hidden;
        white-space : nowrap; /* 줄바꿈 금지(이미지를 한줄로) */
    }
    .bi-person-circle{
    	font-size : 60px;
    	color : gray;
    }
    #month{
    	margin: 81px;
    	font-size: 34px;
    	font-family: 'Crimson Pro', serif;
    }
    .font-Bold{
    	font-family: 'Crimson Pro', serif;
    	font-size: 19px;
    	font-weight: 600;
    }
</style>
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
	
	function chagedeptSelect(){
		var selectDept = $("#deptSelect option:selected").val();
		var yearMonth = $('#month').text();
		location.href = "/manager/attMonthChange?deptno="+selectDept+"&month="+yearMonth;
	}
	
	function monthChange(add){
		var selectDept = $("#deptSelect option:selected").val();
		var yearMonth = $('#month').text();
		var year = parseInt(yearMonth.substring(0,4));
		var month = parseInt(yearMonth.substring(5,7));
		var monthadd = month - add;
		
		month = month - add;
		
		if(monthadd == 13){
			month = 1;
			year++;
		}
		if(monthadd == 0){
			month = 12;
			year--;
		}
		
		var monthStr = String(month).padStart(2,'0');
		var result = year + "-" + monthStr;
		
		location.href = "/manager/attMonthChange?deptno="+selectDept+"&month="+result;

		
		
		console.log(year);
		console.log(month);
		
	}
	
	$(document).ready(function(){
		var str ="";
		$.ajax({
			url 	: "/deptList",
			data	: "json",
			success	: function(data){
				console.log("성공");
				$(data).each(function(){
					if(this.dname != "교수"){
						str	+= "<option value='"+this.deptno+"'>"+this.dname+"</option>";
					}
				});
				console.log(str);
				const urlParams = new URL(location.href).searchParams;
				var deptno = parseInt(urlParams.get('deptno'));
				$('.form-select').append(str);
				if (isNaN(deptno)){
					$(".form-select").val(10).prop("selected", true);
				}
				if (!isNaN(deptno)){
					$(".form-select").val(deptno).prop("selected", true);
				}
				console.log("deptno --> " + deptno);
			}
		});
	});
	/* $(".form-select").val(deptno).attr("selected", true); */
	 function j_test(n){
	        $('#overflow').scrollLeft( $('#overflow').scrollLeft() + n );
	 }
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
                    <a href="#" class="nav__logo">근태관리</a>
                </div>
                    <div href="#" class="nav__link collapses">
     				<ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">근태관리</span>

                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

                        <ul class="collapse__menu" style="width: 180px;">
                            <a href="${pageContext.request.contextPath}/manager/attForm" class="collapse__sublink">나의 근태관리</a><br>
                            <a href="${pageContext.request.contextPath}/manager/attDeptMemberForm" class="collapse__sublink">부서별 근태관리</a>
                            <a href="${pageContext.request.contextPath}/manager/attAllMemberForm" class="collapse__sublink">사원별 근태관리</a>
                        </ul>
                    </div>
                <a href="/logout" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">Log out</span>
                </a>
                </div>
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
                        <i class="bi bi-bookmark-fill me-2"></i>근태관리<i class="bi bi-chevron-right"></i>부서별 근태조회 
                        <button class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/attForm'"
                        	style="margin-left: 64%;line-height: 11px;">내 근태관리</button>
                    </div>
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                    	<div class="row">
	                    	<div class ="col-2">부서별 근태현황</div>
	                    	<div class ="col-8"
							style=" align-items: center;text-align: center;font-size: 21px;"
	                		><i class="bi bi-chevron-left" onclick="monthChange(1)"></i><span id="month">${Month }</span><i class="bi bi-chevron-right" onclick="monthChange(-1)"></i></div>
	                    	<div class ="col-2"></div>
                    	</div><hr>
                    <select class="form-select" id = "deptSelect" name = "deptno" aria-label="Default select example" onchange="chagedeptSelect()">
					</select>
						<div class ="row">
							<div class ="col" onclick="j_test(-1300)" style="display: flex;align-items:center;">
								<i class="bi bi-chevron-left"></i>
							</div>
							<div class ="col" style="width: 90%;">
								<div id = "overflow">
			                    	<table class="table table-hover">
			                    		<tr>
			                    		<th class="tdwidth" colspan="2">이름</th>
			                     		<c:forEach var="i" begin="0" end="${monthList.size()-1}">
			   	   	              			<th class="tdwidth" style = "text-align: left">${monthList.get(i)}</th>
			                    		</c:forEach>
			                    		<c:if test="${attList.size() != 0 && memberList.size() != 0 && attList.size() != 1}">
					                    		<c:forEach var="i" begin="0" end ="${attList.size()-attList.size()/memberList.size()}" step ="${attList.size()/memberList.size()}">
					                    		<tr>
					                    			<td class="td" style = "text-align: center">
					                    				<i class="bi bi-person-circle"></i>
					                    			</td>
					                    			<td>
					                    				<span class = "font-Bols"><br>
					                    				${attList.get(i).member.name} ${attList.get(i).member.position}<br>
					                    				<span style = "margin-left : 20px">${attList.get(i).member.dept.dname}</span>
						                    			</span>
					                    			</td>
					                    			<td class="tdwidth" style = "text-align: center">
					                    				<span class = "font-Bold">
					                    				${attList.get(i).attOnTime} 
					                    				<br>-
					                    				<br>${attList.get(i).attOffTime } <br>
					                    				</span>
					                    			<c:if test = "${attList.get(i).attStatus eq '출근'}">
						                    			<span style = "color : blue ; text-align: center; font-size : 13px">
							                    			 ${attList.get(i).attStatus}
						                    			</span>
					                    			</c:if>
					                    			<c:if test = "${attList.get(i).attStatus ne '출근'}">
						                    			<span style = "color : red ; text-align: center; font-size : 13px">
							                    			 ${attList.get(i).attStatus}
						                    			</span>
					                    			</c:if>
					                    			
					                    			 </td>
						                     			<c:forEach var="j" begin="1" end="${attList.size()/memberList.size()-1}">
					    	    	            			<td class="tdwidth" style = "text-align: center">
					    	    	            			<span class = "font-Bold"> ${attList.get(i+j).attOnTime} 
					    	    	            			<br>-
					    	    	            			<br>${attList.get(i+j).attOffTime }<br>
					    	    	            			</span>
					    	    	            			<c:if test = "${attList.get(i+j).attStatus eq '출근'}">
								                    			<span style = "color : blue ; text-align: center; font-size : 13px">
									                    			 ${attList.get(i+j).attStatus}
								                    			</span>
							                    			</c:if>
							                    			<c:if test = "${attList.get(i+j).attStatus eq '지각'}">
								                    			<span style = "color : red ; text-align: center; font-size : 13px">
									                    			 ${attList.get(i+j).attStatus}
								                    			</span>
							                    			</c:if>
					        	            			</c:forEach>
					                    		</tr>
					                    		</c:forEach>
				                    	</c:if>
			                    	</table>
			                    </div>
							</div>
							<div class="col" onclick="j_test(1300)" style="display: flex;align-items:center;">
								<i class="bi bi-chevron-right"></i>
							</div>
						</div>
           			</div>
           		</div>
    </div>
    <jsp:include page="../footer.jsp"></jsp:include>
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="/js/main.js"></script>
</body>
</html>