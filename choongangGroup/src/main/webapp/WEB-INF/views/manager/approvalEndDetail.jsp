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
<title>결재완료상세</title>
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
                        <i class="bi bi-bookmark-fill me-2"></i>전자결재 <i class="bi bi-chevron-right"></i>결재완료목록 <i class="bi bi-chevron-right"></i>결재완료상세
                    </div>
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                        <div id="titleInBox" style="font-weight: bold; font-size: 19px;">결재완료 문서 상세보기</div>
							<div style="border-top: 1px dashed #c9c9c9; margin-top: 10px;"></div>
							<div id="containerBox">
							
								<form action="" name="processFrm" enctype="multipart/form-data">
								<!--===================================== 문서선택  ======================================-->
								<!-- 사용자 아이디값 가져오기 -->
								<input type="hidden" name="userid" id="userid" value="${appr.userid}">
								<div class="ApprListTitle" style="margin-top: 10px;">요약</div>
								<div style="display: inline-block; width: 100%">
								<div style="float: left; width: 30%">
									<table class="table table-bordered table-responsive" style="width: 300px; margin-top : 10px; border-collapse: collapse !important; color: black; background: white; font-size: 14px;">
										<tr>
											<th style="width: 5%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">문서종류</th>
											<td style="width: 5%;">
												${appr.approval_sort_name }
											</td>
										</tr>
										<tr>
											<th style="width: 5%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">기안자</th>
											<td style="width: 5%;">
												${appr.memDept.name }
											</td>
										</tr>
										<tr>
											<th style="width: 5%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">소속</th>
											<td style="width: 5%;">
												${appr.memDept.dname }
											</td>
										</tr>
										<tr>
											<th style="width: 5%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">기안작성일</th>
											<td style="width: 5%;">
												${appr.writeday}
											</td>
										</tr>
									</table>
								</div>
								
								<!--===================================== 결재선  ======================================-->
								<div style="float: right; width: 45%;">
									<table class="table table-bordered table-responsive" style="width: 100%; margin-top : 10px; border-collapse: collapse !important; color: black; background: white; font-size: 14px; text-align: center;">
										<tbody>
											<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">구분</th>
												<th style="width: 15%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">중간결재자</th>
												<th style="width: 15%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">최종결재자</th>
											</tr>
										
											<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">직급</th>
												<td style="width: 15%;">
													${appr.midapprvo.dname }
												</td>
												<td style="width: 15%;">
													${appr.finapprvo.dname }
												</td>
											</tr>
											<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">이름</th>
												<td style="width: 15%;">
													${appr.midapprvo.name }
												</td>
												<td style="width: 15%;">
													${appr.finapprvo.name }
												</td>
											</tr>
											<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">승인여부</th>
											
												<c:if test="${appr.mid_approver_ok eq '0' }">
													<td style="width: 15%;">&nbsp;</td>
												</c:if>
												<c:if test="${appr.mid_approver_ok eq '1' }">
													<td style="width: 15%;">승인</td>
												</c:if>
												<c:if test="${appr.mid_approver_ok eq '2' }">
													<td style="width: 15%;">반려</td>
												</c:if>
												<c:if test="${appr.fin_approver_ok eq '0' }">
													<td style="width: 15%;">&nbsp;</td>
												</c:if>
												<c:if test="${appr.fin_approver_ok eq '1' }">
													<td style="width: 15%;">승인</td>
												</c:if>
												<c:if test="${appr.fin_approver_ok eq '2' }">
													<td style="width: 15%;">반려</td>
												</c:if>
											</tr>
											<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">결재자의견</th>
												<td style="width: 15%;">
													${appr.mid_approver_opinion }
												</td>
												<td style="width: 15%;">
													${appr.fin_approver_opinion }
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								</div>
								
								<!--===================================== 문서 시작 ======================================-->
								<div class="ApprListTitle2">상세내용</div>
								<div class="docHeader">
									<div class="table-responsive">
									  <table class="table table-bordered">
									    <tbody>
									    	<tr>
												<td>
													${appr.approval_sort_name }
												</td>
											</tr>
									    	<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">부서</th>
												<td>
													${appr.memDept.dname }
												</td>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">기안일</th>
												<td>
													<input type="text" id="date" name="writeday" value="${appr.writeday }" style="border: none;">
												</td>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">문서번호</th>
												<td>
													<input type="text" id=approval_no name="approval_no" value="${appr.approval_no }" style="border: none;">
												</td>
											</tr>
									    	<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">제목</th>
												<td colspan="5">
													<input type="text" name="title" id="title" value="${appr.title }" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none;" readonly="readonly">
											</tr>
											<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">연차신청기간</th>
												<td colspan="5">
													<input type="date" name="approval_start" id="approval_start" value="${appr.approval_start }"  style="width: 20%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none; float: left" readonly="readonly">
													<i class="bi bi-dash" style="float: left"></i>
													<input type="date" name="approval_end" id="approval_end" value="${appr.approval_end }"  style="width: 20%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none; float: left" readonly="readonly">
												</td>
											</tr>
											<tr>
												<td colspan="6">
													<div class="mb-3">
														<textarea name="approval_content" class="form-control" id="exampleFormControlTextarea1" maxlength="200" rows="3" readonly="readonly" style="resize: none;">${appr.approval_content }</textarea>
													</div>
												</td>
											</tr>
											<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">파일선택</th>
												<td colspan="5">
													<a onclick="fileDownload()"><input type="text" name="org_file_name" id="org_file_name" value="${appr.org_file_name}" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none;" readonly="readonly"></a>
												</td>
											</tr>
									    </tbody>
									  </table>
									  <!--  파일삭제를 위한 값 저장 -->
									  <input type="hidden" name="file_path" id="file_path" value="${appr.file_path }">
									  <input type="hidden" name="server_file_name" id="server_file_name" value="${appr.server_file_name }">
									</div>
								</div>
									
								<!--======================== 결재완료목록가기 =======================-->
								<div style="clear: left; margin-top: 10px;">
									<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='approvalEnd'">목록가기</button>				
								</div>
								</form>
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