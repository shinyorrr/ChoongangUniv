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
	
	// 새문서 열람시
	$(document).ready(function(){
		// 체크박스 그룹 셀렉터
		$('input[name=chkbox]').click(function(){
			// 체크 상태인 경우
			if($(this).prop('checked')) {
				// 체크박스 그룹의 요소 전체 체크 후 클릭한 요소 체크 상태 지정
				$('input[name=chkbox]').prop('checked', false);
				$(this).prop('checked', true);
			}
		});
		
		getDate();
	});
	
	
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
							
								<form action="approvalWrite" name="addFrm" enctype="multipart/form-data" method="post">
								<!--===================================== 문서선택  ======================================-->
								<!-- 사용자 아이디값 가져오기 -->
								<input type="hidden" name="userid" value="${userid}">
								<div class="ApprListTitle">기본설정</div>
								<div style="display: inline-block; width: 100%">
								<div style="float: left; width: 45%">
									<table class="table table-bordered table-responsive" style="width: 500px; margin-top : 10px; border-collapse: collapse !important; color: black; background: white; font-size: 12px;">
										<tr>
											<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">문서종류</th>
											<td style="width: 40%;">
												<div>
													<select name="approval_sort_no" id="approvalSort" class="form-select" aria-label="Default select example" style="width: 100%;">
													  <option selected value="">문서 선택</option>
													  <option value="1">출장보고서</option>
													  <option value="2">연차신청서</option>
													  <option value="3">비품신청서</option>
													  <option value="4">사직서</option>
													</select>
													<input type="hidden" id="selectedSort" name="selectedSort" />
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
												최혜선
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
								  				<input type="text" name="#" id="#" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: 1px solid #adb5bd;">
								  			</td>
								  			<td>
								  				<input type="text" name="#" id="#" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: 1px solid #adb5bd;">
								  			</td>
								  		</tr>
								  		<tr class="tblElecApprLine">
								  			<th style="width: 22%">사번</th>
								  			<td>
								  				<input type="text" name="#" id="#" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: 1px solid #adb5bd;">
								  			</td>
								  			<td>
								  				<input type="text" name="#" id="#" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: 1px solid #adb5bd;">
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
													연차신청서
												</td>
											</tr>
									    	<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">부서</th>
												<td>
													교직원
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
													<input type="text" name="#" id="#" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none;">
												</td>
											</tr>
											<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">연차신청기간</th>
												<td colspan="5">
													<input type="date" name="#" id="#" style="width: 20%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none; float: left">
													<i class="bi bi-dash" style="float: left"></i>
													<input type="date" name="#" id="#" style="width: 20%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none; float: left">
												</td>
											</tr>
											<tr>
												<td colspan="6">
													<div class="mb-3">
														<textarea class="form-control" id="exampleFormControlTextarea1" maxlength="200" placeholder="상세 내용을 입력하세요" rows="3"></textarea>
													</div>
												</td>
											</tr>
											<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">파일선택</th>
												<td colspan="5">
													<input type="file" name="#" id="#" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none;">
												</td>
											</tr>
									    </tbody>
									  </table>
									</div>
								</div>
								
								<!--======================== 결재완료/취소 =======================-->
								<div>
									<button type="submit" class="btn btn-primary btn-sm">상신</button>
									<button type="reset" class="btn btn-secondary btn-sm">취소</button>				
								</div>
								</form>
							</div>
						</div>
						
						
						<!-- ==============조직도 중간 결재자 검색 모달창============== -->
						<!-- Vertically centered modal -->
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-lg">
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
						        		<form class="emp_search" action="midListSearch">
						        			<select class="form-select" aria-label="Default select example" name="search" style="width: 20%; display: inline-block;">
											  <option selected>선택하세요</option>
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
						        						<input type="checkbox" name="checkAll" id="checkAll">
						        					</th>
						        					 <th style="padding-left:2px;">이름</th>
						        					 <th style="padding-left:2px;">사번</th>
					                                 <th style="padding-left:2px;">부서</th>
						        				</tr>
						        			</thead>
						        			<tbody>
						        				<c:forEach var="member" items="${members}" varStatus="status">
						        					<tr style="height: 20px;" id="memRow" class="${status.index}">
							        					<td style="width: 40px; height: 10px; padding-left:2px;"> 
					                                       <input type="checkbox" name="chkbox" class="check${status.index}">
					                                    </td>
							        					<td style="width: 60px; height: 10px; padding-left:2px;" id="member_name">
								        					${member.name}
								        				</td>
							        					<td style="width: 60px; height: 10px; padding-left:2px;" id="member_userid">
								        					${member.userid}
								        				</td>
								        				<td style="width: 60px; height: 10px; padding-left:2px;" id="member_deptno_dname">
								        					${member.dept.dname}
								        				</td>
							        				</tr>
						        				</c:forEach>
						        			</tbody>
						        		</table>
						        	</div>
						        </div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="window.location.reload()">취소</button>
						        <button type="button" class="btn btn-primary">저장</button>
						      </div>
						    </div>
						  </div>
						</div>
						
						<!-- ==============조직도 최종 결재자 모달창============== -->
						<!-- Vertically centered modal -->
						<!-- Modal -->
						<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog modal-lg">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h1 class="modal-title fs-5" id="exampleModalLabel">중간결재자 선택</h1>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        <!-- 사원리스트 불러오기 -->
						        <div>
						        	<!-- 사원검색 -->
						        	<div>
						        		<form class="emp_search" action="">
						        			<input id="searchWord" class="search" type="text" placeholder="이름, 부서">
						        			<button type="button" class="btn btn-info btnSearch" style="border-radius: 3px; color: white;">검색</button>   
						        		</form>
						        	</div>
						        	
						        	<div class="scroll_wrap" style="height: 360px;">
						        		<table style="width: 400px; height: 366px; border: 0px; overflow-y: auto;">
						        			<thead style="padding: 0;">
						        				<tr style="text-align: left; font-weight: normal;">
						        					<th style="padding-left: 2px">
						        						<input type="checkbox" name="check1" id="check1">
						        					</th>
						        					 <th style="padding-left:2px;">이름</th>
						        					 <th style="padding-left:2px;">사번</th>
					                                 <th style="padding-left:2px;">부서</th>
						        				</tr>
						        			</thead>
						        			<tbody>
						        				<tr style="height: 20px;" id="empRow" class="#">
						        					<td style="width: 40px; height: 10px; padding-left:2px;"> 
				                                       <input type="checkbox" name="chkbox" class="#">
				                                    </td>
						        					<td style="width: 60px; height: 10px; padding-left:2px;">
							        					양요섭
							        				</td>
						        					<td style="width: 60px; height: 10px; padding-left:2px;">
							        					사번
							        				</td>
						        				</tr>
						        				<tr style="height: 20px;" id="empRow" class="#">
						        					<td style="width: 40px; height: 10px; padding-left:2px;"> 
				                                       <input type="checkbox" name="chkbox" class="#">
				                                    </td>
						        					<td style="width: 60px; height: 10px; padding-left:2px;">
							        					양요섭
							        				</td>
						        					<td style="width: 60px; height: 10px; padding-left:2px;">
							        					사번
							        				</td>
						        				</tr>
						        			</tbody>
						        		</table>
						        	</div>
						        </div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="window.location.reload()">취소</button>
						        <button type="button" class="btn btn-primary">저장</button>
						      </div>
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