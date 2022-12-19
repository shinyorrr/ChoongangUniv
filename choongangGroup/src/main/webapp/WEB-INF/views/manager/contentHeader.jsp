<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div class="col-11 pt-4" style="height: 150px; background-color: rgb(95, 142, 241)">
                <div class="row">
                   <div class="col-5">
                      <div class="d-flex flex-row mb-3">
                          <div>
                              <span class="text-white h4">안녕하세요. <span class="fw-bold">${member.name }</span>님!</span>
                          </div>
                          <div>
                              <i class="text-white bi-gear-fill mx-2"></i>
                          </div>
                      </div>
                      <div class="row">
                          <div>
                              <span class="text-white h6">${member.dept.dname } | ${member.position }</span>
                          </div>
                      </div>
                      <div class="d-flex flex-low">
                          <div>
                              <i class="bi bi-envelope-fill text-white"></i>
                          </div>
                          <div>
                              <span class="text-white ms-3">${member.email }</span>
                          </div>
                      </div>
                  </div>
                  <div class="col-7">
                  	<div class = "row" style = "background-color : white; padding-right:10px;height: 106px;border-radius: 13px;">
                  		<div class="col-3" style="line-height: 93px;">
                  			<span id="date" style="font-weight: bold;float: left;font-size: 16px;margin-top: 6px;"></span>
                  		</div>
	                  	<div class ="col-5">
	                     <div class = "border border-4" style="width: 423px;line-height: 56px;color: black;font-size: 44px;text-align: center;float: right;margin: 13px;padding: 3px;" id="clock"></div>
	                  	</div>
	                  	<div class = "col-2" style="line-height: 88px">
	                     <button type="button" class="btn" style="width: 138px;height: 60px;font-size: 19px;font-weight: 600;background-color: #6699FF;color:white;margin-top: 10px;" onclick="attInsert()">출근</button>
	                  	</div>
	                  	<div class = "col-2" style="line-height: 88px">
	                     <button type="button" class="btn" style="width: 138px;color : white;height: 60px;font-size: 19px;font-weight: 600;margin-right: 5px;background-color: #99CCCC;margin-top: 10px;" onclick="attOff()">퇴근</button>
	                  	</div>
                  	</div>
                  </div>
              </div>
                
            </div>
            <div class="col-1"style="height: 150px; background-color: rgb(95, 142, 241)"></div>
            <main class="col-9 h-100 w-100">
                <div class="row m-5">
</body>
</html>