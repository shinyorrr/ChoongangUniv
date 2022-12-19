<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="stylesheet" href="/css/stylesLec.css">
<title>Insert title here</title>
</head>
<body>
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
               <a href="/professor/notice/noticeList" class="nav__link">
                  <i class="bi bi-clipboard-check nav__icon fs-5"></i>
                  <span class="nav_name">공지사항</span>
               </a>
               <a href="/professor/addressForm" class="nav__link">
                  <i class="bi bi-journal-bookmark-fill fs-5 nav__icon"></i>
                  <span class="nav_name">주소록</span>
               </a>
               <div href="#" class="nav__link collapses ">
                  <i class="bi bi-mortarboard-fill nav__icon  fs-5"></i>
                  <span class="nav_name mt-1">학사관리</span>
                  <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
                  <ul class="collapse__menu" style="width: 180px;">
                     <!-- <a href="#" class="collapse__sublink mt-2 mb-3" style="font-size: 0.85rem; display: block;">강의시간표</a> -->
                     <a href="/professor/lecMgMain" class="collapse__sublink mb-1" style="display: block;font-size: 0.85rem;">강의관리</a>
                     <a href="/professor/lecMgMain" class="collapse__sublink ms-3" style="font-size: 0.8rem; display: block;">전자출석부</a>
                     <a href="/professor/reportList" class="collapse__sublink ms-3 mb-3"  style="font-size: 0.8rem; display: block;">과제관리</a>
                     
                     <a href="/professor/lecPlanPage" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">강의계획서</a>
                     <a href="/professor/lecCreateList" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">강의개설</a>
                     <a href="/professor/lecScore" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">성적관리</a>
                     <a href="/professor/makeupPage" class="collapse__sublink mb-3" style="font-size: 0.85rem; display: block;">휴&#183;보강 신청</a>
                    <!--  <a href="#" class="collapse__sublink" style="font-size: 0.85rem; display: block;">내선번호관리</a> -->
                  </ul>
               </div>
   
              <!--  <a href="/manage/approval" class="nav__link">
                  <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                  <span class="nav_name">결재</span>
               </a> -->
               <a href="/professor/mypage" class="nav__link">
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
</body>
</html>