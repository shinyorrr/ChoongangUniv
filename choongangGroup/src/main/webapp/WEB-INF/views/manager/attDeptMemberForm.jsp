<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.tdwidth{
		min-width: 150px;
	}

    #overflow {
        margin : 0 auto;
        overflow : hidden;
        white-space : nowrap; /* 줄바꿈 금지(이미지를 한줄로) */
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
		location.href = "/attMonthChange?deptno="+selectDept+"&month="+yearMonth;
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
		
		location.href = "/attMonthChange?deptno="+selectDept+"&month="+result;

		
		
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
					$(".form-select option:eq(0)").prop("selected");
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
                <div class="row">
                	<div class="col-6">
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
		            <div class="col-4">
		            	<div style="width: 535px;line-height: 100px;color: white;font-size: 77px;text-align:center;" id="clock">
						</div>
		            </div>
		            <div class="col-1">
		            	<button type="button" class="btn btn-secondary" style="width: 100px;height: 43px;margin: 5px;" onclick="attInsert()">출근</button>
		            	<button type="button" class="btn btn-secondary" style="width: 100px;height: 43px;margin: 5px;" onclick="attOff()">퇴근</button>
		            </div>
	           </div>
                
            </div>
            <main class="col-9 h-100 w-100">
                <div class="row m-5">
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
	                		><i class="bi bi-caret-left" onclick="monthChange(1)"></i><span id="month">${Month }</span><i class="bi bi-caret-right" onclick="monthChange(-1)"></i></div>
	                    	<div class ="col-2"></div>
                    	</div><hr>
                    <select class="form-select" id = "deptSelect" name = "deptno" aria-label="Default select example" onchange="chagedeptSelect()">
					</select>
						<div class ="row">
							<div class ="col" onclick="j_test(-1300)" style="display: flex;align-items:center;">
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-caret-left" viewBox="0 0 16 16">
								  <path d="M10 12.796V3.204L4.519 8 10 12.796zm-.659.753-5.48-4.796a1 1 0 0 1 0-1.506l5.48-4.796A1 1 0 0 1 11 3.204v9.592a1 1 0 0 1-1.659.753z"/>
								</svg>
							</div>
							<div class ="col" style="width: 90%;">
								<div id = "overflow">
			                    	<table class="table table-hover">
			                    		<tr>
			                    		<th class="tdwidth">이름</th>
			                     		<c:forEach var="i" begin="0" end="${monthList.size()-1}">
			   	   	              			<th class="tdwidth">${monthList.get(i)}</th>
			                    		</c:forEach>
			                    		<c:if test="${attList.size() != 0 && memberList.size() != 0}">
					                    		<c:forEach var="i" begin="0" end ="${attList.size()-attList.size()/memberList.size()}" step ="${attList.size()/memberList.size()}">
					                    		<tr>
					                    			<td class="tdwidth">${attList.get(i).member.name}(${attList.get(i).member.position}) <br>${attList.get(i).member.dept.dname} </td>
					                    			<td class="tdwidth">출근 : ${attList.get(i).attOnTime} <br> 퇴근 : ${attList.get(i).attOffTime } <br> ${attList.get(i).attStatus}</td>
						                     			<c:forEach var="j" begin="1" end="${monthList.size()-1}">
					    	    	            			<td class="tdwidth">출근 : ${attList.get(i+j).attOnTime} <br> 퇴근 : ${attList.get(i+j).attOffTime }</td>
					        	            			</c:forEach>
					                    		</tr>
					                    		</c:forEach>
				                    	</c:if>
			                    	</table>
			                    </div>
							</div>
							<div class="col" onclick="j_test(1300)" style="display: flex;align-items:center;">
								<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-caret-right" viewBox="0 0 16 16">
								  <path d="M6 12.796V3.204L11.481 8 6 12.796zm.659.753 5.48-4.796a1 1 0 0 0 0-1.506L6.66 2.451C6.011 1.885 5 2.345 5 3.204v9.592a1 1 0 0 0 1.659.753z"/>
								</svg>
							</div>
						</div>
           			</div>
           		</div>
          </main>
    </div>
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="/js/main.js"></script>
</body>
</html>