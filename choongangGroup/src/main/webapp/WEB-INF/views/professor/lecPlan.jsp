<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>강의계획서</title>
<script type="text/javascript">
	// 페이지 로드 완료되면 실행될 function
	document.addEventListener("DOMContentLoaded", function(){
		showLecList();
	});

    function showLecList() {
        var selYear  = document.getElementById("selYear");
        var selSeme  = document.getElementById("selSeme");
        var getProfName = document.getElementById("getProfName");
        selYearValue  = selYear.options[selYear.selectedIndex].value;
        selSemeValue  = selSeme.options[selSeme.selectedIndex].value;
        getProfNameValue = getProfName.value;
        console.log(selYearValue);
        console.log(selSemeValue);
        console.log(getProfNameValue);
        var ajaxAppend = document.getElementById("ajaxAppend");

        $.ajax({
            type: "POST",
			url: "/professor/lecList",
			data: { // 서버에 보낼 data
				year: selYearValue,
                semester: selSemeValue,
                profName: getProfNameValue
				},
			dataType: 'json', // 서버로부터 받을 data 의 형식
			success: function(data) {
					console.log(data);
					// append 전 요소 내용 비우기
					ajaxAppend.textContent = "";
					// 강의의 list 정보 출력
					$.each(data, function(index, item) {
                        var str = '<tr>' +
                                  '<td scope="col" style="width: 4%;">' + (index+1) + '</td>' + 
                                  '<td scope="col" style="width: 15%;">' + item.major_gubun + '</td>' + 
                                  '<td scope="col" style="width: 9%;">' + item.lec_typecode + item.lec_id + '</td>' + 
                                  '<td scope="col" style="width: 15%;">' + item.lec_name + '</td>' + 
                                  '<td scope="col" style="width: 9%;">' + item.lec_type + '</td>' + 
                                  '<td scope="col" style="width: 7%;">' + item.lec_unit_score + '</td>' + 
                                  '<td scope="col" style="width: 7%;">' + (item.lec_hour1+item.lec_hour2) + '</td>';
                        if(!item.lec_file_path) {
                            str += '<td scope="col" style="width: 9%;">' + "N" + '</td>';
                        } else {
                            str += '<td scope="col" style="width: 9%;">' + "Y" + '</td>';
                        }
                            str += '<td scope="col" style="width: 14%;">' + "^" + '</td></tr>';
                            $(ajaxAppend).append(str);
                    });
                },
                error: function() {
                    alert("서버에러");
                }
            
        });
    }
	
	
</script>
</head>

<body class="" id="body-pd">

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
                            <a href="#" class="collapse__sublink">Members</a>
                            <a href="#" class="collapse__sublink">Members</a>
                            <a href="#" class="collapse__sublink">Members</a>
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
                        <i class="bi bi-bookmark-fill me-2"></i>학사관리 &gt; 강의정보 &gt; 강의계획서
                    </div>
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                        <h2 class="fw-bold">강의계획서</h2>
                        <div class="container">
                            <div class="row d-flex flex-row">
                                <div col-3>
                                    강의조회
                                </div>
                                <div col-3>
                                    학년도
                                    <select name="year" id="selYear">
                                        <option value="2023">2023</option>
                                        <option value="2022">2022</option>
                                        <option value="2021">2021</option>
                                    </select>
                                </div>
                                <div col-3>
                                    학기
                                    <select name="year" id="selSeme">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                    </select>
                                </div>
                                <div>
                                    <button class="btn btn-secondary" onclick="showLecList()">검색</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12" style="padding-right: 18px;">
                                    <table class="table table-bordered mb-0">
                                        <thead class="table-secondary">
                                            <tr>
                                                <th style="width: 4%;">번호</th>
                                                <th style="width: 15%;">개설학과</th>
                                                <th style="width: 9%;">강의코드</th>
                                                <th style="width: 15%;">강의명</th>
                                                <th style="width: 9%;">이수구분</th>
                                                <th style="width: 7%;">학점</th>
                                                <th style="width: 7%;">시수</th>
                                                <th style="width: 9%;">강의계획서</th>
                                                <th style="width: 14%;">강의계획서 업로드</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </div>
                               
                                <div class="col-12" style="height: 200px; padding-right: 1px; overflow-y: scroll;">
									<table class="table table-bordered table-hover align-middle mt-0" id="ajaxAppend">
									</table>
								</div>
                            </div>
                            <div class="row">
                                <div class="col-3">강의계획서 작성</div>
                                <div class="col-12">
                                    <div class="row">
                                        <div class="col-3">교수정보</div>
                                        <div class="col-12">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th class="table-secondary">교수명</th>
                                                        <td>
                                                            <input class="form-control" type="text" id="profName" name="profName" value="" readonly>
                                                        </td>
                                                        <th class="table-secondary">학과</th>
                                                        <td>
                                                            <input class="form-control" type="text" id="major_gubun" name="major_gubun" value="" readonly>
                                                        </td>
                                                        <th class="table-secondary">Email</th>
                                                        <td>
                                                            <input class="form-control" type="email" id="email" name="email" value="" readonly>
                                                        </td>
                                                        <th class="table-secondary">H.P</th>
                                                        <td>
                                                            <input class="form-control" type="text" id="phone" name="phone" value="" readonly>
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <div class="col-3">
                                            교과목정보
                                        </div>
                                        <div class="col-12">
                                            <table class="table table-bordered w-25">
                                                <thead>
                                                    <tr>
                                                        <th class="table-secondary" style="width: 120px;">교과목명</th>
                                                        <td>
                                                            <input class="form-control" type="text" id="lec_name" name="lec_name" value="">
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <div class="col-12">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th class="table-secondary" style="width: 120px;">강좌목표</th>
                                                        <td>
                                                            <input class="form-control" type="text" id="plan_goal" name="plan_goal" value="">
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <div class="col-12">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th class="table-secondary" style="width: 120px;">평가기준</th>
                                                        <th class="table-secondary" style="width: 120px;">중간고사</th>
                                                        <td>
                                                            <input class="form-control" type="number" id="plan_midterm_ration" name="plan_midterm_ration" value="">
                                                        </td>
                                                        <th class="table-secondary" style="width: 120px;">기말고사</th>
                                                        <td>
                                                            <input class="form-control" type="number" id="plan_final_ratio" name="plan_final_ratio" value="" style="width: ;">
                                                        </td>
                                                        <th class="table-secondary" style="width: 120px;">과제</th>
                                                        <td>
                                                            <input class="form-control" type="number" id="plan_report_ratio" name="plan_report_ratio" value="">
                                                        </td>
                                                        <th class="table-secondary" style="width: 120px;">출석</th>
                                                        <td>
                                                            <input class="form-control" type="number" id="plan_attendance" name="plan_attendance" value="">
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <div class="col-12">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th class="table-secondary" style="width: 120px;">강의운영방법</th>
                                                        <td>
                                                            <input class="form-control" type="text" id="plan_way" name="plan_way" value="">
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <div class="col-3">교재정보</div>
                                        <div class="col-12">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th class="table-secondary">도서명</th>
                                                        <td>
                                                            <input class="form-control" type="text" id="profName" name="profName" value="" readonly>
                                                        </td>
                                                        <th class="table-secondary">저자</th>
                                                        <td>
                                                            <input class="form-control" type="text" id="major_gubun" name="major_gubun" value="" readonly>
                                                        </td>
                                                        <th class="table-secondary">출판사</th>
                                                        <td>
                                                            <input class="form-control" type="text" id="email" name="email" value="" readonly>
                                                        </td>
                                                        <th class="table-secondary">출판연도</th>
                                                        <td>
                                                            <input class="form-control" type="text" id="phone" name="phone" value="" readonly>
                                                        </td>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div>
                                        <div class="col-3">세부평가</div>
                                        <div class="col-12">
                                            <table class="table table-bordered">
                                                <thead>
                                                    <tr class="table-secondary">
                                                        <th>항목</th>
                                                        <th>내용</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>중간/기말</td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>과제</td>
                                                        <td></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-3">주차별수업계획</div>
                                        <div class="col-12">
                                            <table class="table table-bordered">
                                                <tr>
                                                    <th class="table-secondary" style="width: 100px;">1주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">2주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">3주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">4주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">5주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">6주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">7주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">8주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">9주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">10주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">11주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">12주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">13주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">14주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 
                                                <tr>
                                                    <th class="table-secondary style="width: 100px;">15주차</th>
                                                    <td>
                                                        <input class="form-control" type="text" id="" name="" >
                                                    </td>
                                                </tr> 

                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
					</div>
                    <div>
                        <input type="hidden" id="getProfName" name="getProfName" value="${profName}">
                    </div>
					<!-- Spring Security CSRF TOKEN(csrf옵션 disabled이므로 사용되지 않는 값들이다.) -->
					<div>
						<input type="hidden" id="page" name="page" value="0">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </div>
                    <div>
                    	
                    </div>
                    <!-- footer -->
                   	<footer class="col-12" style="height: 60px; font-size: 12px;">
						@2022 ChoongAng University. All Rights Reserved.
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