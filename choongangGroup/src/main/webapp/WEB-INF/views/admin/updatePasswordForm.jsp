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
	function validateEncryptForm() {
		var currentPw = document.getElementById("currentPw").value;
		var password  = document.getElementById("password").value;
		var password2 = document.getElementById("password2").value;
		if (!currentPw || !password || !password2) {
			alert("입력란을 모두 입력해주세요");
			return false;
		}
		pwChk();
		pw12Chk();
		if (pwChk() == false) {
			alert("현재 비밀번호가 일치하지 않습니다.");
			return false;
		}
		if (pwChk() == false) {
			alert("비밀번호 확인 불일치");
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
	
	function pwChk() {
		var password = document.getElementById("password").value;
		var result   = document.getElementById("idChkResult");
		var chkresult; 
		if(!password) {
			result.innerHTML='비밀번호를 입력해주세요';
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
					chkresult = false;
				} else if(data == "1"){
					result.innerHTML='사용할 수 있는 아이디입니다.';
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



function pw12Chk() {
	var pw1 = document.getElementById("password").value;
	var pw2 = document.getElementById("password2").value;
	var result = document.getElementById("passwordChkDiv");
	if(!pw1 || !pw2) {
		result.innerHTML='비밀번호를 입력해주세요';
		return false;
	}
	if(pw1 != null && pw1 != pw2) {
		result.innerHTML='비밀번호가 일치하지 않습니다';
		return false;
	} 
	if(pw1 != null && pw2 != null && pw1 == pw2) {
		result.innerHTML='비밀번호가 일치합니다';
		return true;
	}
}
</script>
</head>
<body>
현재비밀번호    <input type="password" id="currentPw" name="currentPw" required="required">
<div id="CchkResult"></div>
새 비밀번호     <input type="password" id="password"  name="password"  required="required">
새 비밀번호 확인<input type="password" id="password2" name="password2" required="required" onfocusout="pw12Chk()">
<div id="NchkResult"></div>
<button class="w-100 btn btn-lg btn-primary mb-3" type="button" onclick="validateEncryptForm();">변경</button>
</body>
</html>