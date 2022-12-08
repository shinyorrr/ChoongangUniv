<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style type="text/css">
	
	.btnProcess {
		font-size: 12px;
		color: #7F7F7F;
	}
</style>
<script type="text/javascript">
	/* 년도 뿌리기 */
	$(document).ready(function(){
	    setDateBox();
		
	}); 

	 function setDateBox() {
		var dt = new Date();
		var year = "";
		var com_year = dt.getFullYear();
		for(var i = (com_year + 1); i >= (com_year - 10); i--) {
			$('#year').append("<option value='"+i+"'>"+i+"년"+"</option>");
		}
	}
	 

	 
	
	function lecDetail(id) {
		console.log("강의 클릭 ===> " + id);
		$.ajax({
			url 	: "lecDetail",
			data	: {lec_id : id},
			dataType: 'text',
			success	: function(data){
				console.log("성공===> " + data );
				var lec = JSON.parse(data);
				console.log("==>" + lec.lec_name);
				document.getElementById("lec_name").value=lec.lec_name;
				document.getElementById("lec_target_grade").value=lec.lec_target_grade;
				document.getElementById("lec_building").value=lec.lec_building;
				document.getElementById("lec_room").value=lec.lec_room;
				document.getElementById("lec_day1").value=lec.lec_day1;
				document.getElementById("lec_time1").value=lec.lec_time1;
				document.getElementById("lec_day2").value=lec.lec_day2;
				document.getElementById("lec_time2").value=lec.lec_time2;
				document.getElementById("lec_max_stud").value=lec.lec_max_stud;
				document.getElementById("lec_max_count").value=lec.lec_max_count;
				document.getElementById("lec_typecode").value=lec.lec_typecode;
				document.getElementById("lec_unit_score").value=lec.lec_unit_score;
				document.getElementById("lec_year").value=lec.lec_year;
				document.getElementById("lec_semester").value=lec.lec_semester;
				document.getElementById("major_gubun").value=lec.major_gubun;
				document.getElementById("lec_id").value=lec.lec_id;
				document.getElementById("lec_status").value=lec.lec_status;
				document.getElementById("lec_type").value=lec.lec_type;
				document.getElementById("prof_name").value=lec.prof_name;
				document.getElementById("lec_start").value=lec.lec_start;
			}
		});
	}
	
	function lecDelete() {
		var id = document.getElementById("lec_id").value;
		console.log("강의 삭제 ===> " + id);
		 if (confirm("강의를 삭제하시겠습니까?") == true) { 
			 $.ajax(
						{
							url : "lecDelete",
							data	: {lec_id : id},
							dataType: 'text',
							success	: function(data){
								console.log("성공===> " + data );
								if(data == '1'){
									alert("강의가 삭제되었습니다");
									location.replace("lecManagement");
								}
								else{
									alert("승인된 강의는 삭제할 수 없습니다.");
								} 
							}
						}
				);
		 } else {   //취소
		      return false;
		}
	}
	
	function lecUpdate() {
		 if (confirm("강의를 수정하시겠습니까?") == true) {
			 alert("수정되었습니다.");
			 document.lecFrm.submit();
			 return true;
		 }
		 else {
			 alert("취소되었습니다.")
			 return false;
		 }
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
                        <div id="titleInBox" style="font-weight: bold; font-size: 19px;">강의 전체 목록 <span onclick=" location.href = 'lecManagement';" class="badge text-bg-secondary">전체조회</span></div>
                        	<div class="btnProcess">승인 해야할 문서가 ${lecAgreeTot }건 있습니다.</div>
							<div style="border-top: 1px dashed #c9c9c9; margin-top: 10px;"></div>
							<!---------------- 강의 전체 목록 시작 -------------->
							<div id="containerBox">
							<form action="">
								<div class="mt-3">
								<label  class="me-2 pe-0 font09">년도/학기</label>
								<select class="form-select-sm" name="year" id="year" style="width: 13%;">
									<option value="" selected>선택</option>
								</select>
								<select class="ms-2 form-select-sm" style="width: 12%;" name="semester">
									<option value="" selected>선택</option>
									<option value="1" <c:if test="${semester eq '1'}">selected</c:if>>1</option>
									<option value="2" <c:if test="${semester eq '2'}">selected</c:if>>2</option>
								</select><span class="font09 ms-1" style=" margin-right: 20px;">학기</span>
								
							
								<input type="radio" name="status" value="1"  id="exampleCheck1" required="required" <c:if test="${status eq '1'}"> checked</c:if>>
								<label class="form-check-label font09" style="margin-right: 20px;">미승인</label>
								<input type="radio" name="status" value="0"  id="exampleCheck2" <c:if test="${status eq '0'}"> checked</c:if>>
								<label class="form-check-label font09">승인</label>
								
								<div class="input-group px-0 " style="width: 40%; float: right; margin-right: 200px;">
									<label class="form-label me-2 mb-0 align-self-center font09">강의명</label>
									<input class="form-control form-sm rounded-1" type="text" name="keyword"
											aria-describedby="button-search" style="height: 31px;"
											 <c:if test="${keyword ne null}"> value="${keyword}" </c:if>>
			
									<button class="btn btn-secondary btn-sm" id="button-search" type="submit">검색</button>
								</div>
								</div>
							</form>
							
							<div class="btnProcess" style="text-align: right;">총 강의 수 : ${lecTotal }개</div>
							<div class="scroll_wrap" style="height: 200px; overflow: scroll;">
							<table class="table table-hover" style="font-size: 14px; text-align: center; margin-top: 10px;">
								<thead class="table-secondary">
									<tr>
										<th>순번</th>
										<th>강의번호</th>
										<th>교수명</th>
										<th style="width: 40%;">강의명</th>
										<th>개설년도</th>
										<th>학기</th>
										<th>전공</th>
										<th>이수구분</th>
										<th>학점</th>
										<th>승인여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="lec" items="${lecList}">
									<c:set var="i" value="${i+1}"></c:set>
										<tr onclick="lecDetail(${lec.lec_id})">
											<td>${i}</td>
											<td>${lec.lec_id }</td>
											<td>${lec.prof_name }</td>
											<td>${lec.lec_name }</td>
											<td>${lec.lec_year }</td>
											<td>${lec.lec_semester }</td>
											<td>${lec.major_gubun }</td>
											<td>${lec.lec_type }</td>
											<td>${lec.lec_unit_score }</td>
											<c:if test="${lec.lec_status eq '1' }">
												<td style="color: red; font-weight: bold;">미승인</td>
											</c:if>
											<c:if test="${lec.lec_status eq '0' }">
												<td style="color: blue; font-weight: bold;">승인</td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
							
							<div id="titleInBox" style="font-weight: bold; font-size: 19px; margin-top: 30px;">강의 상세정보</div>
							<div style="border-top: 1px dashed #c9c9c9; margin: 10px 0;"></div>
							
							<form name="lecFrm" id="lecFrm" action="lecUpdate" method="post" onsubmit="return lecUpdate()">
								<input type="hidden" id="lec_id" name="lec_id">
								<input type="hidden" id="prof_name" name="prof_name">
								<input type="hidden" id="lec_type" name="lec_type">

								<table class="table font09 text-center">
									<tr>
										<th class="table-secondary text-center " scope="col" style="width: 9%; vertical-align:middle;">년도</th>
										<td class="p-2" style="width:16%;">
											<input class="form-control text-center mx-0 form-inline form-control-sm " type="text" placeholder="개설년도" 
													id="lec_year" name="lec_year" required="required">
										</td>
										<th class="table-secondary me-0" scope="col" style="vertical-align:middle; width: 9%;">학기</th>
										<td>
											<select id="lec_semester" name="lec_semester" class="form-select form-select-sm me-0" required="required">
												<option value="1" selected>1</option>
												<option value="2">2</option>
											</select>
										</td>
										<th class="table-secondary" scope="col" style="width: 9%; vertical-align:middle;">총시수</th>
										<td>
											<select id="lec_max_count" name="lec_max_count" class="form-select form-select-sm me-0" style="margin: 0;" required="required">
												<option value="14">14</option>
												<option selected value="15">15</option>
											</select>
										</td>
										<th class="table-secondary" scope="col" style="width: 9%; vertical-align:middle;">학점</th>
										<td>
											<select id="lec_unit_score" name="lec_unit_score" class="form-select form-select-sm me-0 " style="margin: 0;" required="required">
											<!-- <option selected value="1">1 학점</option> -->
											<option selected value="2">2 힉점</option>
											<option value="3">3 학점</option>
										</select>
										</td>
									</tr>
									
									
									<tr>
										<th class="table-secondary text-center" scope="col" style="width: 9%; vertical-align:middle;">이수구분</th>
										<td class="p-2">
											<select id="lec_typecode" name="lec_typecode" class="form-select form-select-sm me-0 " style="margin-left: 0;" required="required">
												<option value="" selected>선택</option>
												<option value="M">전필</option>
												<option value="S">전선</option>
												<option value="C">교양</option>
											</select>
										</td>
										<th class="table-secondary me-0" scope="col" style="vertical-align:middle; width: 9%;">전공</th>
										<td>
											<select id="major_gubun" name="major_gubun" class="form-select form-select-sm " style="margin: 0;" required="required">
												<option value="공통" selected>공통</option>
												<option value="컴퓨터공학과">컴퓨터공학과</option>
												<option value="AI학과">AI학과</option>
												<option value="경영학과">경영학과</option>
										</select>
										</td>
										<th class="table-secondary" scope="col" style="width: 9%; vertical-align:middle;">대상학년</th>
										<td  style="width:16%;">
											<select id="lec_target_grade" name="lec_target_grade" class="form-select form-select-sm me-0 " style="margin: 0;" required="required">
												<option selected value="1">1 학년</option>
												<option value="2">2 학년</option>
												<option value="3">3 학년</option>
												<option value="4">4 학년</option>
											</select>
										</td>
										<th class="table-secondary" scope="col" style="width: 9%; vertical-align:middle;">수강인원</th>
										<td>
											<input id="lec_max_stud" name="lec_max_stud" class="form-control form-control-sm text-start" type="text" required="required">
										</td>
									</tr>
					
									
									<tr>
										<th class="table-secondary text-center" scope="col" style="width: 9%; vertical-align:middle;">강의명</th>
										<td colspan="3" class="p-2" style="width:16%;">
											<input id="lec_name" name="lec_name" class="form-control form-control-sm text-start " 
												type="text" placeholder="강의명을 입력해주세요" required="required">
										</td>
										<th class="table-secondary me-0" scope="col" style="vertical-align:middle;">건물명</th>
										<td>
											<select id="lec_building" name="lec_building" class="form-select form-select-sm me-0 " style=" margin-right: 0;" required="required">
												<option selected value="중앙동 ">중앙동</option>
												<option value="정보동">정보동</option>
												<option value="종합강의동">종합강의동</option>
											</select>
										</td>
										<th class="table-secondary" scope="col" style="width: 9%; vertical-align:middle;">호수</th>
										<td>
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
									
									
									<table class="table font09 text-center">
										<tr>
										<th class="table-secondary text-center" scope="col" style="width: 9%; vertical-align:middle;">강의일1</th>
										<td class="p-2">
											<select id="lec_day1" name="lec_day1" class="form-select form-select-sm me-0 " style="margin: 0;" required="required">
												<option value="" selected>선택</option>
												<option value="월">월요일</option>
												<option value="화">화요일</option>
												<option value="수">수요일</option>
												<option value="목">목요일</option>
												<option value="금">금요일</option>
										</select>
										</td>
										<th class="table-secondary me-0" scope="col" style="vertical-align:middle;width: 9%;">강의시간1</th>
										<td style="width: 18%; margin-right: 0;">
											<select id="lec_time1" name="lec_time1" class=" form-select form-select-sm" required="required">
												<option selected value="">선택</option>
												<option value="1교시">1교시 (09:00-09:50)</option>
												<option value="2교시">2교시 (10:00-10:50)</option>
												<option value="3교시">3교시 (11:00-11:50)</option>
												<option value="4교시">4교시 (12:00-12:50)</option>
												<option value="5교시">5교시 (13:00-13:50)</option>
												<option value="6교시">6교시 (14:00-14:50)</option>
												<option value="7교시">7교시 (15:00-15:50)</option>
												<option value="8교시">8교시 (16:00-16:50)</option>
												<option value="9교시">9교시 (17:00-17:50)</option>
											</select>
										</td>
										<th class="table-secondary text-center" scope="col" style="width: 9%; vertical-align:middle;">강의일2</th>
										<td class="p-2">
											<select id="lec_day2" name="lec_day2" class="form-select form-select-sm me-0 " style="margin: 0;" required="required">
												<option value="" selected>선택</option>
												<option value="월">월요일</option>
												<option value="화">화요일</option>
												<option value="수">수요일</option>
												<option value="목">목요일</option>
												<option value="금">금요일</option>
											</select>
										</td>
										<th class="table-secondary me-0" scope="col" style="vertical-align:middle; width: 9%;">강의시간2</th>
										<td style="width: 18%; margin-right: 0;">
											<select id="lec_time2" name="lec_time2" class=" form-select form-select-sm" required="required">
												<option selected value="">선택</option>
												<option value="1교시">1교시 (09:00-09:50)</option>
												<option value="2교시">2교시 (10:00-10:50)</option>
												<option value="3교시">3교시 (11:00-11:50)</option>
												<option value="4교시">4교시 (12:00-12:50)</option>
												<option value="5교시">5교시 (13:00-13:50)</option>
												<option value="6교시">6교시 (14:00-14:50)</option>
												<option value="7교시">7교시 (15:00-15:50)</option>
												<option value="8교시">8교시 (16:00-16:50)</option>
												<option value="9교시">9교시 (17:00-17:50)</option>
											</select>
										</td>
									</tr>
								</table>
								
								<table class="table font09 text-center">
									<tr>
										<th class="table-secondary text-center" scope="col" style="width: 9%; vertical-align:middle;">승인여부</th>
										<td class="p-2">
											<select id="lec_status" name="lec_status" class="form-select form-select-sm me-0 " style="margin: 0;" required="required">
												<option value="" selected>선택</option>
												<option value="1">미승인</option>
												<option value="0">승인</option>
										</select>
										</td>
										
										<th class="table-secondary" scope="col" style="width: 9%; vertical-align:middle;">개강일</th>
										<td>
											<input id="lec_start" name="lec_start" class="form-control form-control-sm text-start" type="date" required="required">
										</td>
									</tr>
								</table>
								<div class="d-flex justify-content-center">
									<button type="button" id="btnUpdate" onclick="lecUpdate()" class="btn btn-primary btn-sm" style="font-weight: bold; margin-right: 10px;">수정/승인</button>
									<button type="button" onclick="lecDelete()" class="btn btn-secondary btn-sm" style="font-weight: bold;">삭제</button>
								</div>
								</form>
							</div>
						</div>
                    </div>
                   </main>
                    <!-- footer -->
                    <footer class="col-12" style="height: 60px;">
                        footer
                    </footer>    
                </div>
        </div>
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="/js/main.js"></script>
</body>
</html>