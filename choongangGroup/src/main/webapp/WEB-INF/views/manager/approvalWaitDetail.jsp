<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	// 결재승인
	function getAgree() {
		var id = $('#userid').val(); // 접속한 유저의 아이디
		var midApprOk = $('#mid_approver_ok').val();
		var midAppr = $('#mid_approver').val();
		var finAppr = $('#fin_approver').val();
		var midOpinion = $('#mid_approver_opinion').val();
		var finOpinion = $('#fin_approver_opinion').val();
		var approvalNo = $('#approval_no').val();
		
		console.log("유저ID->"+id);
		console.log("중간결재자->"+midAppr);
		console.log("최종결재자->"+finAppr);
		console.log("중간결재자 승인여부->"+midApprOk);
		console.log("중간결재자 의견->"+midOpinion);
		console.log("최종결재자 의견->"+finOpinion);
		console.log("문서번호->"+approvalNo);
		
		// 내가 최종결재자이고 중간결재자의 의견이 없을 때
		if(id == finAppr && midApprOk == '0') {
			alert("아직 승인할 수 없습니다.");
			return false;
			
		// 내가 최종결재자이고 중간결재자가 이미 결재했을 때
		} else if(id == finAppr && (midApprOk == '1' || midApprOk == '2')) {
			if(finOpinion == null || finOpinion == "") {
				alert("결재자 의견 작성해주세요.");
				return false;
			} else {
				 if (confirm("승인하시겠습니까?") == true) { 
					 $.ajax(
								{
									url:"finAgree",
									type:'POST',
									data : {
											fin_approver_opinion : finOpinion,
											approval_no			 : approvalNo
										   },
									success:function(data) {
										if(data == 1) {
											alert("승인완료되었습니다.");
											window.location.href = 'approvalEnd';
										} else {
											alert("결재실패");
											return false;
										}
									}
								}		
						
						);
				 } else {
					 return false;
				 }
				
			}
		// 내가 중간 결재자일때
		} else if(id == midAppr && midApprOk == '0') {
			alert("중간 결재자 실행");
			if(midOpinion == null || midOpinion == "") {
				alert("결재자 의견 작성해주세요.");
				return false;
			} else {
				if (confirm("승인하시겠습니까?") == true) { 
					 $.ajax(
								{
									url:"midAgree",
									type:'POST',
									data : {
											mid_approver_opinion : midOpinion,
											approval_no			 : approvalNo
										   },
									success:function(data) {
										if(data == 1) {
											alert("승인완료되었습니다.");
											window.location.href = 'approvalWait';
										} else {
											alert("결재실패");
											return false;
										}
									}
								}		
						
						);
					 
				} else {
					 return false;
				}
			}
		}
	
	}
	
	// 결재반려
	function getReject() {
		var id = $('#userid').val(); // 접속한 유저의 아이디
		var midApprOk = $('#mid_approver_ok').val();
		var midAppr = $('#mid_approver').val();
		var finAppr = $('#fin_approver').val();
		var midOpinion = $('#mid_approver_opinion').val();
		var finOpinion = $('#fin_approver_opinion').val();
		var approvalNo = $('#approval_no').val();
		
		console.log("유저ID->"+id);
		console.log("중간결재자->"+midAppr);
		console.log("최종결재자->"+finAppr);
		console.log("중간결재자 승인여부->"+midApprOk);
		console.log("중간결재자 의견->"+midOpinion);
		console.log("최종결재자 의견->"+finOpinion);
		console.log("문서번호->"+approvalNo);
		
		// 내가 최종결재자이고 중간결재자의 의견이 없을 때
		if(id == finAppr && midApprOk == '0') {
			alert("아직 반려할 수 없습니다.");
			return false;
			
		// 내가 최종결재자이고 중간결재자가 이미 결재했을 때
		} else if(id == finAppr && (midApprOk == '1' || midApprOk == '2')) {
			if(finOpinion == null || finOpinion == "") {
				alert("결재자 의견 작성해주세요.");
				return false;
			} else {
				 if (confirm("반려하시겠습니까?") == true) { 
					 $.ajax(
								{
									url:"finReject",
									type:'POST',
									data : {
											fin_approver_opinion : finOpinion,
											approval_no			 : approvalNo
										   },
									success:function(data) {
										if(data == 1) {
											alert("반려되었습니다.");
											window.location.href = 'approvalEnd';
										} else {
											alert("결재실패");
											return false;
										}
									}
								}		
						
						);
				 } else {
					 return false;
				 }
				
			}
		// 내가 중간 결재자일때
		} else if(id == midAppr && midApprOk == '0') {
			alert("중간 결재자 실행");
			if(midOpinion == null || midOpinion == "") {
				alert("결재자 의견 작성해주세요.");
				return false;
			} else {
				if (confirm("반려하시겠습니까?") == true) { 
					 $.ajax(
								{
									url:"midReject",
									type:'POST',
									data : {
											mid_approver_opinion : midOpinion,
											approval_no			 : approvalNo
										   },
									success:function(data) {
										if(data == 1) {
											alert("반려되었습니다.");
											window.location.href = 'approvalEnd';
										} else {
											alert("결재실패");
											return false;
										}
									}
								}		
						
						);
					 
				} else {
					 return false;
				}
			}
		}
	
	}
	
	//-------- 파일 다운로드 ----------
	function fileDownload() {
		var selFilePath = $('#file_path').val();
		var selServerName= $('#server_file_name').val();
		var selOrgName = $('#org_file_name').val();
		console.log(selFilePath);
		console.log(selServerName);
		if(selServerName != null && selServerName != '') {
			
			$.ajax(
					{
						url:"download",
						data:{file_path 	  : selFilePath,
							 server_file_name : selServerName,
							 org_file_name	  : selOrgName},
						dataType:'text',
						success:function(data) {
							alert("다운로드 성공");
							downloadFile();
							window.location.reload();
						}
					}	
			);
		}
		
	} 

	 function downloadFile() {
		  var selFilePath = $('#file_path').val();
		  var selServerName= $('#server_file_name').val();
		  var selOrgName = $('#org_file_name').val();
	      var downloadLink = document.createElement("a");
	      var uri = '/manager/download?file_path='+selFilePath+'&server_file_name='+selServerName+'&org_file_name='+selOrgName;
	      downloadLink.href = encodeURI(uri);
	      downloadLink.download = selServerName;
	      alert(selServerName);
	      
	      document.body.appendChild(downloadLink);
	      downloadLink.click();
	      document.body.removeChild(downloadLink);
	      alert("File 다운로드 성공");
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
    <!-- main content -->
    <div class="container-fluid w-100" style=" background-color: rgb(214, 225, 237)">
        <div class="row">
        <!-- content header -->
		<jsp:include page="contentHeader.jsp"></jsp:include>
                    <!-- card header -->
                    <div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;"> 
                        <i class="bi bi-bookmark-fill me-2"></i>전자결재 <i class="bi bi-chevron-right"></i>결재 대기중 문서 <i class="bi bi-chevron-right"></i>결재 대기중 문서 상세내용
                    </div>
                    <!-- card content -->  
                    <div class="col-12 rounded-bottom overflow-auto bg-light p-3" style="min-height: 550px;"> 
                        <div id="titleInBox" style="font-weight: bold; font-size: 19px;">진행중인 문서 상세보기</div>
							<div style="border-top: 1px dashed #c9c9c9; margin-top: 10px;"></div>
							<div id="containerBox">
								<!-- 사용자 아이디값 가져오기 -->
								<input type="hidden" name="userid" id="userid" value="${userid}">
								<form action="" name="waitFrm" enctype="multipart/form-data" >
								<!--===================================== 문서선택  ======================================-->
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
								<div style="float: right; width: 45%">
									<table class="table table-bordered table-responsive" style="width: 100%; margin-top : 10px; border-collapse: collapse !important; color: black; background: white; font-size: 14px; text-align: center;">
										<tbody>
											<tr>
												<th style="width: 5%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">구분</th>
												<th style="width: 5%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">중간결재자</th>
												<th style="width: 5%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">최종결재자</th>
											</tr>
										
											<tr>
												<th style="width: 5%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">직급</th>
												<td style="width: 5%;">
													${appr.midapprvo.dname }
												</td>
												<td style="width: 5%;">
													${appr.finapprvo.dname }
												</td>
											</tr>
											<tr>
												<th style="width: 5%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">이름</th>
												<td style="width: 5%;">
													${appr.midapprvo.name }
												</td>
												<td style="width: 5%;">
													${appr.finapprvo.name }
												</td>
											</tr>
											<tr>
												<th style="width: 5%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">승인여부</th>
											
												<td>
													<c:if test="${appr.mid_approver_ok == 1}">
														승인
													</c:if>
													<c:if test="${appr.mid_approver_ok == 2}">
														반려
													</c:if>
												</td>
												<td>
													<c:if test="${appr.fin_approver_ok == 1}">
														승인
													</c:if>
													<c:if test="${appr.fin_approver_ok == 2}">
														반려
													</c:if>
												</td>
											</tr>
										</tbody>
									</table>
									<input type="hidden" name="mid_approver_ok" id="mid_approver_ok" value="${appr.mid_approver_ok }">
									<input type="hidden" name="fin_approver_ok" id="fin_approver_ok" value="${appr.fin_approver_ok }">
									<input type="hidden" name="mid_approver" id="mid_approver" value="${appr.mid_approver }">
									<input type="hidden" name="fin_approver" id="fin_approver" value="${appr.fin_approver }">
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
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">필요품목</th>
												<td>
													<input type="text" name="item_need" id="item_need" value="${appr.item_need }" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none;" readonly="readonly">
												</td>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">수량</th>
												<c:if test="${appr.item_quantity eq  0}">
													<td>&nbsp;</td>
												</c:if>
												<c:if test="${appr.item_quantity ne  0}">
													<td>
														<input type="text" name="item_quantity" id="item_quantity" value="${appr.item_quantity }" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none;" readonly="readonly">
													</td>
												</c:if>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">용도</th>
												<td>
													<input type="text" name="item_purpose" id="item_purpose" value="${appr.item_purpose }" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none;" readonly="readonly">
												</td>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">예상가격</th>
												<td>
													<input type="text" name="item_price" id="item_price" value="${appr.item_price }" style="width: 50%; margin-left:10px; margin-right: 1%; border-radius:3px; border: none;" readonly="readonly">
												</td>
											</tr>
											<tr>
												<td colspan="8">
													<div class="mb-3">
														<textarea name="approval_content" class="form-control" id="exampleFormControlTextarea1" maxlength="200" rows="3" readonly="readonly" style="resize: none;">${appr.approval_content }</textarea>
													</div>
												</td>
											</tr>
											<tr>
												<th style="width: 10%; font-size: 14px; display: table-cell; vertical-align: middle; background-color: #dddddd">파일선택</th>
												<td colspan="8">
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
								
								<div>
									<c:if test="${(not empty appr.midapprvo) and (appr.fin_approver eq userid)}">
										<div style="margin: 10px 0;">중간결재자 의견</div>
										<span style="margin: 10px 0; font-weight: bold;">${appr.mid_approver_opinion}</span>
										<input type="hidden" id="mid_approver_opinion" name="mid_approver_opinion" value="${appr.mid_approver_opinion }">
									</c:if>
									
									<div style="margin: 10px 0;">결재자 의견 작성</div>
									<c:if test="${appr.mid_approver eq userid}">
										<input type="text" id="mid_approver_opinion" name="mid_approver_opinion" maxlength="100" style="font-size:11pt; margin: 10px 0; width: 50%" required="required" placeholder="승인/반려 사유를 적어주세요"/>
									</c:if>
									
									
									<c:if test="${appr.fin_approver eq userid}">
										<input type="text" id="fin_approver_opinion" name="fin_approver_opinion" maxlength="100" style="font-size:11pt; margin-bottom: 10px; width: 50%" required="required" placeholder="승인/반려 사유를 적어주세요"/>
									</c:if>
								</div>
								
								<!--======================== 결재완료/취소 =======================-->
								<div>
									<button type="submit" class="btn btn-primary btn-sm" onclick="getAgree()">승인</button>
									<button type="submit" class="btn btn-dark btn-sm" onclick="getReject()">반려</button>
									<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='approvalWait'">목록가기</button>				
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