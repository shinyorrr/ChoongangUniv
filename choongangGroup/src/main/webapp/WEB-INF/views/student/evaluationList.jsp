<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
//function getEvaluationList(vuserId)
	// {
	 
	//var value = (selectOp.options[selectOp.selectedIndex].value);
	
	//alert("성공 ");
	
	//alert("selectOp.selectedIndex-->"+selectOp.options[selectOp.selectedIndex].value);
	
	//alert("lec_id-->"+lec_id);
	
/* 	$.ajax({
	
	 url : "/saveEvaluation2",
	 type : 'post',
	 data:{'userid' : vuserId , 'lec_id' : value},
	 success:function(data){
	 alert(result);
	 }
	});  */


/*     var radio_name = [];//array
    var raido_name_val = {};//object
    var radio = $("input[type=radio]"); //라디오 정보를 가져옵니다.
    $.each(radio, function (key, value) { // input radio의 name 값을 가져옵니다.
        radio_name.push($(value).attr('name'));
    });
    console.log(radio_name);
    radio_name = $.unique(radio_name.sort()).sort(); //중복요소 이름을 제거
    console.log(radio_name);
    for (var i = 0; i < radio_name.length; i++) {
        raido_name_val[radio_name[i]] = $('input[name="' + radio_name[i] + '"] :checked').val();
    }
    console.log(raido_name_val);//예시   */
//}
  
 	</script>
	
	


<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h3>강의평가</h3>

	<form action="saveEvaluation"  method="post"  name="frm">
	<div>userid : ${userid }</div>
	
	<input type="hidden"  name="userid"  value="${userid}">
		<!--  과목 교수  셀렉트바   -->
		<div>
		<!-- 	 <select id="selectOp" class="form-select form-select-lg mb-3 "
				aria-label=".form-select-lg example"> -->
				 <select class="form-select form-select-lg mb-3 "
				aria-label=".form-select-lg example" name="lec_id">

				<option selected disabled>평가과목선택</option>
				<c:forEach var="ev" items="${evList}" >
	<%-- 				<option value="${ev.lec_name},${ev.prof_name}">${ev.lec_name}/${ev.prof_name}교수님</option> --%>
				<option value="${ev.lec_id}">${ev.lec_name}/ ${ev.prof_name}교수님</option> 

				</c:forEach>

			</select>
			<%-- 	 <input type="button" value="조회"   onclick="getEvaluationList(${userid})"  > --%>
		</div>
		<div class="bodys"></div>
		<div>

			<!-- 설문지 테이블  -->

			<!--  제목 -->
			<table border="1" bordercolor="#272846" width="500" height="300">
				<tr bgcolor="#272846" align="center">
					<p>
					<td rowspan="3" span style="color: white">순번</td>
					</p>
					<p>
					<td rowspan="3" span style="color: white">구분</td>
					</p>
					<p>
					<td colspan="4" rowspan="3" span style="color: white">평가항목</td>
					</p>
					<p>
					<td span style="color: white">전혀그렇지않다</td>
					</p>
					<p>
					<td span style="color: white">그렇지않다</td>
					</p>
					<p>
					<td span style="color: white">보통이다</td>
					</p>
					<p>
					<td span style="color: white">그렇다</td>
					</p>
					<p>
					<td span style="color: white">매우그렇다</td>
					</p>
				</tr>
				<tr align="center" bgcolor="#272846">
					<td colspan="5" style="color: white">낮음 ←
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp →높음</td>
				</tr>

				<tr align="center" bgcolor="#272846" style="color: white">
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
				</tr>

				<!-- 설문내용 -->
				<c:set var="cnt" value="0" />
				<c:forEach var="cg" items="${cgList }">
					<%--  순번 (자동으로 1부터  숫자 메겨지게하기위해서 적어줌)--%>
					<c:set var="sum" value="${sum+1 }" />
					<c:set var="cnt" value="${cnt+1 }" />
					<tr>
						<%--  순번 (자동으로 1부터  숫자 메겨지게하기위해서 적어줌)--%>
						<th rowspan="2">${sum}</th>
						<th rowspan="2" scope="rowgroup">${cg.gubun}</th>
						<td colspan="4">${cg.text}</td>
						<input type="hidden"  name="big_category"    value="${cg.big_category}" >
						<input type="hidden"  name="small_category"   value="${cg.small_category}" >
						<td><input type="radio" name="score${cnt}" id = "score" value="1"></td>
						<td><input type="radio" name="score${cnt}" id = "score" checked value="2"></td>
						<td><input type="radio" name="score${cnt}" id = "score" value="3"></td>
						<td><input type="radio" name="score${cnt}" id = "score" value="4"></td>
						<td><input type="radio" name="score${cnt}" id = "score" value="5"></td>
					</tr>
					<tr>
				</c:forEach>


			</table>
		</div>

		<div>
			▶불편사항 있으면 적어주세요 <br> <input type="text" name="review"
				style="width: 500px; height: 100px">
		</div>

		<div>
 <%-- <input type="submit" value="제출" onclick="getEvaluationList(${userid})">  --%>   
	

		  <input type="submit" value="제출" onclick="chk();" >  

		</div>

	</form>
<!-- 
<script type="text/javascript">

    function chk(){
    	if(!frm.score.value){
    		alert("제출실패 ")
    		frm.score.focus();
    		return false;
    	}else location.href ="confirm?score="+frm.score.value;
    	
    	
    }

 -->


</script>










</body>
</html>