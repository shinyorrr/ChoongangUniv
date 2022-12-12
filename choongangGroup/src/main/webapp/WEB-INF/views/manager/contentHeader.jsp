<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <div class="col-12 pt-4" style="height: 150px; background-color: rgb(95, 142, 241)">
                <div class="row">
                   <div class="col-6">
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
                  <div class="col-4">
                     <div style="width: 535px;line-height: 100px;color: white;font-size: 77px;text-align:center;" id="clock">
                  </div>
                  </div>
                  <div class="col-1">
                     <button type="button" class="btn btn-secondary" style="width: 100px;height: 43px;margin: 5px;" onclick="attInsert()">출근</button>
                     <button type="button" class="btn btn-secondary" style="width: 100px;height: 43px;margin: 5px;" onclick="attOff()">퇴근</button>
                  </div>
              </div>
                
            </div>
            <main class="col-9 h-100 w-100">
                <div class="row m-5">
</body>
</html>