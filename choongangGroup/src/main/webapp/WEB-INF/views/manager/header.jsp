<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<script type="text/javascript">
	function printClock() {
	    
	    var clock = document.getElementById("clock");            // 출력할 장소 선택
	    var date  = document.getElementById("date");
	    const WeekDay = ['일','월','화','수','목','금','토'];
	    var currentDate = new Date();                                     // 현재시간
	    var getDay = WeekDay[currentDate.getDay()];
	    var amPm = 'AM'; // 초기값 AM
	    var year = currentDate.getFullYear();
	    var month = currentDate.getMonth()+1;
	    var day = currentDate.getDate();
	    var currentHours = addZeros(currentDate.getHours(),2); 
	    var currentMinute = addZeros(currentDate.getMinutes() ,2);
	    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
	    
	    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
	    	amPm = 'PM';
	    	currentHours = addZeros(currentHours - 12,2);
	    }
	
	    if(currentMinute >= 58){// 58분 이상일 때 색을 변환해 준다.
	    	currentMinute = '<span style="color:#de1951;">'+currentMinute+'</span>'
	    }
	    
	    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
	       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
	    }
	    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:20px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
	    date.innerHTML = year + "년 " + month + "월 " + day +"일 " + "(" + getDay+")";
	    
	    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
	}
	
	function addZeros(num, digit) { // 자릿수 맞춰주기
		  var zero = '';
		  num = num.toString();
		  if (num.length < digit) {
		    for (i = 0; i < digit - num.length; i++) {
		      zero += '0';
		    }
		  }
		  return zero + num;
	}
	
	/* 출근버튼 구현 */
	function attInsert(){
		var attOn = 1;
		if(confirm("출근하시겠습니까?")){
			$.ajax({
				url 	: '/attInsert',
				data	: {att : attOn},
				dataType: 'text',
				success : function(data){
					console.log("성공");
					alert(data);
				}
			});
		}
	
	}
	
	/* 퇴근 버튼 구현 */
	function attOff(){
		var attOn = 2;
		if(confirm("퇴근하시겠습니까?")){
			$.ajax({
				url 	: '/attOff',
				data	: {att : attOn},
				dataType: 'text',
				success : function(data){
					console.log("성공"); 
					alert("퇴근 등록 완료되었습니다");
				}
			});
		}
	}
	
	
</script>
