<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
function lecOrderDetail(id) {
	console.log("강의 클릭 ===> " + id);
	$.ajax({
		url 	: "lecOrderDetail",
		data	: {lec_orders_id : id},
		dataType: 'text',
		success	: function(data){
			console.log("성공===> " + data );
			var lec = JSON.parse(data);
			console.log("==>" + lec.lecname);
			document.getElementById("lecname").value=lec.lecname;
			document.getElementById("lec_order_room").value=lec.lec_order_room;
			document.getElementById("lec_order_building").value=lec.lec_order_building;
			document.getElementById("lec_order_time").value=lec.lec_order_time;
			document.getElementById("lec_order_reason").value=lec.lec_order_reason;
			document.getElementById("lec_order_hour").value=lec.lec_order_hour;
			document.getElementById("lec_order_status").value=lec.lec_order_status;
			document.getElementById("lec_orders_id").value=lec.lec_orders_id;
			document.getElementById("lec_order_date").value=lec.lec_order_date;
		

			let status = document.getElementById("lec_order_status").value;
			console.log(status);
			if(status > 0) {
				$("#lec_order_status").attr('disabled','disabled');
			} else {
				$("#lec_order_status").attr('disabled', false);
			}
		}
	});
	
}

function lecOrderUpdate(lecOrderFrm) {
	 if (confirm("휴/보강 승인 및 수정하시겠습니까?") == true) {
		 alert("수정되었습니다.");
		 lecOrderFrm.action = "lecOrderUpdate";
		 lecOrderFrm.submit();
		 return true;
	 }
	 else {
		 alert("취소되었습니다.")
		 return false;
	 }
}


	
	
</script>
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
<!------- main content ------------>
<div class="container-fluid w-100 row" style=" background-color: rgb(214, 225, 237);">
	<!-- <div class="row"> -->

		<!-- content header -->
		<jsp:include page="contentHeader.jsp"></jsp:include>
                    <!-- card header -->
				<div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;">
					<i class="bi bi-bookmark-fill me-2"></i>강의관리 &gt; 휴 &middot; 보강 관리 </div>
				<!----- card content 내용 ------>
				<div class="col-12 rounded-bottom overflow-auto bg-white p-4" style="min-height: 550px;">
				<div id="titleInBox" style="font-weight: bold; font-size: 19px;">휴/보강관리홈 <span onclick=" location.href = 'makeupManagement';" class="badge text-bg-secondary">전체조회</span></div>
					<div class="btnProcess" style="font-size: 12px; color: #7F7F7F;">승인 해야할 강의가 ${makeupTot }건 있습니다.</div>
					<div style="border-top: 1px dashed #c9c9c9; margin: 10px 0;"></div>
					<div class="containerBox" style="margin: 0">
						<form action="">
							<div class="mt-3">
								<input type="radio" name="status" value="0"  id="exampleCheck1" <c:if test="${status eq '0'}"> checked</c:if>>
								<label class="form-check-label font09" style="margin-right: 20px;">승인대기</label>
								<input type="radio" name="status" value="1"  id="exampleCheck2" <c:if test="${status eq '1'}"> checked</c:if>>
								<label class="form-check-label font09" style="margin-right: 20px;">승인</label>
								<input type="radio" name="status" value="2"  id="exampleCheck3" <c:if test="${status eq '2'}"> checked</c:if>>
								<label class="form-check-label font09">승인거부</label>
								
								<div class="input-group px-0 " style="width: 40%; float: right; margin-right: 200px;">
									<label class="form-label me-2 mb-0 align-self-center font09">강의명</label>
									<input class="form-control form-sm rounded-1" type="text" name="keyword"
											aria-describedby="button-search" style="height: 31px;"
											 <c:if test="${keyword ne null}"> value="${keyword}" </c:if>>
			
									<button class="btn btn-secondary btn-sm" id="button-search" type="submit">검색</button>
								</div>
							</div>
						</form>
					
						<div class="row mt-3">
							<div class="col-12">
								<div class="mt-2 mb-0" style="margin-right: 17px;">
									<div class="scroll_wrap" style="height: 400px; overflow: scroll;">
									<table class="table table-bordered mb-0 table-hover">
										<thead>
											<tr class="table-secondary align-middle">
												<th scope="col" rowspan="2" style="width: 4%">순번</th>
												<th scope="col" rowspan="2" style="width: 14%">강의일자</th>
												<th scope="col" rowspan="2" style="width: 14%">강의명</th>
												<th scope="col" rowspan="2" style="width: 14%">교시</th>
												<th scope="col" rowspan="2" style="width: 14%">진행상태</th>
												<th scope="col" colspan="4" style="width: 42%%">보강내용</th>
											</tr>
											<tr class="table-secondary align-middle">
												<th scope="col" style="width: 10%">예정일자</th>
												<th scope="col" style="width: 10%">예정교시</th>
												<th scope="col" style="width: 10%">강의동</th>
												<th scope="col" style="width: 10%">강의실</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="lec" items="${lecOrderList}">
											<c:set var="i" value="${i+1}"></c:set>
								    		<tr onclick="lecOrderDetail(${lec.lec_orders_id})">
								    			<td>${i}</td>
										     	<td scope="row">${lec.lec_date }</td>
										     	<td>${lec.lecname}</td>
										     	<td>${lec.lec_order_time}교시</td>
										     	<c:if test="${lec.lec_order_status eq '0' }">
										     		<td style="color: green; font-weight: bold;">승인대기</td>
										     	</c:if>
										     	<c:if test="${lec.lec_order_status eq '1' }">
										     		<td style="color: blue; font-weight: bold;">승인</td>
										     	</c:if>
										     	<c:if test="${lec.lec_order_status eq '2' }">
										     		<td style="color: red; font-weight: bold;">승인거부</td>
										     	</c:if>
										     	
										     	<td>${lec.lec_order_date}</td>
										     	<td>${lec.lec_order_time}교시</td>
										     	<td>${lec.lec_order_building}</td>
										     	<td>${lec.lec_order_room}</td>
								    		</tr>
											</c:forEach>
										</tbody>
									</table>
									</div>
								</div>
							</div>
						</div>
						<div class="row justify-content-center mt-3">
							<div id="titleInBox" style="font-weight: bold; font-size: 19px; margin-top: 20px;">휴/보강 상세정보</div>
							<div class="" style="font-size: 14px; color: #7F7F7F;">
								강의명 : <input type="text" id="lecname" value="" style="border: hidden;">
							</div>
							<div style="border-top: 1px dashed #c9c9c9; margin: 10px 0;"></div>
						</div>
						<form name="LecOrderFrm" id="LecOrderFrm" action="" method="post">
						<input type="hidden" id="lec_orders_id" name="lec_orders_id">
						<div class="row justify-content-center mt-2">
							<div class="col-9">
								<table class="table table-bordered">
									<tr class="align-middle">
										<th scope="col" class="table-secondary" style="width: 17%">
											휴강사유
										</th>
										<td>
											<input type="text" id="lec_order_reason" class="form-control" placeholder="휴강 사유 입력란" value="" readonly="readonly">
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
											<select id="lec_order_status" name="lec_order_status" class=" form-select form-select-sm">
												<option selected value="">선택</option>
												<option value="0">승인대기</option>
												<option value="1">승인</option>
												<option value="2">승인거부</option>
											</select>
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
											<select id="lec_order_time" name="lec_order_time" class=" form-select form-select-sm">
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
											<select id="lec_order_hour" name="lec_order_hour" class=" form-select form-select-sm ms-2">
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
											<select id="lec_order_building" name="lec_order_building" class="form-select form-select-sm me-0 " style=" margin-right: 0;" required="required">
												<option selected value="중앙동 ">중앙동</option>
												<option value="정보동">정보동</option>
												<option value="종합강의동">종합강의동</option>
											</select>
										</td>
										<th scope="col" class="table-secondary" style="width: 13%">
											호실
										</th>
										<td scope="col" colspan="1" class="w-25">
											<select id="lec_order_room" name="lec_order_room" class="form-select form-select-sm me-0 " style="margin: 0;" required="required">
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
								<div class="d-flex justify-content-center">
								<button type="button" id="btnUpdate" onclick="lecOrderUpdate(LecOrderFrm)" class="btn btn-primary btn-sm" style="font-weight: bold; margin-right: 10px;">승인/수정</button>
								</div>
							</div>
						</div>
						</form>
					</div>
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