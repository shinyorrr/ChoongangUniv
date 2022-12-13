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
<link rel="stylesheet" href="/css/styles.css">
<link rel="stylesheet" href="/css/stylesLec.css">
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
<!-- IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<!-- JS -->
<script src="/js/main.js"></script>
<script src="/js/bootstrap-datepicker.js"></script>

<!--------- DATE PICKER --------->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" > -->
<!-- <link rel="stylesheet" href="/css/plugin/datepicker/bootstrap-datepicker.css"> -->
 
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	//페이지 로드 완료되면 실행될 function
	document.addEventListener("DOMContentLoaded", function(){
		showOrdersList();
		setMinDate();
	});
	
	// 과제 list 요청 function(ajax)
	function showOrdersList() {
		var selLec = document.getElementById("selLec");
		var ajaxAppend = document.getElementById("ajaxAppend");
		selLecValue = selLec.options[selLec.selectedIndex].value;
		// 강의날짜 list 요청
		$.ajax({
			type: "POST",
			url: "/professor/getOrderList",
			data: { // 서버에 보낼 data
				id : selLecValue
				},
			dataType: 'json', // 서버로부터 받을 data 의 형식
			success: function(data) {
					console.log(data);
					// append 전 요소 내용 비우기
					ajaxAppend.textContent = "";
					// 강의의 날짜 list 정보 출력
					$.each(data, function(index, item) {
						// 출력 append str
						var appStr = 
									 '<tr onclick="showOrderDetail('+ index +')">'+
									 '<td scope="col" style="width: 16%">' + item.lec_date + 
									 '<input type="hidden" name="lec_orders_id" id="lec_orders_id' + index + '" value="' + item.lec_orders_id + '">'+ 
									 '</td>'+
									 '<td scope="col" style="width: 14%">' + item.lec_day + '</td>'+
									 '<td scope="col" style="width: 14%">' + item.lec_time + '</td>'; 
						// 신청한 적이 없는 경우 와 신청한 적이 있는 경우
						if(!item.lec_order_status || item.lec_order_status == "정상강의") {
							appStr += '<td scope="col" style="width: 14%">' + '정상강의' + '</td>'+
									  '<td scope="col" style="width: 14%">' + '-' + '</td>'+
									  '<td scope="col" style="width: 14%">' + '-' + '</td>'+
									  '<td scope="col" style="width: 14%">' + '-' + '</td>';
							
						} else {
							appStr += '<td scope="col" style="width: 14%">' + item.lec_order_status + '</td>'+
									  '<td scope="col" style="width: 14%">' + item.lec_order_date + '</td>'+
									  '<td scope="col" style="width: 14%">' + item.lec_order_time + '</td>'+
									  '<td scope="col" style="width: 14%">' + item.lec_order_building + ' ' + item.lec_order_room + '</td>';
						}
						appStr += '</tr>';
						$("#ajaxAppend").append(appStr);
					});
			},
			error: function() {
				alert('error');
			}
		});
	}

	// 휴/보강 내역 detail ajax
	function showOrderDetail(index) {
		const id = $("input#lec_orders_id" + index).val();
		
		$.ajax({
			type: "POST",
			url: "/professor/showOrderDetail",
			dataType: "json",
			data: {
				lecOrdersId: id
			},
			success: function(data) {
				$("#selectedLec").   val("선택된 강의 날짜 : " + data.lec_date);
				$("#detailId").      val(data.lec_orders_id);
				$("#reason").        val(data.lec_order_reason);
				$("#status").        val(data.lec_order_status);
				$("#lec_order_date").val(data.lec_order_date);
				$("#lecTime1").      val(data.lec_order_time);
				$("#lecHour1").      val(data.lec_order_hour);
				$("#lec_building").  val(data.lec_order_building);
				$("#lec_room").      val(data.lec_order_room);
			},
			error: function(e) {
				alert(e);
			}
		});
	}
	
	// 휴/보강 detail 정보 입력
	// lec_order_status (정상강의, 임시저장, 승인대기, 승인, 승인거부) : String(-2, -1, 0, 1, 2)
	// tempStatus (임시저장, 승인요청 , 요청취소) : (0, 1, -1)
	function updateOrders(tempStatus) {
		//강의 미선택 check
		if($("#status").val() == "강의미선택") {
			alert("강의를 선택해주세요");
			return;
		//미입력 값 여부 check
		} else if(!$("#reason").val()  
			   || !$("#lec_order_date").val()  
			   || !$("#lecTime1").val() 
			   || !$("#lecHour1").val()  
			   || !$("#lec_building").val() 
			   || !$("#lec_room").val()
			     ) {
			alert("모든 정보를 입력해주세요");
			return;
		//check 통과한 경우 update실행
		} else {
			var ordersDto = new Object();
			// tempStatus 임시저장 0 , 승인요청 1 구분
			ordersDto.lec_orders_id      = $("#detailId").val();
			ordersDto.lec_order_reason   = $("#reason").val();
			if(tempStatus == 0) {
				ordersDto.lec_order_status   = "-1";
			} else if(tempStatus == 1) {
				ordersDto.lec_order_status   = "0";
			}
			ordersDto.lec_order_date     = $("#lec_order_date").val();
			ordersDto.lec_order_time     = $("#lecTime1").val();
			ordersDto.lec_order_hour     = $("#lecHour1").val();
			ordersDto.lec_order_building = $("#lec_building").val();
			ordersDto.lec_order_room     = $("#lec_room").val();
			
			console.log(ordersDto);
			$.ajax({
				type: "POST",
				url: "/professor/updateOrders",
				data: JSON.stringify(ordersDto),
				contentType: "application/json",
				traditional: true,
				success: function(data) {
					if(data > 0) {
						alert("입력성공");
						$("#status").val("0");
						showOrdersList();
						// 임시저장 경우
						if(tempStatus == 0) {
							$("#status").val("임시저장");
						// 승인요청 경우
						} else {
							$("#status").val("승인요청");
						}
					} else {
						alert("입력실패");
					}
				},
				error: function() {
					alert("서버에러");
				}
			});
		}
		
	}
	
	function cancleOrders() {
		var ordersDto = new Object();
		ordersDto.lec_orders_id      = $("#detailId").val();
		ordersDto.lec_order_reason   = "";
		ordersDto.lec_order_status   = "-2";
		ordersDto.lec_order_date     = "";
		ordersDto.lec_order_time     = "";
		ordersDto.lec_order_hour     = "";
		ordersDto.lec_order_building = "";
		ordersDto.lec_order_room     = "";
		
		console.log(ordersDto);
		$.ajax({
			type: "POST",
			url: "/professor/updateOrders",
			data: JSON.stringify(ordersDto),
			contentType: "application/json",
			traditional: true,
			success: function(data) {
				if(data > 0) {
					alert("입력성공");
					$("#status").val("0");
					showOrdersList();
					$("#reason").        val("");
					$("#status").        val("정상강의");
					$("#lec_order_date").val("");
					$("#lecTime1").      val("");
					$("#lecHour1").      val("");
					$("#lec_building").  val("");
					$("#lec_room").      val("");
				} else {
					alert("입력실패");
				}
			},
			error: function() {
				alert("서버에러");
			}
		});
	}
	function setMinDate() {
		var today = new Date().toISOString().substring(0, 10);
		$("#lec_order_date").attr("min", today);
	}
	
</script>
<style>
</style>
	
</head>

<body class="" id="body-pd">

	<nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
			<a href="/" class="navbar-brand">
				<img class="img-fluid" src="/images/logo2.png" alt="logo2" style="height: 40px;">
				<use xlink:href="#bootstrap"></use>
			</a>

			<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">Features</a></rotli>
				<li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">About</a></li>
			</ul>
		</header>
	</nav>
	
	<!-- side nav bar -->
<div class="l-navbar" id="navbar">
	<nav class="navv">
		<div>
			<div class="nav__brand">
				<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
			</div>
			<div class="nav__list">
				<a href="#" class="nav__link active">
					<div style="width: 20px; height: 20px;">
						<i class="bi bi-mortarboard nav__icon "></i>
					</div>
					<span class="nav_name">학사관리</span>
				</a>
				<a href="#" class="nav__link">
					<div style="width: 20px; height: 20px;">
						<i class="bi bi-file-earmark-text nav__icon "></i>
					</div>
					<span class="nav_name">결재</span>
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

<!------- main content ------------>
<div class="container-fluid w-100 row" style=" background-color: rgb(214, 225, 237);">
	<!-- <div class="row"> -->

		<!-- content header -->
		<div class="col-12 p-4" style="height: 150px; background-color: rgb(95, 142, 241); vertical-align: middle;">
			<div class="d-flex flex-row" >
				<div class="text-white h4">안녕하세요. <b>${name }</b>님!</div>
					<span class="border border-1 border-white border-bottom rounded-pill text-white px-2 pt-1 pb-0 ms-2 me-3"
								style="font-size: 12px; height: 24px;">교수</span>
					<i class="text-white bi-gear-fill mx-2" style="height: 18px;"></i>
			</div>
			<div class="d-flex text-white" style="font-size: 14px;">${major} | ${position}</div>
			<div class="d-flex flex-low text-white" style="font-size: 14px;">
				<i class="bi bi-envelope-fill me-3 ml-0 "></i>${email }
			</div>
		</div>

	<!------------- card header  컨텐츠 폼------------->
		<main class="col-9 h-100 w-100">
			<div class="row m-5">
			<!------------- 컨텐츠 경로 ------------->
				<div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;">
					<i class="bi bi-bookmark-fill me-2"></i>학사관리 &gt; 강의정보 &gt; 휴 &middot; 보강신청</div>
				<!----- card content 내용 ------>
				<div class="col-12 rounded-bottom overflow-auto bg-white p-4" style="min-height: 550px;">
					<h2 class="fw-bold mb-3">휴 &middot; 보강신청</h2>
					<div class="container justify-content-center text-center">
						<div class="row">
							 <!-- 강의 목록 select box -->
	                        <select class="form-select w-25 mt-3" id="selLec" aria-label="Default select example" onchange="showOrdersList()">
								<c:forEach var="lecture" items="${lectureVOList }">
									<option value="${lecture.lec_id }">(${lecture.lec_typecode}${lecture.lec_id}) <b>${lecture.lec_name}</b>_${lecture.lec_type }</option>
								</c:forEach>
							</select>
						</div>
						<div class="row justify-content-center mt-3">
							<div class="col-12">
								<div class="text-start fw-bold h5 mb-3">강의일자</div>
								<div class="mt-2 mb-0" style="margin-right: 17px;">
									<table class="table table-bordered align-middle mb-0">
										<thead>
											<tr class="table-secondary align-middle">
												<th scope="col" rowspan="2" style="width: 16%">강의일자</th>
												<th scope="col" rowspan="2" style="width: 14%">요일</th>
												<th scope="col" rowspan="2" style="width: 14%">교시</th>
												<th scope="col" rowspan="2" style="width: 14%">진행상태</th>
												<th scope="col" colspan="3" style="width: 42%%">보강내용</th>
											</tr>
											<tr class="table-secondary align-middle">
												<th scope="col" style="width: 14%">예정일자</th>
												<th scope="col" style="width: 14%">예정교시</th>
												<th scope="col" style="width: 14%">강의실</th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="overflow-auto mt-0" style="height: 300px;">
									<table class="table table-bordered table-hover align-middle" id="ajaxAppend">
									</table>
								</div>
							</div>
						</div>
						<div class="row justify-content-center mt-3">
							<div class="col-8 d-flex flex-row">
								<div class="text-start fw-bold h5 me-3">휴/보강 내역</div>
								<input type="text" id="selectedLec" class="form-control form-control-sm border border-white" value="선택된 강의 없음" readonly style="height: 30px; width: 256px;">
								<input type="hidden" id="detailId" value="">
							</div>
							<div class="col-4 d-flex flex-row justify-content-end">
								<div class="btn btn-secondary" style="font-size: small; width: 78px;" onclick="updateOrders(0)">임시저장</div>
								<div class="btn btn-info ms-1" style="font-size: small; width: 78px;" onclick="updateOrders(1)">신청</div>
								<div class="btn btn-dark ms-1" style="font-size: small; width: 78px;" onclick="cancleOrders()">신청취소</div>
							</div>
						</div>
						<div class="row justify-content-center mt-2">
							<div class="col-9">
								<table class="table table-bordered">
									<tr class="align-middle">
										<th scope="col" class="table-secondary" style="width: 17%">
											휴강사유
										</th>
										<td>
											<input type="text" id="reason" class="form-control" placeholder="휴강 사유 입력란" value="">
										</td>
									</tr>
								</table>
							</div>
							<div class="col-3">
								<table class="table table-bordered">
									<tr class="align-middle">
										<th scope="col" class="table-secondary w-50" style="height: 55px;">
											진행상태
										</th>
										<td>
											<input type="text" class="form-control" id="status" value="강의미선택" readonly="readonly">
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="row justify-content-center">
							<div class="col-12">
								<table class="table table-bordered">
									<tr class="align-middle">
										<th scope="col" class="table-secondary border-bottom border-secondary border-opacity-25" style="width: 13%">
											보강예정일
										</th>
										<td scope="col" colspan="2" style="width: 30%">
											<input id="lec_order_date" name="lec_order_date" class="form-control form-control-sm text-start" type="date" min="" required="required">
										</td>
										<th scope="col" class="table-secondary border-bottom border-secondary border-opacity-25" style="width: 13%">
											보강예정교시
										</th>
										<td scope="col" class="d-flex flex-row">
											<select id="lecTime1" name="time1" class=" form-select form-select-sm">
												<option selected value="">시작선택</option>
												<option value="1">1교시 (09:00-09:50)</option>
												<option value="2">2교시 (10:00-10:50)</option>
												<option value="3">3교시 (11:00-11:50)</option>
												<option value="4">4교시 (12:00-12:50)</option>
												<option value="5">5교시 (13:00-13:50)</option>
												<option value="6">6교시 (14:00-14:50)</option>
												<option value="7">7교시 (15:00-15:50)</option>
												<option value="8">8교시 (16:00-16:50)</option>
												<option value="9">9교시 (17:00-17:50)</option>
											</select>
											<select id="lecHour1" name="hour1" class=" form-select form-select-sm ms-2">
												<option value="">시간선택</option>
												<option value="1">1시간</option>
												<option value="2">2시간</option>
												<option value="3">3시간</option>
											</select>
										</td>
										<!-- <td scope="col">
										</td> -->
									</tr>
									<tr class="align-middle">
										<th scope="col" class="table-secondary" style="width: 13%">
											보강예정강의실
										</th>
										<th scope="col" class="table-secondary" style="width: 13%">
											강의동
										</th>
										<td scope="col">
											<select id="lec_building" name="lec_building" class="form-select form-select-sm me-0 " style=" margin-right: 0;" required="required">
												<option selected value="중앙동 ">중앙동</option>
												<option value="정보동">정보동</option>
												<option value="종합강의동">종합강의동</option>
											</select>
										</td>
										<th scope="col" class="table-secondary" style="width: 13%">
											호실
										</th>
										<td scope="col" colspan="1" class="w-25">
											<select id="lec_room" name="lec_room" class="form-select form-select-sm me-0 " style="margin: 0;" required="required">
												<option selected value="101호 ">101호</option>
												<option value="102호">102호</option>
												<option value="103호">103호</option>
												<option value="201호">201호</option>
												<option value="202호">202호</option>
												<option value="203호">203호</option>
											</select>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
					
		<!-- footer -->
		<footer class="col-12" style="height: 60px; font-size: 12px;">
			@2022 ChoongAng University. All Rights Reserved.
		</footer>    
</div>

</body>
</html>