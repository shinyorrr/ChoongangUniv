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
<title>새결재홈</title>
<style type="text/css">
	.docListTitle {
		margin-top: 10px;
		color: #7F7F7F;
	}
	.btn-info {
		border-radius: 3px;
		background-color: #0c5df4;
		border : 0;
		color: white;
		--bs-btn-hover-bg: #dddddd;
		--bs-btn-hover-border-color: none;
		--bs-btn-active-bg: #dddddd;
		--bs-btn-active-border-color: none;
		margin-bottom: 20px;
	}
	
	.tblElecApprLine th {
		background-color: #dddddd;
	}
	.tblElecApprLine {
		border: 1px solid #c9c9c9;
	}
	
	.docHeader {
		margin-top: 10px;
	}
	
	.tblElecApprLine button {
		margin: 0px;
	}
</style>

<script type="text/javascript">
	/* 기안일 구하기 */
	window.onload = function() {
		var date = new Date();
		var Year = date.getFullYear();
		var Month = "-" + (date.getMonth()+1);
		var Day = "-" + date.getDate();
		
		if(Month.length < 2 ) Month = "0" + Month;
		if(Day.length < 2 ) Day = "0" + Day;
		
		var Today = Year.toString() + Month + Day;
		document.getElementById("date").value = Today;
		$('input[name=writeday]').attr('value',Today);
		
	}
	
	
	
	// 문서 종류 선택
	function sortSelect() {
		var str = "";
		var str2 = "";
		$.ajax(
				{
					url:"sortList",
					dataType:'json',
					success:function(data){
						$(data).each(
							function(){
								str2 = "<option value='"+this.approval_sort_no+"'>"+this.approval_sort_name+"</option>";
								str += str2;
							}
						)
						$('#approvalSort').append(str);
					}
				}	
		);
	}
	
	$(document).ready(function() {
		
		// 문서양식 텍스트로 전달
		$("#approvalSort").change(function(){
			var option = "";
			option = $("#approvalSort option:selected").text();
			$("#selectSort").attr('value',option);
			}
				
		);
		
		// 중간 결재자
		$("#exampleModal").ready(function()	{
			$.ajax(
					{
						url:"apprList",
						dataType:'json',
						success:function(data){
							var html = "";
							if(data.length > 0){
								$.each(data, function(index, item){
								   html += "<tr>";
								   html += "<td style='width: 40px; height: 10px; padding-left:2px;'> ";
								   html += "<input type='radio' name='radioBox' class='"+ index + "' value='"+item.userid+','+item.name+','+item.dname+"' required='required'>";
		                           html += "</td>";
		                           html += "<td style='width: 80px; height: 10px; padding-left:2px;' class='mem_userid'>";
		                           html += item.userid;
		                           html += "</td>";
		                           html += "<td style='width: 80px; height: 10px; padding-left:2px;' class='mem_name'>";
		                           html += item.name;
		                           html += "</td>";
		                           html += "<td style='width: 80px; height: 10px; padding-left:2px;' class='mem_dname'>";
		                           html += item.dname;
		                           html += "</td>";
		                           html += "</tr>";  
								});
								
								$("tbody#MidApprList").html(html);
							}
							
							
						}
					
					
					}
			
				);
			
			
			}
				
		
		);
		
		// 최종결재자
		$("#exampleModal2").ready(function()	{
			$.ajax(
					{
						url:"apprList",
						dataType:'json',
						success:function(data){
							var html = "";
							if(data.length > 0){
								$.each(data, function(index, item){
								   html += "<tr>";
								   html += "<td style='width: 40px; height: 10px; padding-left:2px;'> ";
								   html += "<input type='radio' name='radioBox2' class='"+ index + "' value='"+item.userid+','+item.name+','+item.dname+"'>";
		                           html += "</td>";
		                           html += "<td style='width: 80px; height: 10px; padding-left:2px;' class='mem_userid'>";
		                           html += item.userid;
		                           html += "</td>";
		                           html += "<td style='width: 80px; height: 10px; padding-left:2px;' class='mem_name'>";
		                           html += item.name;
		                           html += "</td>";
		                           html += "<td style='width: 80px; height: 10px; padding-left:2px;' class='mem_dname'>";
		                           html += item.dname;
		                           html += "</td>";
		                           html += "</tr>";  
								});
								
								$("tbody#FinApprList").html(html);
							}
							
							
						}
					
					
					}
			
				);
			
			
			}
				
		
		);
		

	});
	
	// 중간 결재자 정보 넣기
	function findMidOk() {
		var midInfo = $('input:radio[name="radioBox"]:checked').val();
		var finInfo = $('input:radio[name="radioBox2"]:checked').val();
		
		if(finInfo == null) {
			var userid = midInfo.split(',')[0];
			var name   = midInfo.split(',')[1];
			var dname  = midInfo.split(',')[2];
			
			console.log("사번 : "+userid);
			console.log("이름 : "+name);
			console.log("부서 : "+dname);
			
			$('input[name=mid_approver]').attr('value', userid);
			$('input[name=mid_approver_name]').attr('value', name);
			$('input[name=mid_approver_dname]').attr('value', dname);
			
			$('#exampleModal').modal('hide');
		} else if(midInfo != null && finInfo != null) {
			if(midInfo == finInfo) {
				alert("이미 선택된 결재자입니다.");
				return false;
			}
		}
	}
	
	// 최종 결재자 정보 넣기
	function findFinOk() {
		var midInfo = $('input:radio[name="radioBox"]:checked').val();		
		var finInfo = $('input:radio[name="radioBox2"]:checked').val();
		
		if(midInfo == finInfo){
			alert("이미 선택된 결재자입니다.");
			$('input:radio[name="radioBox2"]').prop('checked',false);
			return false;
		} else if(midInfo == null) {
			alert("중간 결재자를 먼저 선택해주세요");
			$('input:radio[name="radioBox2"]').prop('checked',false);
			return false;
		} else {
			var userid = finInfo.split(',')[0];
			var name   = finInfo.split(',')[1];
			var dname  = finInfo.split(',')[2];
			
			console.log("사번 : "+userid);
			console.log("이름 : "+name);
			console.log("부서 : "+dname);
			
			$('input[name=fin_approver]').attr('value', userid);
			$('input[name=fin_approver_name]').attr('value', name);
			$('input[name=fin_approver_dname]').attr('value', dname);
			
			$('#exampleModal2').modal('hide');
		}
		
		
	}
	
	// 결재 시작일 종료일 지정
	function getStartDate()  {
		const approval_start = document.getElementById('approval_start').value;
	 	document.getElementById('approval_end').setAttribute("min", approval_start);
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
                        <i class="bi bi-bookmark-fill me-2"></i>전자결재 <i class="bi bi-chevron-right"></i>새 결재 홈
                    </div>
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                        <div id="titleInBox" style="font-weight: bold; font-size: 19px;">새 결재 홈</div>
							<div style="border-top: 1px dashed #c9c9c9; margin-top: 10px;"></div>
							<div id="containerBox">
							
								<form action="approvalSave" name="addFrm" enctype="multipart/form-data" method="post">
								<!--===================================== 문서선택  ======================================-->
								<!-- 사용자 아이디값 가져오기 -->
								<input type="hidden" name="userid" id="userid" value="${userid}">
								<div class="ApprListTitle">기본설정</div>
								<div style="display: inline-block; width: 100%">
								<div style="float: left; width: 45%">
									<table class="table table-bordered table-responsive" style="width: 500px; margin-top : 10px; border-collapse: collapse !important; color: black; background: white; font-size: 12px;">
										<tr>
											<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">문서종류</th>
											<td style="width: 40%;">
												<div>
													<!-- onclick 시 무한 생성 방지 -> this.onlcick='' -->
													<select name="approval_sort_no" id="approvalSort" onclick="sortSelect(); this.onclick='';" class="form-select" aria-label="Default select example" style="width: 100%;" required="required">
														<option value="" selected>문서선택</option>
													</select>
													<!-- <input type="hidden" id="approvalSort" name="approvalSort" /> -->
												</div>
											</td>
										</tr>
									</table>
								</div>
								
								<!--===================================== 기안자 선택 ======================================-->
								<div style="float: right; width: 45%">
									<table class="table table-bordered table-responsive" style="width: 500px; margin-top : 10px; border-collapse: collapse !important; color: black; background: white; font-size: 12px;">
										<tr>
											<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">기안자</th>
											<td style="width: 40%;">
												${mem_name}
											</td>
										</tr>
									</table>
								</div>
								</div>
								
								<!--===================================== 조직도 검색 ======================================-->
								<div class="ApprListTitle">결재선 지정</div>
								
								<div class="table-responsive">
								  <table class="table table-bordered tblElecApprLine">
								  	<tbody>
								  		<tr class="tblElecApprLine">
								  			<th style="width: 22%">구분</th>
								  			<th>
									  			<div>
													<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#exampleModal">중간결재자 선택</button>
												</div>
											</th>
								  			<th>
								  				<div>
													<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#exampleModal2" >최종결재자 선택</button>
												</div>
								  			</th>
								  		</tr>
								  		<tr class="tblElecApprLine">
								  			<th style="width: 22%">이름</th>
								  			<td>
								  				<input type="text" name="mid_approver_name" id="mid_approver_name" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: 1px solid #adb5bd;" readonly="readonly">
								  			</td>
								  			<td>
								  				<input type="text" name="fin_approver_name" id="fin_approver_name" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: 1px solid #adb5bd;" readonly="readonly">
								  			</td>
								  		</tr>
								  		<tr class="tblElecApprLine">
								  			<th style="width: 22%">사번</th>
								  			<td>
								  				<input type="text" name="mid_approver" id="mid_approver" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: 1px solid #adb5bd;" readonly="readonly">
								  			</td>
								  			<td>
								  				<input type="text" name="fin_approver" id="fin_approver" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: 1px solid #adb5bd;" readonly="readonly">
								  			</td>
								  		</tr>
								  		<tr class="tblElecApprLine">
								  			<th style="width: 22%">직급</th>
								  			<td>
								  				<input type="text" name="mid_approver_dname" id="mid_approver" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: 1px solid #adb5bd;" readonly="readonly">
								  			</td>
								  			<td>
								  				<input type="text" name="fin_approver_dname" id="fin_approver_dname" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: 1px solid #adb5bd;" readonly="readonly">
								  			</td>
								  		</tr>
								  	</tbody>
								  </table>
								  <%-- 모달창에서 받은 사번이 들어옴 --%>
									<input type="hidden" name="mid_approver_no" id="mid_approver_no" style="width:50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: 1px solid #adb5bd; " />
									<input type="hidden" name="fin_approver_no" id="fin_approver_no" style="width:50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: 1px solid #adb5bd; " />
								</div>
								
								
								<!--===================================== 문서 시작 ======================================-->
								<div class="ApprListTitle2">상세입력</div>
								<div class="docHeader">
									<div class="table-responsive">
									  <table class="table table-bordered">
									    <tbody>
									    	<tr>
												<td>
													<input type="text" id="selectSort" name="selectSort" value="" style="border: none;" readonly="readonly">
												</td>
											</tr>
									    	<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">부서</th>
												<td>
													${dname}
												</td>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">기안일</th>
												<td>
													<input type="text" id="date" name="writeday" value="" style="border: none;">
												</td>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">문서번호</th>
												<td>
													자동설정
												</td>
											</tr>
									    	<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">제목</th>
												<td colspan="5">
													<input type="text" name="title" id="title" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none;" required="required">
												</td>
											</tr>
											<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">연차신청기간</th>
												<td colspan="5">
													<input type="date" name="approval_start" id="approval_start" style="width: 20%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none; float: left" oninput="getStartDate()" required="required">
													<i class="bi bi-dash" style="float: left"></i>
													<input type="date" name="approval_end" id="approval_end" style="width: 20%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none; float: left" required="required">
												</td>
											</tr>
											<tr>
												<td colspan="6">
													<div class="mb-3">
														<textarea name="approval_content" class="form-control" id="exampleFormControlTextarea1" maxlength="200" placeholder="상세 내용을 입력하세요" rows="3" required="required"></textarea>
													</div>
												</td>
											</tr>
											<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">파일선택</th>
												<td colspan="5">
													<input type="text" name="file_path" id="file_path" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none;" required="required">
												</td>
											</tr>
									    </tbody>
									  </table>
									</div>
								</div>
								
								<!--======================== 결재완료/취소 =======================-->
								<div>
									<button type="submit" class="btn btn-primary btn-sm">상신</button>
									<button type="button" class="btn btn-secondary btn-sm" onclick="javascript:history.back()">취소</button>				
								</div>
								</form>
							</div>
						</div>
						
						
						<!-- ==============조직도 중간 결재자 검색 모달창============== -->
						<!-- Vertically centered modal -->
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h1 class="modal-title fs-5" id="exampleModalLabel">중간결재자 선택</h1>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						       <!--  사원리스트 불러오기 -->
						        <div>
						        	<!-- 사원검색 -->
						        	<div>
						        		<form class="mid_search" action="midApprSearch" method="get">
						        			<select class="form-select" aria-label="Default select example" name="search" style="width: 20%; display: inline-block;">
											  <option selected>선택</option>
											  <option value="s_dname">부서조회</option>
											  <option value="s_name">이름조회</option>
											</select>
						        			<input id="searchWord" class="search" type="text" placeholder="이름, 부서" name="keyWord" style="height: 30px;">
						        			<button type="button" onclick="getMidList();" class="btn btn-info btnSearch" style="border-radius: 3px; color: white; margin: 0px;">검색</button>   
						        		</form>
						        	</div>
						        	
						        	<div class="scroll_wrap" style="height: 360px; overflow: scroll">
						        		<table class="table table-striped" style="width: 400px; height: 366px; border: 0px; overflow-y: auto;">
						        			<thead style="padding: 0;">
						        				<tr style="text-align: left; font-weight: normal;">
						        					<th style="padding-left: 2px">
						        						&nbsp;
						        					</th>
						        					 <th style="padding-left:2px;">이름</th>
						        					 <th style="padding-left:2px;">사번</th>
					                                 <th style="padding-left:2px;">부서</th>
						        				</tr>
						        			</thead>
						        			<tbody id="MidApprList">
						        				
						        			</tbody>
						        		</table>
						        	</div>
						        </div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="$('#exampleModal').modal('hide');">취소</button>
						        <button type="button" class="btn btn-primary" onclick="findMidOk()">저장</button>
						      </div>
						    </div>
						  </div>
						</div>
						
						<!-- ==============조직도 최종 결재자 모달창============== -->
						<!-- Vertically centered modal -->
						<!-- Modal -->
						<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h1 class="modal-title fs-5" id="exampleModalLabel">최종결재자 선택</h1>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <!-- 사원리스트 불러오기 -->
						        <div>
						        	<!-- 사원검색 -->
						        	<div>
						        		<form class="mid_search" action="midApprSearch" method="get">
						        			<select class="form-select" aria-label="Default select example" name="search" style="width: 20%; display: inline-block;">
											  <option selected>선택</option>
											  <option value="s_dname">부서조회</option>
											  <option value="s_name">이름조회</option>
											</select>
						        			<input id="searchWord" class="search" type="text" placeholder="이름, 부서" name="keyWord" style="height: 30px;">
						        			<button type="button" onclick="getFinList();" class="btn btn-info btnSearch" style="border-radius: 3px; color: white; margin: 0px;">검색</button>   
						        		</form>
						        	</div>
						        	
						        	<div class="scroll_wrap" style="height: 360px;">
						        		<table class="table table-striped" style="width: 400px; height: 366px; border: 0px; overflow-y: auto;">
						        			<thead style="padding: 0;">
						        				<tr style="text-align: left; font-weight: normal;">
						        					<th style="padding-left: 2px">
						        						&nbsp;
						        					</th>
						        					 <th style="padding-left:2px;">이름</th>
						        					 <th style="padding-left:2px;">사번</th>
					                                 <th style="padding-left:2px;">부서</th>
						        				</tr>
						        			</thead>
						        			<tbody id="FinApprList">
						        				
						        			</tbody>
						        		</table>
						        	</div>
						        </div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="$('#exampleModal2').modal('hide');">취소</button>
						        <button type="button" class="btn btn-primary"  onclick="findFinOk()">저장</button>
						      </div>
						    </div>
						  </div>
						</div>
						            <!-- footer -->
		                    <footer class="col-12" style="height: 60px;">
		                        
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