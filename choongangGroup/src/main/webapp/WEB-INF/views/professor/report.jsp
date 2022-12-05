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
    <title>과제관리</title>
<script type="text/javascript">
	// 페이지 로드 완료되면 실행될 function
	document.addEventListener("DOMContentLoaded", function(){
		showReport(0);
	});
	
	// 과제 list 요청 function(ajax)
	function showReport(pageNum) {
		var selLec = document.getElementById("selLec");
		var ajaxAppend = document.getElementById("ajaxAppend");
		var pageNation = document.getElementById("ajaxPagination");
		var ajaxTotalCount = document.getElementById("totalCount");
		var hiddenReportId = document.getElementById("hiddenReportId");
		//var page = document.getElementById("page");
		selLecValue = selLec.options[selLec.selectedIndex].value;
		// spring security CSRF TOKEN
		var token = $("input[name='_csrf']").val();
		var header = "X-CSRF-TOKEN";
		// 과제 list 요청 (page, totalPage, totalCount, 신청한 강의 table 정보(join report))
		$.ajax({
			type: "POST",
			url: "/professor/lecReportList",
			data: { // 서버에 보낼 data
				id : selLecValue, page : pageNum // pageNum 은 함수 showReport(parameter) 의 파라미터로 받음
				},
			dataType: 'json', // 서버로부터 받을 data 의 형식
			beforeSend : function(xhr)
			  {  
			 	 xhr.setRequestHeader(header, token);
			  },
			success: function(data) {
					console.log(data);
					// append 전 요소 내용 비우기
					ajaxAppend.textContent = "";
					ajaxTotalCount.textContent = "";
					// 해당 강의를 듣는 학생 count(ApplicationLec find by lecture_id)
					ajaxTotalCount.append(data.totalCount);
					//강의별 학생의 report list 정보 출력
					$.each(data.ALP, function(index, item) {
						// 목록 itemNumber 출력을 위한 값 setting
						var itemNumber = index + 1 + pageNum * data.pageSize;
						// 과제목록 출력 append str
						var appStr = '<tr>'+
									 '<td>' + itemNumber + '</td>'+
									 '<td><div class="form-check">';
						// report가 null인 경우 빈값 출력, 점수입력, checkbox disabled
						if(!item.report) {
							appStr += '<input class="form-check-input" type="checkbox" name="fileCheckBox" value="" id="check'+ index +'" disabled>'+
									  '<input type="hidden" id="hiddenReportId' + index + '" name="hiddenReportId" value="'+ '' +'">'+
						     		  '<label class="form-check-label" for="flexCheckDefault"></label></div></td>'+
							 		  '<td>' + item.member.userid + '</td>'+
							 		  '<td>' + item.member.name + '</td>'+
									  '<td>' + 'N' + '</td>'+
									  '<td style="min-width: 200px;">' + '-'+
									  '<input type="hidden" id="hiddenReportFile' + index + '" name="hiddenReportFile" value="'+ '' +'"></td>'+
									  '<td style="min-width: 140px;">' + '-' + '</td>'+
									  '<td><input id="score' + index + '" type="text" name="score" value="' + '' + '" disabled></td>'+
									  '<td><input id="grade' + index + '" type="text" name="grade" value="' + '' + '" disabled></td>'+
									  '</tr>';
						} else {
							appStr += '<input class="form-check-input" type="checkbox" name="fileCheckBox" value="' + item.report.filePath + '" id="check'+ index +'">' +
									  '<input type="hidden" id="hiddenReportId' + index + '" name="hiddenReportId" value="'+ item.report.id +'">'+
						     		  '<label class="form-check-label" for="flexCheckDefault"></label></div></td>'+
							 		  '<td>' + item.member.userid + '</td>'+
							 		  '<td>' + item.member.name + '</td>'+
									  '<td>' + item.report.whether + '</td>'+
									  '<td style="min-width: 200px;">' + item.report.fileName +
									  '<input type="hidden" id="hiddenReportFile' + index + '" name="hiddenReportFile" value="'+ item.report.filePath +'"></td>'+
									  '<td style="min-width: 140px;">' + item.report.submitDate + '</td>'+
									  '<td><input id="score' + index + '" type="text" name="score" value="'+item.report.score+'"></td>'+
									  '<td><input id="grade' + index + '" type="text" name="grade" value="'+item.report.grade+'"></td>'+
									  '</tr>';
						};
						$("#ajaxAppend").append(appStr);
					});
					
					//report 목록 페이지 네비게이션 출력
					$('input[name=page]').attr('value', data.page);
					pageNation.textContent = "";
					var str = '<nav aria-label="..."><ul class="pagination"><li class="page-item">';
					if(data.page > 0) {
						str += '<a class="page-link" onclick="showReport('+data.page+'-1)">이전</a>';
					} else if(data.page == 0) {
						str += '<a class="page-link">이전</a>'; 
					}
					str += '</li>'
					for (var i = 1; i < data.totalPage + 1; i++) {
						str += '<li id="page-item'+i+'" class="page-item" onclick="active('+i+')">'+
							   '<a class="page-link" onclick="showReport('+i+'-1)">'+i+'</a></li>';
					}
					str += '<li class="page-item">';
					if(data.page < data.totalPage - 1) {
						str += '<a class="page-link" onclick="showReport('+data.page+'+1)">다음</a>';
					}
					if(data.page > data.totalPage - 2) {
						str += '<a class="page-link">다음</a>'
					}
					str += '</li></ul></nav>';
					
					$("#ajaxPagination").append(str);
			},
			error: function() {
				alert('error');
			}
		});
	}
	
	// 과제 성적 입력 function(ajax) //입력값이 이전 정보와 동일한 경우 제외하는 logic 추가할것
	function submitScore() {
		var reportUpdateDtoList = [];
		var length = $("input[name=score]").length;
		console.log(length)
		for (var i = 0; i < length; i++) {
			if($("#hiddenReportId" + i).val() != "") {
				var reportUpdateDto = new Object();
				reportUpdateDto.id    = $("#hiddenReportId" + i).val();
				reportUpdateDto.score = $("#score" + i).val();
				reportUpdateDto.grade = $("#grade" + i).val();
				reportUpdateDtoList[i] = reportUpdateDto; 
				console.log(reportUpdateDto);
			}
		}
		console.log(reportUpdateDtoList);
		$.ajax({
			type: "POST",
			url: "/professor/updateReportScore",
			data: JSON.stringify(reportUpdateDtoList),
			contentType: "application/json",
			traditional: true,
			//dataType: 'json',
			success: function() {
				alert('입력완료');
			},
			error: function() {
				alert('error');
			}
		});
	}
	
	// 선택된 과제 다운로드 function
	function downloadFileSel() {
		var fileList = new Array();
		var filePath;
	    filePath = $('input:checkbox[name=fileCheckBox]:checked').val();
		console.log($('input:checkbox[name=fileCheckBox]:checked').val());
		var filePathSplit = filePath.split('_');
		console.log(filePathSplit);
		var fileName = filePathSplit[1];
		console.log(fileName);
		alert($('input:checkbox[name=fileCheckBox]:checked').length);
		//1개만 체크되어 있으면 file 1개 다운로드
		if($('input:checkbox[name=fileCheckBox]:checked').length == 1) {
			$.ajax({
				url:"/professor/downloadOneFile",
				data:{filePath: filePath
					  },
				dataType:'text',
				success:function(data) {
					downloadFile(filePath, fileName);
					window.location.reload();
				}
			});
		} else { // 2개 이상 체크되어 있으면 압축파일 생성 후 다운로드
			$('input:checkbox[name=fileCheckBox]').each(function (index) {
				if($(this).is(":checked") == true) {
			    	fileList.push($(this).val());
					console.log($(this).val());
			    }
			});
			console.log(fileList);
			$.ajax({
				type: "POST",
				url: "/professor/createZipSel",
				data:{
					"fileList": fileList
					},
				success: function(data) {
					downloadZipFile();
				},
				error: function() {
					alert("서버에러");
				}
			});
		}
	}
	
	// 전체내려받기 function
	function downloadFileAll() {
		var selLec = document.getElementById("selLec"); 
		selLecValue = selLec.options[selLec.selectedIndex].value; // select 에 선택된 강의 id
		$.ajax({
			type: "POST",
			url: "/professor/createZipAll/" + selLecValue,
			success: function() {
				downloadZipFile();
			},
			error: function() {
				alert("서버에러 zip file 생성 실패");
			}
		});
	}
	
	// zipFile 다운로드 function
	function downloadZipFile() {
		var downloadLink = document.createElement("a");
		downloadLink.href = '/professor/downloadZip'; // controller 에 download 요청
		downloadLink.download = "report.zip"; // client 에서 다운로드시 저장되는 파일 이름
		document.body.appendChild(downloadLink);
		downloadLink.click();
		document.body.removeChild(downloadLink);
	}
	
	//file 한개일 경우 파일다운로드 method
	function downloadFile(filePath, fileName) {
		var downloadLink = document.createElement("a");
		var url = '/professor/downloadOneFile?filePath=' + filePath;
		downloadLink.href = encodeURI(url); // controller 에 download 요청
		downloadLink.download = fileName; // client 에서 다운로드시 저장되는 파일 이름
		document.body.appendChild(downloadLink);
		downloadLink.click();
		document.body.removeChild(downloadLink);
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
                        <i class="bi bi-bookmark-fill me-2"></i>교수서비스 &gt; 학사관리 &gt; 강의관리 &gt; 과제관리
                    </div>
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                        <h2 class="fw-bold">과제관리</h2>
                        <!-- 강의 목록 select box -->
                        <select class="form-select w-25 mt-3" id="selLec" aria-label="Default select example" onchange="showReport(0)">
							<c:forEach var="lecture" items="${lectureList }">
								<option value="${lecture.id }">(${lecture.typeCode}${lecture.id}) <b>${lecture.name}</b> _${lecture.grade}학년</option>
							</c:forEach>
						</select>
						<!-- Buttons -->
						<div class="d-flex justify-content-end mb-2">
							<!-- 과제 성적 입력 button -->
							<div class="btn btn-danger mx-1" style="font-size: small; width: 104px;" onclick="submitScore()">점수등록</div>
						</div>
						<div class="d-flex justify-content-end">
							<!-- 해당 강의를 듣는 학생 count (ajax) -->
							<div class="me-auto">total : <span id="totalCount" class="text-danger">999</span></div>
							<div class="btn btn-primary mx-1" style="font-size: small;" onclick="downloadFileAll()">전체내려받기</div>
							<div class="btn btn-secondary mx-1" style="font-size: small;" onclick="downloadFileSel()">선택내려받기</div>
						</div>
						<!-- table -->
						<table class="table table-striped mt-2">
							<thead>
								<tr>
									<th>No</th>
									<th>선택</th>
									<th>학번</th>
									<th>제출자</th>
									<th>제출여부</th>
									<th>파일명</th>
									<th>제출일</th>
									<th>점수</th>
									<th>평가</th>
								</tr>
							</thead>
							<!-- 과제 목록 출력 부분 (ajax) -->
							<tbody id="ajaxAppend">
							</tbody>
						</table>
						<!-- 페이지 네비게이션 출력 부분 (ajax) -->
						<div class="d-flex justify-content-center " id="ajaxPagination">
						</div>
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