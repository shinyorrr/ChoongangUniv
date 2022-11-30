<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked = true;
		}
		else{
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});
function deleteValue(){
	var url = "deleteBook";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
	var valueArr = new Array();
    var list = $("input[name='RowCheck']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
        }
    }
    if (valueArr.length == 0){
    	alert("선택된 글이 없습니다.");
    }
    else{
		var chk = confirm("정말 삭제하시겠습니까?");				 
		$.ajax({
		    url : url,                    // 전송 URL
		    type : 'POST',                // GET or POST 방식
		    traditional : true,
		    data : {
		    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
		    },
            success: function(jdata){
                if(jdata = 1) {
                    alert("삭제 성공");
                    location.replace("blist")
                }
                else{
                    alert("삭제 실패");
                }
            }
		});
	}
}	
</script>
</head>
<body>
<h1>책 목록</h1>
	중앙대학교 교재 관리  	
		<div>
			<input type="button" value="선택삭제" class="btn btn-outline-info" onclick="deleteValue();">
		</div>
		<div>
			<a href="/student/createBookForm" class ="btn btn-outline-info">글쓰기</a>
		</div>
		<table border="1">
		<thead>
			<tr><th><input id="allCheck" type="checkbox" name="allCheck" /></th>
				<th>책코드</th><th>책이름</th><th>책금액</th><th>재고수량</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="blist" items="${blist }">
				<tr>
					<td class="checkbox"> <input type="checkbox" name="RowCheck" value="${blist.bookid }">
					<td><a href="/student/detailBook?bookid=${blist.bookid }">${blist.bookid }</a></td>
					<td>${blist.bookname }</td>
					<td>${blist.bookprice }</td>
					<td>${blist.stockQuantity }</td>
				</tr>	
			</c:forEach>	
		</tbody>	
		</table>
		<c:if test="${page.startPage > page.pageBlock }">
		<a href="blist?currentPage=${page.startPage-page.pageBlock}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
			<a href="blist?currentPage=${i}">[${i}]</a>
		</c:forEach>
		<c:if test="${page.endPage < page.totalPage }">
			<a href="blist?currentPage=${page.startPage+page.pageBlock}">[다음]</a>
		</c:if>
		
		
		<!-- search{s} -->
		<form name="Search" method="get" action="/student/bookList">
				<div class="form-group row center">
					<div style="padding-right:10px">
						<select class="form-control form-control-sm" name="searchType" id="searchType">
							<option value="bookname" selected="selected">책이름</option>
							<option value="bookid">책코드</option>
						</select>
					</div>
					<div style="padding-right:10px">
						<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
					</div>
					
					<div>
						<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
					</div>
				</div>
		</form>
</body>
</html>