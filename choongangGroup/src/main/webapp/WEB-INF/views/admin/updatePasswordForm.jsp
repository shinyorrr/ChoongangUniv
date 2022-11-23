<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script type="text/javascript">
	// 검사 후 ajax로 데이터 전송
	function validateEncryptForm() {
		var currentPw = document.getElementById("currentPw").value;
		var password  = document.getElementById("password").value;
		var password2 = document.getElementById("password2").value;
		if (!currentPw || !password || !password2) {
			alert("입력란을 모두 입력해주세요");
			return false;
		}

		if (pwChk() == false) {
			alert("현재 비밀번호가 일치하지 않습니다.");
			currentPw.className = 'form-control bg-light is-invalid mt-3'
			return false;
		}
		if (pw12Chk() == false) {
			alert("새 비밀번호를 확인해주세요.");
			return false;
		}
		
		try {
			var rsaPulbicKeyModulus = document.getElementById("rsaPulbicKeyModulus").value;
			var rsaPulbicKeyExponent = document.getElementById("rsaPulbicKeyExponent").value;
			submitEncryptedForm(password , rsaPulbicKeyModulus , rsaPulbicKeyExponent);
		} catch (err) {
			alert(err);
		}
		return false;
	}
	function submitEncryptedForm(password , rsaPulbicKeyModulus , rsaPulbicKeyExponent) {
		var rsa = new RSAKey();
		rsa.setPublic(rsaPulbicKeyModulus , rsaPulbicKeyExponent);
		var securedPassword = rsa.encrypt(password);
		// 모든 조건을 만족한다면 요청 실행.
		// ajax 요청
		let member = {};
		member.password = securedPassword;
		
		$.ajax({
			type: "post",
			url: "/admin/updatePassword",
			data: member,
			success: function(data) {
				alert('비밀번호 변경 성공');
				console.log(data);
				location.href = data;
			},
			error: function(e) {
				$('#errMsg').html('서버오류');
			}
		});
	}
	// 비밀번호 DB확인 ajax
	function pwChk() {
		var currentPw = document.getElementById("currentPw");
		var result    = document.getElementById("CchkResult");
		var chkresult; 
		if(!currentPw.value) {
			result.innerHTML='현재 비밀번호를 입력해주세요';
			currentPw.className = 'form-control bg-light mt-1 is-invalid';
			return false;
			} else {
				$.ajax({
					url: "/admin/pwCheck",
					type: "post",
					async: false,
					data: {
						password: currentPw.value
					},
					success: function(data) {
						if(data == "0") {
							result.innerHTML='현재 비밀번호가 일치하지 않습니다';
							currentPw.className = 'form-control bg-light mt-1 is-invalid';
							chkresult = false;
						} else if(data == "1"){
							result.innerHTML='현재 비밀번호가 일치합니다';
							currentPw.className = 'form-control bg-light mt-1 is-valid';
							chkresult = true;
						}
						
					},
					error: function() {
						alert("서버요청실패 관리자에게 문의하세요");
						chkresult = false;
					}
				});
			}
		
		
		return chkresult;
	}
	// 비밀번호1,2 확인 function
	function pw12Chk() {
		var pw1 = document.getElementById("password");
		var pw2 = document.getElementById("password2");
		var currentPw = document.getElementById("currentPw");
		var result = document.getElementById("NchkResult");
		var result2 = document.getElementById("NchkResult2");
		if(!pw1.value || !pw2.value) {
			result.innerHTML='새 비밀번호를 입력해주세요';
			pw1.className = "form-control bg-light mt-3 is-invalid";
			pw2.className = "form-control bg-light mt-1 is-invalid";
			return false;
		}
		if(pw1.value == pw2.value && pw1.value == currentPw.value) {
			result2.innerHTML='현재 비밀번호와 새 비밀번호가 같을 수 없습니다.';
			pw1.className = "form-control bg-light mt-3 is-invalid";
			pw2.className = "form-control bg-light mt-1 is-invalid";
			return false;
		} 
		if(pw1.value == pw2.value && pw1.value != currentPw.value) {
			result2.innerHTML='';
			pw1.className       = "form-control bg-light mt-3 is-valid";
			pw2.className       = "form-control bg-light mt-1 is-valid";
			currentPw.className = "form-control bg-light mt-1 is-valid";
		}
		if(pw1.value != null && pw2.value != null && pw1.value == pw2.value) {
			result.innerHTML='새 비밀번호가 일치합니다';
			pw1.className       = "form-control bg-light mt-3 is-valid";
			pw2.className       = "form-control bg-light mt-1 is-valid";
			return true;
		}
		if(pw1.value != null && pw1.value != pw2.value) {
			result.innerHTML='새 비밀번호가 일치하지 않습니다';
			pw1.className = "form-control bg-light mt-3 is-invalid";
			pw2.className = "form-control bg-light mt-1 is-invalid";
			return false;
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
</head>
<body>
	<main class="container position-absolute top-50 start-50 translate-middle form-signin w-100 m-auto text-center">
		<h1 class="mb-5 fw-bold">비밀번호 변경</h1>
		<div class="form-floating">
			<input type="password" class="form-control bg-light mt-1" id="currentPw" aria-describedby="passwordChkDiv" onfocusout="pwChk()">
			<label for="floatingPassword">현재 비밀번호</label>
			<small id="CchkResult" class="text-muted"></small>
		</div>
		<div class="form-floating">
			<input type="password" class="form-control bg-light mt-3" id="password">
			<label for="floatingPassword">새 비밀번호</label>
		</div>
		<div class="form-floating d-flex flex-column">
			<input type="password" class="form-control bg-light mt-1" id="password2" aria-describedby="passwordChkDiv" onfocusout="pw12Chk()">
			<label for="floatingPassword">새 비밀번호 확인</label>
			<small id="NchkResult" class="text-muted"></small>
			<small id="NchkResult2" class="text-muted"></small>
		</div>
		<button class="w-100 btn btn-lg btn-primary mb-3 mt-3" type="button" onclick="validateEncryptForm();">비밀번호 변경</button>
	</main>
<!-- hidden values -->
<input type="hidden" id="rsaPulbicKeyModulus" value="${publicKeyModulus}">
<input type="hidden" id="rsaPulbicKeyExponent" value="${publicKeyExponent}">
</body>
</html>