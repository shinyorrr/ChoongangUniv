<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
<!-- bootStrap CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">		
<!-- bootStrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- RSA JS -->
<script src="/js/jsbn.js" type="text/javascript"></script>
<script src="/js/rsa.js" type="text/javascript"></script>
<script src="/js/prng4.js" type="text/javascript"></script>
<script src="/js/rng.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
	function validateEncryptForm() {
		var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
		var name     = document.getElementById("name").value;
		if (!username || !password || !name) {
			alert("아이디, 비밀번호, 성명을 모두 입력해주세요");
			return false;
		}

		if (idChk() == false) {
			alert("아이디 중복");
			return false;
		}
		if (pwChk() == false) {
			alert("비밀번호 불일치");
			return false;
		}
		
		try {
			var rsaPulbicKeyModulus = document.getElementById("rsaPulbicKeyModulus").value;
			var rsaPulbicKeyExponent = document.getElementById("rsaPulbicKeyExponent").value;
			submitEncryptedForm(username , password , rsaPulbicKeyModulus , rsaPulbicKeyExponent);
		} catch (err) {
			alert(err);
		}
		return false;
	}
	function submitEncryptedForm(username , password , rsaPulbicKeyModulus , rsaPulbicKeyExponent) {
		var rsa = new RSAKey();
		rsa.setPublic(rsaPulbicKeyModulus , rsaPulbicKeyExponent);
	
		var securedUsername = rsa.encrypt(username);
		var securedPassword = rsa.encrypt(password);
		
		// 모든 조건을 만족한다면 생성 요청 실행.
		// ajax 생성 요청
		let member = {};
		member.userid   = securedUsername;
		member.password = securedPassword;
		member.name     = document.getElementById("name").value;
		member.memRole  = $('#role option:selected').val();
		
		$.ajax({
			type: "post",
			url: "/admin/createMember",
			data: member,
			success: function(data) {
				alert('아이디 생성 성공');
				console.log(data);
				location.href = data;
			},
			error: function(e) {
				$('#errMsg').html('생성오류');
			}
		});
	}
	
	//아이디 check ajax
	function idChk() {
		var username = document.getElementById("username").value;
		var result   = document.getElementById("idChkResult");
		var chkresult; 
		if(!username) {
			result.innerHTML='아이디를 입력해주세요';
			document.getElementById("username").className = 'form-control bg-light is-invalid mt-3'
			return false;
			}
		
		$.ajax({
			url: "/admin/idCheck",
			type: "post",
			async: false,
			data: {
				userid: username
			},
			success: function(data) {
				if(data == "0") {
					result.innerHTML='사용할 수 없는 아이디입니다.';
					document.getElementById("username").className = 'form-control bg-light is-invalid mt-3'
					chkresult = false;
				} else if(data == "1"){
					result.innerHTML='사용할 수 있는 아이디입니다.';
					document.getElementById("username").className = 'form-control bg-light is-valid mt-3'
					chkresult = true;
				}
				
			},
			error: function() {
				alert("서버요청실패 관리자에게 문의하세요");
				chkresult = false;
			}
		});
		return chkresult;
	}
	
	// 비밀번호 check
	function pwChk() {
		var pw1 = document.getElementById("password").value;
		var pw2 = document.getElementById("password2").value;
		var result = document.getElementById("passwordChkDiv");
		if(!pw1 || !pw2) {
			result.innerHTML='비밀번호를 입력해주세요';
			document.getElementById("password").className = 'form-control bg-light is-invalid mt-3';
			document.getElementById("password2").className = 'form-control bg-light is-invalid mt-1';
			return false;
		}
		if(pw1 != null && pw1 != pw2) {
			result.innerHTML='비밀번호가 일치하지 않습니다';
			document.getElementById("password").className = 'form-control bg-light is-invalid mt-3';
			document.getElementById("password2").className = 'form-control bg-light is-invalid mt-1';
			return false;
		} 
		if(pw1 != null && pw2 != null && pw1 == pw2) {
			result.innerHTML='비밀번호가 일치합니다';
			document.getElementById("password").className = 'form-control bg-light is-valid mt-3';
			document.getElementById("password2").className = 'form-control bg-light is-valid mt-1';
			return true;
		}
	}
	
	function nameChk() {
		var name = document.getElementById("name").value;
		var result = document.getElementById("nameChkDiv");
		if(!name) {
			result.innerHTML='성명을 입력해주세요';
			document.getElementById("name").className = 'form-control bg-light is-invalid';
			return false;
		} else {
			result.innerHTML='';
			document.getElementById("name").className = 'form-control bg-light is-valid';
			return true;
		}
	}
	
	// 유저별 추가정보 div 추가
	function changeRole() {
		var roleSelect = $('#role option:selected').val();
		var roleAdd = $('#roleAdd')
		if (roleSelect == 'ROLE_STUDENT') {
			roleAdd.html("<div>학생정보</div>");
		}
		else if (roleSelect == 'ROLE_MANAGER') {
			roleAdd.html("<div>교직원정보</div>");
		}
		else if (roleSelect == 'ROLE_PROFESSOR') {
			roleAdd.html("<div>교수정보</div>");
		}
		else if (roleSelect == 'ROLE_ADMIN') {
			roleAdd.html("<div>관리자정보</div>");
		}
	}

</script>
<style type="text/css">
	html, body {
		height: 100%;
	}
	body {
		background-color: rgb(214, 225, 237);
	}
	.container {
		max-width: 420px;
	}
</style>
<body>


        <!-- Role별 추가 정보 -->
        <div id="roleAdd">
        	<div>학생정보</div>
        </div>

    
 
    

	<main class="container position-absolute top-50 start-50 translate-middle form-signin w-100 m-auto text-center">
		<h1 class="mb-5 fw-bold">계정생성</h1>
		<div class="form-floating">
   			<select class="form-select" id="role" onchange="changeRole()" aria-label="Floating label select example">
				<option value="ROLE_STUDENT">학생</option>
            	<option value="ROLE_MANAGER">교직원</option>
	            <option value="ROLE_PROFESSOR">교수</option>
	            <option value="ROLE_ADMIN">관리자</option>
			</select>
    		<label for="role">회원구분</label>
		</div>
	    <div class="form-floating">
	    	<input type="text" class="form-control bg-light mt-3" id="username" aria-describedby="idChkResult" onfocusout="idChk()">
	    	<label for="floatingInput">아이디</label>
	    	<small id="idChkResult" class="text-muted">
     			
    		</small>
	    </div>
	    <div class="form-floating">
	    	<input type="password" class="form-control bg-light mt-3" id="password">
	    	<label for="floatingPassword">비밀번호</label>
	    </div>
	    <div class="form-floating">
	    	<input type="password" class="form-control bg-light mt-1" id="password2" aria-describedby="passwordChkDiv" onfocusout="pwChk()">
	    	<label for="floatingPassword">비밀번호확인</label>
	    	<small id="passwordChkDiv" class="text-muted">
     			
    		</small>
	    	
	    </div>
	    <div class="form-floating">
	    	<input type="text" class="form-control bg-light mt-3" id="name" onfocusout="nameChk()">
	    	<label for="floatingInput">성명</label>
	    	<small id="nameChkDiv" class="text-muted">
     			
    		</small>
	    </div>
	    <!-- errMsg -->
	    <div class="h6 mb-3 fw-normal" id="errMsg"></div>
		<!-- login button -->
	    <button class="w-100 btn btn-lg btn-primary mb-3" type="button" onclick="validateEncryptForm();">계정생성</button>
	    
	</main>
    <!-- hidden values -->
    <input type="hidden" id="rsaPulbicKeyModulus" value="${publicKeyModulus}">
	<input type="hidden" id="rsaPulbicKeyExponent" value="${publicKeyExponent}">
</body>
</html>