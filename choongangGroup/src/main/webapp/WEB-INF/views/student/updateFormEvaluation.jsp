<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


function updateEvaluation(vuserId){
	
	alert("수정");

	//테이블의 html 태그로 데이터 접근하기.
	var rows = document.getElementById("table").getElementsByTagName("tr");
	console.log(rows.length);	// 줄 개수 6개
	
	var list = []; // 배열들 넣어줄 리스트

	for( var r=0; r<rows.length; r++ ){ //6번 반복

		var arr = []; //배열 생성
		
		var cells = rows[r].getElementsByTagName("th"); // tr 밑의 th 태그 가져옴(첫번째줄)
		var big = cells[0].firstChild.data;				// 첫번째줄의 첫번째칸 :대분류 10
		var small = cells[1].firstChild.data;			// 첫번째줄의 두번째칸 :소분류 20
		//var cell_3 = cells[2].firstChild.data;		// 첫번째줄의 세번째칸 :질문내용 (필요없음)
		var content = cells[3].firstChild.value;		// 첫번째줄의 네번째칸 :수업 내용은 ~~~~ ?
				
		arr.push(big);
		arr.push(small);
		arr.push(content);

		console.log(big);	// 10
		console.log(small);	// 20
		console.log(content);	// 수업 내용은 전반적으로 적절합니까 ? 
				
		list.push(arr);		
	}
	

	
	console.log(list);
	alert(list);
	alert(parent);
	
 	$.ajax({
 		url : "realupdateEvaluation",
		data:{
			"rsList" : JSON.stringify(list) //보내려는 데이터를 문자열로 변환하여 넣기
		},
		success:function(data){
			alert("성공");
			alert("넘오온데이터 : " + data);
		},
		
	     error:function(request,status,error){
	    	 console.log(e); // 실패 시 처리
	       }
	});

	
	
	
}






</script>





<head>
<meta charset="UTF-8">
<style type="text/css">
.big {
	display: none;
} /*값 숨기기  */
</style>



<title>Insert title here</title>
</head>
<body>
	강의내용수정 ****(수정용)

	<input type="hidden" id="cgList3" value="${cgList2}" />
	<div>
		<table class="table table-striped table-hover" id="table" border="1">
			<tbody>
				<c:forEach var="cg2" items="${cgList2 }" varStatus="status">
					<tr>
						<th class="big" rowspan="1">${cg2.big_category}</th>
						<th class="big" rowspan="1">${cg2.small_category}</th>
						<th rowspan="1">질문내용</th>
						<th><input style="height: 50px:" type="text"
							name="category_content" required="required"
							value="${cg2.category_content }"></th>
					</tr>

				</c:forEach>
			</tbody>

		</table>
	</div>

	<div>
		<%--             <input type="submit" value="수정" onclick="location.href='updateEvaluation?userid=${userid}'"    > --%>
		<form>
			<input type="submit" value="수정" onclick="updateEvaluation(${userid})" />
		</form>
		<!--  //아작스 실행  -->

	</div>



</body>
</html>