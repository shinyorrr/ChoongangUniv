<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="/css/stylesLec.css">

	<title>Professor calender</title>

<!-- 링크 확인해보기	 -->
<link href='/fullcalendar/main.css' rel='stylesheet' />
    <script src='/fullcalendar/main.js'></script>

<!-- Full Calender 관련 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
 <link href='fullcalendar-5.11.0/lib/main.css' rel='stylesheet' />
  <script src='fullcalendar-5.11.0/lib/main.js'></script> -->

<script>


document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
        headerToolbar: {
            left: 'prevYear,prev,next,nextYear today',
            center: 'title',
            right: 'dayGridMonth,dayGridWeek,dayGridDay'
        },

        selectable: true,
        selectMirror: true,

        navLinks: true, // can click day/week names to navigate views
        editable: true,
        // Create new event
        select: function (arg) {
            Swal.fire({
                html: "<div class='mb-7'>Create new event?</div><div class='fw-bold mb-5'>Event Name:</div><input type='text' class='form-control' name='event_name' />",
                icon: "info",
                showCancelButton: true,
                buttonsStyling: false,
                confirmButtonText: "Yes, create it!",
                cancelButtonText: "No, return",
                customClass: {
                    confirmButton: "btn btn-primary",
                    cancelButton: "btn btn-active-light"
                }
            }).then(function (result) {
                if (result.value) {
                    var title = document.querySelector("input[name=;event_name']").value;
                    if (title) {
                        calendar.addEvent({
                            title: title,
                            start: arg.start,
                            end: arg.end,
                            allDay: arg.allDay
                        })
                    }
                    calendar.unselect()
                } else if (result.dismiss === "cancel") {
                    Swal.fire({
                        text: "Event creation was declined!.",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "Ok, got it!",
                        customClass: {
                            confirmButton: "btn btn-primary",
                        }
                    });
                }
            });
        },

        // Delete event
        eventClick: function (arg) {
            Swal.fire({
                text: "이 일정을 삭제하시겠습니까?",
                icon: "warning",
                showCancelButton: true,
                buttonsStyling: false,
                confirmButtonText: "네 삭제할게요!",
                cancelButtonText: "아니요. 취소할게요.",
                customClass: {
                    confirmButton: "btn btn-primary",
                    cancelButton: "btn btn-active-light"
                }
            }).then(function (result) {
                if (result.value) {
                    arg.event.remove()
                } else if (result.dismiss === "cancel") {
                    Swal.fire({
                        text: "일정이 삭제되었습니다!",
                        icon: "error",
                        buttonsStyling: false,
                        confirmButtonText: "Ok, got it!",
                        customClass: {
                            confirmButton: "btn btn-primary",
                        }
                    });
                }
            });
        },
        dayMaxEvents: true, // allow "more" link when too many events
        // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
        events: [
            {
            title: 'All Day Event',
            start: '2022-11-01'
            },
            {
            title: 'Long Event',
            start: '2022-11-07',
            end: '2022-11-10'
            },
            {
            groupId: 999,
            title: 'Repeating Event',
            start: '2022-11-09T16:00:00'
            },
            {
            groupId: 999,
            title: 'Repeating Event',
            start: '2022-11-16T16:00:00'
            },
            {
            title: 'Conference',
            start: '2022-11-11',
            end: '2022-11-13'
            },
            {
            title: 'Meeting',
            start: '2022-11-12T10:30:00',
            end: '2022-11-12T12:30:00'
            },
            {
            title: 'Lunch',
            start: '2022-11-12T12:00:00'
            },
            {
            title: 'Meeting',
            start: '2022-11-12T14:30:00'
            },
            {
            title: 'Happy Hour',
            start: '2022-11-12T17:30:00'
            },
            {
            title: 'Dinner',
            start: '2022-11-12T20:00:00'
            },
            {
            title: 'Birthday Party',
            start: '2022-11-13T07:00:00'
            },
            {
            title: 'Click for Google',
            url: 'http://google.com/',
            start: '2022-11-28'
            }
        ]
    });

    calendar.render();
});
</script>
<style>

/* body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
} */

#calendar {
	max-width: 1000px;
	margin: 0 auto;
}

</style>	
</head>

<body id="body-pd">
	<!-- header -->
	<nav class="navbar navbar-expand-lg navbar-dark bd-navbar bg-light position-fixed sticky-top  fixed-top w-100" style="position : absolute">
		<header class="d-flex float-start align-items-center " style="display: inline-block; float: left;">
			<a href="/professor/main" class="navbar-brand  ms-3">
				<img class="img-fluid float-start" src="/images/logo2.png" alt="logo2" style="height: 40px;"></svg>
			</a>
			
			<!-- <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
				<li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
				<li><a href="#" class="nav-link px-2 link-dark">Features</a></li>
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
			<div class="nav__brand">
				<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
				<a href="#" class="nav__logo"></a>
			</div>
			<a href="/professor/calenderForm" class="nav__link active">
				<i class="bi bi-calendar-plus nav__icon" ></i>
				<span class="nav_name">캘린더</span>
			</a>
			<a href="/logout" class="nav__link">
				<ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">Log out</span>
			</a>
			

			<div href="#" class="nav__link collapses ">
				<ion-icon name="folder-outline" class="nav__icon"></ion-icon>
				<span class="nav_name">학사관리</span>
				<ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>

				<ul class="collapse__menu  " style="width: 180px;">
					<a href="#" class="collapse__sublink mt-2 mb-2" style="font-size: 0.875rem;">강의시간표</a>
					<a href="/professor/lecMgMain?userid=${userid}" class="collapse__sublink mb-1 ms-0" style="font-size: 0.875rem;">강의관리</a>
					<a href="#" class="collapse__sublink ms-3" style="font-size: 0.8rem;">전자출석부</a>
					<a href="#" class="collapse__sublink ms-3 mb-2"  style="font-size: 0.8rem;">과제관리</a>
					
					<a href="#" class="collapse__sublink mb-2" style="font-size: 0.875rem;">강의계획서</a>
					<a href="/professor/lecCreateList" class="collapse__sublink mb-2" style="font-size: 0.875rem;">강의개설</a>
					<!-- <a href="#" class="collapse__sublink mb-1" style="font-size: 0.875rem;">강의정보</a>
					<a href="#" class="collapse__sublink ms-3"  style="font-size: 0.8rem;">강의계획서</a>
					<a href="#" class="collapse__sublink ms-3 mb-2"  style="font-size: 0.8rem;">강의개설</a> -->
					<a href="/professor/lecScore" class="collapse__sublink mb-2" style="font-size: 0.875rem;">성적관리</a>
					<a href="#" class="collapse__sublink mb-2" style="font-size: 0.875rem;">휴&#183;보강 신청</a>
					<a href="#" class="collapse__sublink mb-2" style="font-size: 0.875rem;">내선번호관리</a>
				</ul>
			</div>

			<div class="nav__list">
				<a href="#" class="nav__link">
					<ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">결재</span>
				</a>
				<!-- <a href="#" class="nav__link">
					<ion-icon name="people-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">내선번호관리</span>
				</a> -->
				<a href="#" class="nav__link">
					<ion-icon name="settings-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">개인정보관리</span>
				</a>
				<a href="/logout" class="nav__link">
					<ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
					<span class="nav_name">Log out</span>
				</a>
			</div>
		</nav>
	</div>

<!------- main content ------------>
<div style=" background-color: rgb(214, 225, 237);">
	<!-- <div class="row"> -->

		<!-- content header -->
		<div class="col-12 px-5 py-3" style=" background-color: rgb(95, 142, 241)">
				<i class="bi bi-bookmark-fill h6 text-white me-2"></i><span class="text-white h6"><span class="fw-bold">캘린더</span></span>
	<%-- 	<div class="d-flex flex-row ">
				<span class="text-white h5"><span class="fw-bold">${name}</span>님</span>
				<i class="text-white bi-gear-fill ms-2 me-5"></i>
				<span class="text-white ms-3  me-4 font09">${major} | ${position} </span>
				<i class="bi bi-envelope-fill text-white"></i>
				<span class="text-white ms-2 font09">${email}</span>
		</div> --%>

		</div>

	<!------------- card header  컨텐츠 폼------------->
		<main class=" col-9 h-100 w-100">
			<div class="rounded row m-5 px-5">
			<!------------- 컨텐츠 경로 ------------->
				<!-- <div class="col-12 rounded-top text-white overflow-auto pt-2 fw-bold" style="background-color: rgb(39, 40, 70); height: 40px;">
					<i class="bi bi-bookmark-fill me-2"></i>캘린더 
				</div> -->
				<!----- card content 내용 ------>
				<div class="col-12 rounded overflow-auto bg-white p-5 " style="min-height: 550px;">

				<div id='calendar' class="pt-5" style="width: 100%;">
				
				
				
				
				
				</div>

					
					
					
					
				</div>
			</div>
		<!-- footer -->
		<footer class="col-12 ps-5" style="height: 60px; font-size: 12px;">
			@2022 ChoongAng University. All Rights Reserved.
		</footer>    
					
		</main>
</div>
	
<!-- NavBar 관련 IONICONS -->
<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
<!-- JS -->
<script src="/js/main.js"></script>
</body>
</html>