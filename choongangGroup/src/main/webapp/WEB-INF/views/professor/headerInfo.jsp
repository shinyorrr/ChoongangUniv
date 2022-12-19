<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
<div class="col-12 px-5 py-4" style=" background-color: rgb(95, 142, 241)">
	<div class="d-flex flex-row mb-2 mt-2">
		<div>
			<span class="text-white h4">안녕하세요. <span class="fw-bold">${member.name}</span>님!</span>
		</div>
			<div class="border border-1 border-white rounded-pill text-white ms-2"  style="height: 25px;">
				<div class="font09 align-items-center">&nbsp; 교수  &nbsp;</div>
			</div>
			 <div style=" cursor: pointer;" onclick="location.href='/professor/mypage';"><i class="text-white bi-gear-fill mx-2" ></i></div>
	</div>
	<div class="row">
		<div><span class="text-white font09">${member.major} | ${member.position} </span></div>
	</div>
	 <div class="d-flex flex-low mb-2">
		<div><i class="bi bi-envelope-fill text-white"></i></div>
		<div><span class="text-white ms-2 font09">${member.email}</span></div>
	</div>
</div>
</body>
</html>