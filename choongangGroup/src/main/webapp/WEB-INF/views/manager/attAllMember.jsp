<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">



	var isShow = true;
	function hide(index){
		if(isShow){
			$('.deptUser'+index).show();
			isShow = false;
		} else{
			$('.deptUser'+index).hide();
			isShow = true;
		}
	}
	
	function attUpdateForm(index){
		$('#onTime'+index).hide();
		$('#offTime'+index).hide();
		$('#vacation'+index).hide();
		$('#button'+index).hide();
		
		$('#inOnTime'+index).show();
		$('#inOffTime'+index).show();
		$('#inVacation'+index).show();
		$('#buttonAfter'+index).show();
	}
	
	function attUpdate(index){
		var attOntime  = $('#inOnTime'+index).val();
		var attOfftime = $('#inOffTime'+index).val();
		var vacation   = $('#inVacation'+index).val();
		var userid = $('#userid'+index).val();
		var workDate = $('#workDate'+index).val();
		var name = $('#name'+index).val();
		
		$.ajax({
			url  : '/updateMemAtt',
			data : {attOntime : attOntime,
					attOfftime : attOfftime ,
					vacation : vacation,
					userid : userid,
					workDate : workDate},
			success : function(data){
				
			}
		});		
		
		$('#inOnTime'+index).hide();
		$('#inOffTime'+index).hide();
		$('#inVacation'+index).hide();
		$('#buttonAfter'+index).hide();
		
		memberUpdate(name);
	}
	
	
	
	/* 유저 클릭시 근태정보 조회 */
 	function memberUpdate(name){
		$('#userAttList').text("");
		var name1  = name;
		var month = $('#month').text();
		var str = "<table class= 'table table-hover'>"
		$.ajax({
	 		url : '/memberAttList',
	 		data: {name : name1, month : month},
	 		success	 : function(data){
	 			if(data.length == 0){
	 				$('#userAttList').text("");
	 			} else{	
	 			$.each(data, function(index,item){
	 				str += "<tr><td>"+item.workDate +"</td>" 
	 					+ "<td><span id ='onTime"+index+"'>"
	 					+ item.attOnTime + "</span>" 
	 					+ "<input type='text' id = 'inOnTime"+index
	 					+ "'  value='"+item.attOnTime+"'style ='display : none'>"
	 					+ "<td><span id ='offTime"+index+"'>"
	 					+ item.attOffTime + "</span>" 
	 					+ "<input type='text' id = 'inOffTime"+index
	 					+ "'  value='"+item.attOffTime+"'style ='display : none'>"
	 					+ "<td><span id ='vacation"+index+"'>"
	 					+ item.member.vacation + "</span>" 
	 					+ "<input type='text' id = 'inVacation"+index
	 					+ "'  value='"+item.member.vacation+"'style ='display : none'>"
	 					+ "</td><td><button type='button' + id = 'button"+index+"'"
	 					+ " class='btn btn-primary' onclick='attUpdateForm("+index+")'>수정</button></td>" 
	 					+ "</td><td><button type='button' + id = 'buttonAfter"+index+"'"
	 					+ " class='btn btn-primary' onclick='attUpdate("+index+")' style ='display : none'>수정완료</button>"
	 					+ " <input type = 'text' id = 'userid"+index+"'value = '"+item.member.userid+"' hidden = 'true'></td>" 
	 					+ " <input type = 'text' id = 'name"+index+"'value = '"+item.member.name+"' hidden = 'true'></td>" 
	 					+ " <input type = 'text' id = 'workDate"+index+"'value = '"+item.workDate+"' hidden = 'true'></td>" 
	 					+ " </tr>";
		 			console.log("성공했다");
	 			});
		 		str += "</table>";
		 		$('#userAttList').append(str);
	 			}
	 		}
	 		
	 	});
	} 
	/* 유저 클릭시 근태정보 조회 */
 	function memberSearch(index){
		var name  = $('#dept'+index).text();
		$('.confirm').not(this).css("border","0px");
		$('#dept'+index).css("border","2px solid red");
		var name1 = name.trim();
		var month = $('#month').text();
		console.log(name1);
		console.log("mont-->" + month);
		var str = "<table class= 'table table-hover'>"
		$.ajax({
	 		url : '/memberAttList',
	 		data: {name : name1, month : month},
	 		success	 : function(data){
	 			if(data.length == 0){
	 				$('#userAttList').text("");
	 			} else{	
	 			$.each(data, function(index,item){
	 				str += "<tr><td>"+item.workDate +"</td>" 
	 					+ "<td><span id ='onTime"+index+"'>"
	 					+ item.attOnTime + "</span>" 
	 					+ "<input type='text' id = 'inOnTime"+index
	 					+ "'  value='"+item.attOnTime+"'style ='display : none'>"
	 					+ "<td><span id ='offTime"+index+"'>"
	 					+ item.attOffTime + "</span>" 
	 					+ "<input type='text' id = 'inOffTime"+index
	 					+ "'  value='"+item.attOffTime+"'style ='display : none'>"
	 					+ "<td><span id ='vacation"+index+"'>"
	 					+ item.member.vacation + "</span>" 
	 					+ "<input type='text' id = 'inVacation"+index
	 					+ "'  value='"+item.member.vacation+"'style ='display : none'>"
	 					+ "</td><td><button type='button' + id = 'button"+index+"'"
	 					+ " class='btn btn-primary' onclick='attUpdateForm("+index+")'>수정</button></td>" 
	 					+ "</td><td><button type='button' + id = 'buttonAfter"+index+"'"
	 					+ " class='btn btn-primary' onclick='attUpdate("+index+")' style ='display : none'>수정완료</button>"
	 					+ " <input type = 'text' id = 'userid"+index+"'value = '"+item.member.userid+"' hidden = 'true'></td>" 
	 					+ " <input type = 'text' id = 'name"+index+"'value = '"+item.member.name+"' hidden = 'true'></td>" 
	 					+ " <input type = 'text' id = 'workDate"+index+"'value = '"+item.workDate+"' hidden = 'true'></td>" 
	 					+ " </tr>";
		 			console.log("성공했다");
	 			});
		 		str += "</table>";
		 		$('#userAttList').append(str);
	 			}
	 		}
	 		
	 	});
	} 
 	
 	/* 현재 속한 달 출력 */
 	$(document).ready(function(){
 		var today = new Date();
 		var year = today.getFullYear();
 		var month = today.getMonth()+1;
 		
 		$('#month').text(year+"-"+month);
 		console.log(year + "-" + month);
 	});
 	
 	
 	/* 달력 이동 */
 	function monthChange(add){
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
		
		
		$('#month').text(year+"-"+month);
		
		console.log(year);
		console.log(month);
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
             <jsp:include page="contentHeader.jsp"></jsp:include>
                    <!-- card header -->
                    <div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;"> 
                        <i class="bi bi-bookmark-fill me-2"></i>근태관리<i class="bi bi-chevron-right"></i>전체근태관리
                        <button class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/attDeptMemberForm'"
                        	style="margin-left: 64%;line-height: 11px;">부서별 근태관리</button>
                    </div>
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                    
                    <div style=" align-items: center;text-align: center;font-size: 21px;">
                    	<i class="bi bi-caret-left" onclick="monthChange(1)"></i>
                    	<span id="month"></span>
                    	<i class="bi bi-caret-right" onclick="monthChange(-1)">
                    	</i>
                    </div>
                    
                    	<div class = "row">
                    		<div class = "col-1">
		                    	<c:set var="cdeptno" value="12345"></c:set>
		                    	<c:set var="deptCnt" value="0"/>
		                    	<c:set var="nameCnt" value="0"/>
		                    	<c:forEach var="member" items="${members}" varStatus="status">
		                    	<c:if test="${member.dept.dname ne null && member.dept.dname ne '교수'}">
			                    	<c:if test="${deptCnt == 0 }">
				                    	<div id="deptMain${nameCnt}" onclick="hide(${nameCnt+1})"
				                    		style="font-style: italic;font-size: 16px;font-weight: bold;">
				                    		${member.dept.dname}
				                    		<i class="bi bi-caret-down"></i>
				                    	</div>
			                    		<c:set var="cdeptno" value="${member.dept.dname }"/>
				                    	<c:set var="nameCnt" value="${nameCnt+1}"/>
			                    	</c:if>
			                    	<c:set var="deptCnt" value="1"/>
			                    	<c:if test="${deptCnt == 1}">
			                    			<c:if test="${cdeptno == member.dept.dname }">
						                    	<div class="deptUser${nameCnt }" 
						                    	style="display: none;" id = "dept${status.index}"
						        				onclick = "memberSearch(${status.index})">
			                    				<span style="margin-left: 15px;"></span>
						                    	${member.name}
						                    	</div>
			                    			</c:if>
			                    			<c:if test="${cdeptno != member.dept.dname }">
			                    				<c:set var="deptCnt" value="0"></c:set>
			                    			</c:if>
			                    	</c:if>
		                    	</c:if>
		                    	</c:forEach>
                    		</div>
                    		<div class="col">
                    			<table class= "table table-hover">
        							<tr>
        								<th>날짜</th><th>출근시간</th><th>퇴근시간</th><th>연차갯수</th><th>수정</th>
        							</tr>
                    			</table>
       							<div id = "userAttList">
       								
       							</div>
                    		</div>
                    	</div>
                    </div>
                    <!-- footer -->
                </div>
        </div>
        <jsp:include page="../footer.jsp"></jsp:include>
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="/js/main.js"></script>
</body>
</html>