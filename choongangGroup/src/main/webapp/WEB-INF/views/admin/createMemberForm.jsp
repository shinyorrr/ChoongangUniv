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
		idChk();
		pwChk();
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
		
	function idChk() {
		var username = document.getElementById("username").value;
		var result   = document.getElementById("idChkResult");
		var chkresult; 
		if(!username) {
			result.innerHTML='아이디를 입력해주세요';
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
	
	function pwChk() {
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
<body>
    <form>
        <select id="role" name="role" onchange="changeRole()">
            <option value="ROLE_STUDENT">학생</option>
            <option value="ROLE_MANAGER">교직원</option>
            <option value="ROLE_PROFESSOR">교수</option>
            <option value="ROLE_ADMIN">관리자</option>
        </select>
        
        <!-- 계정 공통 기본 정보 -->
        <div>
        	아이디<input type="text"     id="username" name="username" onfocusout="idChk()" required><p>
        	<div id="idChkResult"></div><p>
        	비밀번호<input type="password"     id="password"  name="password" required><p>
        	비밀번호확인<input type="password" id="password2" name="password2" onfocusout="pwChk()" required><p>
        	<div id="passwordChkDiv"></div><p>
        	성명<input type="text"     id="name"     name="name"     required>
        </div>

        <!-- Role별 추가 정보 -->
        <div id="roleAdd">
        	<div>학생정보</div>
        </div>
        
        <!-- errMsg -->
        <div id="errMsg">
        </div>
    </form>
    <!-- login button -->
	<button class="w-100 btn btn-lg btn-primary mb-3" type="button" onclick="validateEncryptForm();">생성</button>
    <!-- hidden values -->
    <input type="hidden" id="rsaPulbicKeyModulus" value="${publicKeyModulus}">
	<input type="hidden" id="rsaPulbicKeyExponent" value="${publicKeyExponent}">
</body>
</html>