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

<!--------- DATE PICKER --------->
 
<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
//강의 리스트 클릭시 강의 정보 띄우기
function lecUpdate(id) {
	var scAplus = 0;
	var scA = 0;
	var scBplus = 0;
	var scB = 0;
	var scCplus = 0;
	var scC = 0;
	var scDplus = 0;
	var scD = 0;
	var scF = 0;
	var studCnt = 0;
	
	$.ajax({
		url 	: "lecFindById",
		data	: {"id" : id},
		dataType: 'text',
		success	: function(data){
			var lec = JSON.parse(data);
			$('#lecId').val(id);
			$('#lecGrade').html(lec.grade);
			$('#lecTypeCode').html(lec.type);
			$('#lecUnitScore').html(lec.unitScore);
			$('#lecMajor').html(lec.major);
			
			$.ajax({
				url 	: "lecScoreForm",
				data	: {"id" : id},
				dataType: 'text',
				success	: function(data){
					
					
					var html = "<tbody>";
					if(data.length > 0){
						$('#scoreTable > tbody').empty();
						$.each(JSON.parse(data).memList, function(index, item){
							html += "<tr>";
							html += "<th scope='row' style='text-align: center; vertical-align: middle;'></th>";
						 	html += "<td style='text-align: center; vertical-align: middle;'>" + item.userid +"</td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>" + item.grade +"</td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>" + item.name +"</td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>" + item.major +"</td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>"; 
						 	html += "<input class='form-control onlynum' type='text' id='attendanceScore" + index + "' value='0'></td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>"; 
						 	html += "<input class='form-control onlynum' type='text' id='midtermScore" + index + "' value='0' ></td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>"; 
						 	html += "<input class='form-control onlynum' type='text' id='finalsScore" + index + "' value='0' ></td>"; 
						 	html += "<td style='text-align: center; vertical-align: middle;'>"; 
						 	html += "<input class='form-control onlynum' type='text' id='reportScore" + index + "' value='0' ></td>"; 
						 	
						 	html += "<td id='avgScore"+index +"' style='text-align: center; vertical-align: middle;'></td>"; 
						 	/* html += "<input class='form-control' type='text' id='avgScore" + index + "'></td>";  */
						 	
						 	
						 	html += "<td style='text-align: center; vertical-align: middle;'>"; 
						 	html += "<input class='form-control' type='text' id='totalScore" + index + "' ></td>"; 
						 	html += "<td id='scoreF" + index + "' class='px-2' style='text-align: center; vertical-align: middle;'>"; 
						 	/* html += "<input class='form-control text-danger' type='text' id='scoreF" + index + "'>";  */
						 	html += "<input type='hidden' id='scoreId" + index + "'></td>"; 
							
						 	html += "</tr>"; 
						 	studCnt++;
						});
						$('#scoreTable > thead').after(html); 
						$.each(JSON.parse(data).grList, function(index, item){
							if(item != null) {
							var avgSco = (Number(item.attendance)*0.2) + (Number(item.midterm)*0.3) 
							  + (Number(item.finals)*0.3) + (Number(item.report)*0.2);
								$('#attendanceScore' + index).val(item.attendance);
								$('#midtermScore' + index).val(item.midterm);
								$('#finalsScore' + index).val(item.finals);
								$('#reportScore' + index).val(item.report);
								$('#totalScore' + index).val(item.total);
								$('#avgScore' + index).append("<div class='fw-bold'>" + avgSco +"</div>");
								$('#scoreId' + index).val(item.id);
								if(item.total == "F"){
									/* $('#scoreF' + index).val("재수강"); */
									$('#scoreF' + index).append("<div class='text-danger'>재수강</div>");
								}
								switch(item.total) {
								case "A+" :
									scAplus++;
									break;
								case "A" :
									scA++;
									break;
								case "B+" :
									scBplus++;
									break;
								case "B" :
									scB++;
									break;
								case "C+" :
									scCplus++;
									break;
								case "C" :
									scC++;
									break;
								case "D+" :
									scDplus++;
									break;
								case "D" :
									scD++;
									break;
								case "F" :
									scF++;
									break;
								} //switch end
								
								
								
							}
						});
						$('#scoreCalTable > tbody').empty();
							
						var html2 = "<tbody>";
							html2 += "<tr>";
							html2 += "<th>배정인원</th>";
							html2 += "<td>" + scAplus + " 명</td>";
							html2 += "<td>" + scA + " 명</td>";
							html2 += "<td>" + scBplus + " 명</td>";
							html2 += "<td>" + scB + " 명</td>";
							html2 += "<td>" + scCplus + " 명</td>";
							html2 += "<td>" + scC + " 명</td>";
							html2 += "<td>" + scDplus + " 명</td>";
							html2 += "<td>" + scD + " 명</td>";
							html2 += "<td>" + scF + " 명</td>";
							html2 += "</tr>";  

							html2 += "<tr>";
							html2 += "<th>배정비율</th>";
							html2 += "<td>" + ((scAplus		/ studCnt) * 100) + " %</td>";
							html2 += "<td>" + ((scA 		/ studCnt) * 100) + " %</td>";
							html2 += "<td>" + ((scBplus 	/ studCnt) * 100) + " %</td>";
							html2 += "<td>" + ((scB 		/ studCnt) * 100) + " %</td>";
							html2 += "<td>" + ((scCplus 	/ studCnt) * 100) + " %</td>";
							html2 += "<td>" + ((scC 		/ studCnt) * 100) + " %</td>";
							html2 += "<td>" + ((scDplus		/ studCnt) * 100) + " %</td>";
							html2 += "<td>" + ((scD 		/ studCnt) * 100) + " %</td>";
							html2 += "<td>" + ((scF 		/ studCnt) * 100) + " %</td>";
							html2 += "</tr>";  
							html2 += "</tbody>";
							
							console.log("scAplus ===>" + scAplus);
							console.log("studCnt ===>" + studCnt);
							
							$('#scoreCalTable > thead').after(html2); 
					}   
					html += "</tbody>";
				}
			});
		}
	});
}

// 성적 넘기기
function lecScoreSave(){
	var inputData = [];
	$("#scoreTable > tbody tr" ).each(function(){
		inputData.push(
		{
			userid :	 $(this).find("td").eq(0).text(),
			attendance : $(this).find("td").eq(4).find("input").val(),
			midterm :	 $(this).find("td").eq(5).find("input").val(),
			finals : 	 $(this).find("td").eq(6).find("input").val(),
			report :	 $(this).find("td").eq(7).find("input").val(),
			id :	 	 $(this).find("td").eq(10).find("input[type=hidden]").val(),
			total : 	 ""
		});
	});
 	$.ajax({
 		method  : "post",
		url 	: "lecScoreSave",
		data	: {data  : JSON.stringify(inputData), 
				   lecId : $('#lecId').val()},
		dataType: 'json',
		traditional: true, //배열 넘길때 사용
		success	: function(data){
			console.log(data);
			 alert("성적이 저장되었습니다.");
			 lecUpdate($('#lecId').val());
		}
	}); 
}


// 숫자체크, 최대 100점 체크
$(document).ready(function(){
	$(document).on('propertychange change keyup paste input', '.onlynum', function() {
	    $(this).val($(this).val().replace(/[^0-9]/g, ""));
	    $(this).val(Number($(this).val()));
	    if(Number($(this).val()) > 100) {
	    	$(this).val(100);
	    }
	    if($(this).val() == "") {
	    	$(this).val(0);
	    }
	})
	
	$('#lecScoreCal').click(function(){
		var inputData = [];
		$("#scoreTable > tbody tr" ).each(function(){
			var sum   = (Number($(this).find("td").eq(4).find("input").val()) * 0.2) + 
						(Number($(this).find("td").eq(5).find("input").val()) * 0.3) +
						(Number($(this).find("td").eq(6).find("input").val()) * 0.3) + 
						(Number($(this).find("td").eq(7).find("input").val()) * 0.2);
			if((Number($(this).find("td").eq(4).find("input").val()) * 0.2) <= 4) {
				$(this).find("td").eq(9).find("input").val("F");
			} else {
				$(this).find("td").eq(9).find("input").val("");
			}
			
			inputData.push(
			{
				userid :	 $(this).find("td").eq(0).text(),
				attendance : $(this).find("td").eq(4).find("input").val(),
				midterm :	 $(this).find("td").eq(5).find("input").val(),
				finals : 	 $(this).find("td").eq(6).find("input").val(),
				report :	 $(this).find("td").eq(7).find("input").val(),
				id :	 	 $(this).find("td").eq(10).find("input[type=hidden]").val(), // grade id
				
				total : 	 sum
			});
			
			$(this).find("td").eq(8).find("input").val(sum);
			console.log("inputData = " + sum);
		});
		/* "location.href='scoreExcelDown?id=${lecture.id}'" */
	});
	$('#scoreExcelDown').click(function(){
		var id = $('#lecId').val();
		location.href="scoreExcelDown?id=" + id;
	});
	//성적마감버튼
	$('#lecScoreFinish').click(function(){
		$.ajax({
			url 	: "lecScoreFinish",
			data	: {id : $('#lecId').val()},
			dataType: 'text',
			success	: function(data){
				console.log(data);
				alert("성적이 마감이 완료 되었습니다.");
				window.location.reload();
			}
		});
	});
});


</script>
<style>

	table { 
		border-collapse: collapse; width: 100%;
	}
	/* td { 
	background: #fff; } */
	
	
	.tableFixHead {
	  overflow: auto;
	  height: 130px;
	}
	
	.tableFixHead thead th {
	  position: sticky;
	  top: 0;
	}
		
</style>
	
</head>

<body class="" id="body-pd">

	<nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light sticky-top position-fixed fixed-top w-100" style="position : absolute">
		<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between">
			<a href="/" class="navbar-brand">
				<img class="img-fluid" src="/images/logo2.png" alt="logo2" style="height: 40px;">
				<use xlink:href="#bootstrap"></use>
			</a>

			<!-- <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">Features</a></rotli>
				<li><a href="#" class="nav-link px-2 link-dark">Pricing</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">About</a></li>
			</ul> -->
		</header>
		<div class=" flex-row float-end ms-4" style="float: right;">
				<span class="text-primary h5" ><b>${name}</b>님</span>
				<i class="text-primary bi-gear-fill mx-2"></i>
				<span class="text-primary mx-3  font09">${major} | ${position} </span>
				<%-- <i class="bi bi-envelope-fill text-primary"></i>
				<span class="text-primary ms-2 font09">${email}</span>--%>			
		</div>
	</nav>
	
	<!-- side nav bar -->
   <div class="l-navbar" id="navbar">
      <nav class="navv">
         <div>
            <div class="nav__brand">
               <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
               <a href="#" class="nav__logo"></a>
            </div>
            <!-- <a href="/professor/calenderForm" class="nav__link active">
               <i class="bi bi-calendar-plus nav__icon" ></i>
               <span class="nav_name">캘린더</span>
            </a> -->
            
            <div class="nav__list">
               <a href="/notice/noticeList" class="nav__link">
                  <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
                  <span class="nav_name">공지사항</span>
               </a>
      
               <div href="#" class="nav__link collapses ">
                  <i class="bi bi-mortarboard-fill nav__icon"></i>
                  <span class="nav_name mt-1">학사관리</span>
                  <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                  <ul class="collapse__menu" style="width: 180px;">
                     <a href="#" class="collapse__sublink mt-2 mb-3" style="font-size: 0.85rem; display: block;">강의시간표</a>
                     <a href="/professor/lecMgMain?userid=${userid}" class="collapse__sublink mb-1" style="display: block;font-size: 0.85rem;">강의관리</a>
                     <a  class="collapse__sublink ms-3" style="font-size: 0.8rem; display: block;">전자출석부</a>
                     <a href="#" class="collapse__sublink ms-3 mb-3"  style="font-size: 0.8rem; display: block;">과제관리</a>
                     
                     <a href="#" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">강의계획서</a>
                     <a href="/professor/lecCreateList" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">강의개설</a>
                     <!-- <a href="#" class="collapse__sublink mb-1   " style="font-size: 0.875rem;">강의정보</a>
                     <a href="#" class="collapse__sublink ms-3"  style="font-size: 0.8rem;">강의계획서</a>
                     <a href="#" class="collapse__sublink ms-3 mb-2"  style="font-size: 0.8rem;">강의개설</a> -->
                     <a href="/professor/lecScore" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">성적관리</a>
                     <a href="#" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">휴&#183;보강 신청</a>
                     <a href="#" class="collapse__sublink" style="font-size: 0.85rem; display: block;">내선번호관리</a>
                  </ul>
               </div>
   
               <a href="#" class="nav__link">
                  <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                  <span class="nav_name">결재</span>
               </a>
               <a href="#" class="nav__link">
                  <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
                  <span class="nav_name">개인정보관리</span>
               </a>
            </div>
            <a href="/logout" class="nav__link">
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
	<%-- 	<div class="col-12 p-4" style="height: 150px; background-color: rgb(95, 142, 241); vertical-align: middle;">
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
		</div> --%>

		<!------------- card header  컨텐츠 폼------------->
		<main class="col-9 h-100 w-100">
			<div class="row m-5">
			<!------------- 컨텐츠 경로 ------------->
				<div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;">
					<i class="bi bi-bookmark-fill me-2"></i>성적관리
				</div>
				<!----- card content 내용 ------>
				<div class="col-12 rounded-bottom overflow-auto bg-white p-5" style="min-height: 550px;">
					<h2>성적관리</h2>
					<hr class="mb-5">
					
					<div class="row mb-2">
						<div class="col-md-5">
							<div class="fw-bold" style="font-size: 1.2em; display: inline;">강의 리스트</div>
							<div class="font08" style="display: inline; float: right;">총 <b>${lecCnt}</b> 건</div>
								
								<div class="mt-2" style="height: 300px;border: solid 1px #bdbebe;">
								
								<table class="table table-bordered table-hover table-sm font09" style="align:center;" id="lecTable">
									<thead class="table-secondary">
										<tr style="text-align: center;">
											<th scope="col" style="vertical-align: middle; width: 5%;">번호</th>
											<th scope="col" style="vertical-align: middle; width: 10%;">과목코드</th>
											<th scope="col" style="vertical-align: middle; width: 20%;">과목명</th>
											<th scope="col" style="vertical-align: middle; width: 8%;">성적입력</th>
										</tr>
									</thead>
									<tbody >
									<c:forEach var="lec" items="${lecList}">
										<c:set var="i" value="${i+1}"></c:set>
										<tr  onclick="lecUpdate(${lec.id})">
											<th class="text-center">${i}</th>
											<td class="text-center">${lec.typeCode}${lec.id}</td>
											<td class="text-center">${lec.name}</td>
										<c:choose>
											<c:when test="${lec.scoreStatus eq '0'}">
												<td class="text-center text-danger fw-bold">미입력</td>
											</c:when>
											<c:otherwise>
												<td class="text-center text-primary fw-bold">마감</td>
											</c:otherwise>
										</c:choose>
										</tr>
									</c:forEach>
									</tbody>
								</table>
								</div>
								
							</div>
						
						<div class="col-md-7">
						<div class="fw-bold" style="font-size: 1.2em;">성적입력정보</div>
							<div class="mt-2 p-4" style="height: 300px;border: solid 1px #bdbebe;">
					
						<div class="fw-bold item-start my-2" style="display: inline; float: left;">강의정보</div>
						
						<table class="table font08 text-center table-bordered">
							<tr>
								<th class="table-secondary text-center" scope="col" style="vertical-align:middle; width:15%;">이수구분</th>
								<td class="p-2" id="lecTypeCode">
								</td>
								<th class="table-secondary me-0" scope="col" style="vertical-align:middle; width:10%;">전공</th>
								<td id="lecMajor">
									
								</td>
								<th class="table-secondary me-0" scope="col" style="vertical-align:middle; width:10%;">학점</th>
								<td id="lecUnitScore">
									
								</td>
								<th class="table-secondary me-0" scope="col" style="vertical-align:middle; width:10%;">학년</th>
								<td id="lecGrade">
									
								</td>
							</tr>
						</table>
						
						<div class="fw-bold item-start my-2" style="display: inline; float: left;">성적등급 분포 현황</div>
						
						<table class="table table font08 text-center" id ="scoreCalTable"style="border-color: gray;">
							<thead class="table-active">
								<tr class="table-active">
									<th scope="col"></th>
									<th scope="col">A+</th>
									<th scope="col">A0</th>
									<th scope="col">B+</th>
									<th scope="col">B0</th>
									<th scope="col">C+</th>
									<th scope="col">C0</th>
									<th scope="col">D+</th>
									<th scope="col">D0</th>
									<th scope="col">F</th>
								</tr>
							</thead>
						</table>
					</div>	
				</div>
				
				<br>
				<div >
 				
				<div class="my-5"></div>
				
				<div class="mt-2 fw-bold" style="font-size: 1.2em; display: inline;">강의학생</div>
				<div class="mx-0 px-0" style="display: inline; float: right;">
					<button id="lecScoreSave" onclick="lecScoreSave()" type="button" style=" display: inline-block" class="btn btn-primary btn-sm  px-4"
							 > 임시저장 </button>
					<button id="lecScoreFinish" type="button" style=" display: inline-block" class="btn btn-danger btn-sm  px-4"
							> 성적마감 </button>
					<button id="lecScoreCal" type="button" style=" display: inline-block;" class="px-4 btn btn-dark btn-sm me-1"
							> 등급계산</button>
					<button id="scoreExcelDown" type="button" style=" display: inline-block;" class="px-4 btn btn-secondary btn-sm"
							>엑셀 다운로드</button>
							
				</div>
				<div class="my-3"></div>
				
				
				<input type="hidden" id="lecId" name="id">
				
				<table class="table font09 text-center" id="scoreTable">
					<thead class="table-secondary">
						<tr style="text-align: center;">
							<th scope="col" style="vertical-align: middle; width: 4%;">상태</th>
							<th scope="col" style="vertical-align: middle; width: 12%;">학번</th>
							<th scope="col" style="vertical-align: middle; width: 5%;">학년</th>
							<th scope="col" style="vertical-align: middle; width: 10%;">이름</th>
							<th scope="col" style="vertical-align: middle; width: 13%;">전공</th>
							
							<th scope="col" style="vertical-align: middle; width: 5%;">출결<span class="font08">(20%)</span></th>
							<th scope="col" style="vertical-align: middle; width: 5%;">중간<span class="font08">(30%)</span></th>
							<th scope="col" style="vertical-align: middle; width: 5%;">기말<span class="font08">(30%)</span></th>
							<th scope="col" style="vertical-align: middle; width: 5%;">과제<span class="font08">(20%)</span></th>
							<th scope="col" style="vertical-align: middle; width: 5%;">총점</th>
							<th scope="col" style="vertical-align: middle; width: 5%;">등급</th>
							<th class="px-1" scope="col" style="vertical-align: middle; width: 8%;">&nbsp; 재수강여부 &nbsp;</th>
						</tr>
					</thead>
					</table>
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