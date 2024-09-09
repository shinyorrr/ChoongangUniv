
<div align=center><img width="750" src="https://github.com/shinyorrr/ChoongangUniv/assets/113576529/cf5f1dcc-3b77-4d2e-baa7-cfd79047c0f1.PNG">
</div>

<div align=center>
  
# Choongang University | 대학교 종합 포탈 시스템 
</div>
<br>

## 목차
 1. [서비스 소개](#서비스-소개)
 2. [주요 기능](#주요-기능)
 3. [개발 기간](#개발-기간)
 4. [팀원 소개](#팀원-소개)
 5. [팀원별 개발 내용](#팀원별-개발-내용)
 6. [구현 완료 화면](#구현-완료-화면)
 7. [기술 스택](#기술-스택)
<br>

## 🎓서비스 소개
> **중앙대학교 학사포탈 시스템은 학생부터 교수, 교직원(관리자)까지   
> 모두가 함께 사용 할 수 있는 종합 포탈 시스템입니다.
> <br>  
> 대학교에 꼭 필요한 서비스를 쉽고 간편하게 제공합니다.**
<br>

## ✨주요 기능
* ✍ 학생 파트
  - 수강신청 장바구니 기능 및 강의 신청
  - 본인의 학적,성적 조회 및 관리
  - 강의 평가 작성 
  - 과제 파일 제출
  - 수강 과목의 교재 구매
  
* 👨‍🏫 교수 파트
  - 본인 강의 수강학생 성적 입력
  - 강의계획서 작성 및 조회
  - 전자 출석부
  - 강의 개설 신청
  
* 👨‍💼 교직원(관리자) 파트
  - 공지사항을 올리고 관리
  - 직원 간의 쪽지 주고 받기 기능
  - 전자결재 시스템
  - 신규강의 개설 승인 및 개설강의 정보 관리
  - 강의 휴보강 및 근태 관리
  - 마이페이지(회원관리)
<br>

## 📅개발 기간
> **2022/11/01 ~ 2022/12/20**
<br>

## 👪팀원 소개

|<img src="https://github.com/shinyorrr/ChoongangUniv/assets/113576529/821d9dea-a35d-498f-b870-9e82ebce2da7.png" width="100">|<img src="https://github.com/shinyorrr/ChoongangUniv/assets/113576529/8508ef63-4377-41a6-99ff-b5c7b29a69df.png" width="100">|<img src="https://github.com/shinyorrr/ChoongangUniv/assets/113576529/3f64e341-0eda-44ea-8617-db75207f5b6a.png" width="100">|<img src="https://avatars.githubusercontent.com/u/110139001?v=4.png" width="100">|<img src="https://avatars.githubusercontent.com/u/113097373?v=4.png" width="100">|<img src="https://avatars.githubusercontent.com/u/109948713?v=4.png" width="100">|<img src="https://avatars.githubusercontent.com/u/110706407?v=4.png" width="100">|<img src="https://avatars.githubusercontent.com/u/108061839?v=4.png" width="100">|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|[손신효<br>(학생)](https://github.com/shinyorrr)|[공현지<br>(학생)](https://github.com/hyeonji22)|[이례영<br>(학생)](https://github.com/LEERYEYEONG)|[👑한창훈<br>(교직원)](https://github.com/bluemindhan)|[최혜선<br>(교직원)](https://github.com/Hyesun112)|[오태우<br>(교직원)](https://github.com/oreoWoo)|[신동호<br>(관리자)](https://github.com/sharru0701)|[허유나<br>(교수)](https://github.com/Youna2022)|

<br>

## 🧩팀원별 개발 내용

|**이름**|**역할**|**개발 내용**|
|:---:|:---:|:---:|
|손신효|Back-end (학생)|수강신청 기간 설정/기간 외 검사<br>수강신청,장바구니 중복 검사<br>전체 강의,장바구니 목록 조회/검색<br>수강신청,장바구니 신청<br>시간표 조회<br>과제 파일 업로드<br>사용자 정보 표시|
|공현지|Back-end (학생)|학적 조회 및 수정<br>성적 조회<br>강의 평가 입력/수정|
|이례영|Back-end (학생)|교재 관리<br>도서 구매|
|한창훈|Back-end (교직원)|근태 관리<br>부서 관리<br>주소록 관리<br>강의 평가 조회|
|최혜선|Back-end (교직원)|결재<br>강의 관리<br>학사 관리<br>교직원-마이페이지|
|오태우|Back-end (교직원)|공지사항<br>쪽지|
|신동호|Back-end (관리자)|메인페이지<br>회원 계정 관리<br>과제 관리<br>강의 계획서 관리<br>휴/보강 신청|
|허유나|Back-end (교수)|메인페이지<br>강의 개설 관리<br>성적 관리<br>출석 관리<br>교수-마이페이지|

<br>

## 🖥구현 완료 화면

<details>
  <summary > 수강신청 기간 설정 </summary>
  
  ### 📆 수강신청 기간 설정
  
  * 관리자 계정으로 로그인 후 기간 관리 탭
  * 일정(장바구니/수강신청)을 드롭다운 목록에서 선택
  * 날짜 입력 형태 (직접 YYMMDD 형식으로 입력/캘린더에서 선택)
  * 현재시간 기준, 오늘 이전의 날짜는 자동 선택 불가 처리
  
  ![장바구니-수강신청-등록](https://github.com/choongang2022/team-project/assets/113576529/48c21f06-521c-412a-8302-940c3e795746)
</details>
   
<details>
  <summary> 기간 확인 </summary>
  
  ### ⏰기간 확인
  
  * 오늘 기준, 기간에 해당 되지 않으면 빨간 글씨로 경고문구 표시
  * 기간 외에 버튼 클릭 시 경고 창 띄우고 접근 제한
  
  ![기간외접근](https://github.com/shinyorrr/ChoongangUniv/assets/113576529/e67ed0e6-d667-48f1-a70a-b08e474404cd)
  
  <br>
  
  ▫ 예시) 현재 날짜 : 6/16일 
  
  <img width="800" alt="둘다x" src="https://github.com/shinyorrr/ChoongangUniv/assets/113576529/b98a8281-7de5-4146-a525-3e8c37739115"><br>
  
  ▫ 예시) 현재 날짜 : 6/14일 
  
  <img width="800" alt="하나만" src="https://github.com/shinyorrr/ChoongangUniv/assets/113576529/aa25a5f0-0730-4a42-a244-b3f6efe125c2"><br>
 

</details>

<details>
  <summary> 장바구니 </summary>
  
  ### ❤️장바구니 담기

  * 서버 시간 기준으로 현재 년도, 학기에 개설된 강의 목록 조회
  * 강의 제목으로 검색 기능
  * 학기 바뀔 때 마다 누적학점 초기화
  * 장바구니에 강의를 담을 때 반응형으로 담는 즉시 시간표에 추가 후 화면에 표시
  * 총 신청 학점 표시

  ![장바구니 등록](https://github.com/shinyorrr/ChoongangUniv/assets/113576529/147c2b06-7665-4474-bc99-42c6c5228704)

  ### ❤️장바구니 목록 페이징
  
  * 강의 목록 페이지 형식으로 표시

  ![장바구니-삭제](https://github.com/user-attachments/assets/5611a556-e17f-4aed-a497-7e5e57b8eb61)
  
  ### ❤️장바구니 삭제  
  
  * 담은 강의 삭제 가능
  * 삭제시 신청 학점 변경
  * 삭제시 시간표 변경

  ![장바구니-페이지](https://github.com/user-attachments/assets/3674a85a-1c5f-4197-9b14-7b5b801bcf72)
  
  <br>
  
</details>

<details>
  <summary> 장바구니 중복 체크 </summary>
  <br>
  * 각 오류 상황별로 어떤 문제인지 알림 창 표시
  
   ### ❤️장바구니 시간 중복
  ▫ 예시) 목요일 6,7교시가 중복되는 강의 신청 시 
  
   ![시간 중복](https://github.com/shinyorrr/ChoongangUniv/assets/113576529/b01c2878-6557-41eb-a228-8afc538be1c0)
   
   ### ❤️장바구니 강의 중복
   ▫ 예시) 기존에 신청한 자바1, 자바2, 자바기초 강의 신청 시
   
   ![강의-중복](https://github.com/shinyorrr/ChoongangUniv/assets/113576529/7273fec1-e8fa-47c5-865a-e93369db36ce)
   
   ### ❤️장바구니 최대 신청학점 체크
   ▫ 예시) 최대 학점인 21학점 신청 상태에서, 알고리즘(1학점) 강의 신청 시
   
   ![학점초과방지](https://github.com/user-attachments/assets/6a218051-9cd3-4025-a9c8-c4ab6e7da73e)
  
</details>

<details>
  <summary> 수강 신청 </summary>
  
  ### ✨ 수강 신청 목록

  * '전체 강의 / 장바구니 신청한 강의' 중 선택해서 강의 목록 불러오기

  <img width="800" alt="수강신청 목록" src="https://github.com/user-attachments/assets/a9406563-6930-48fb-9e36-3abc606be228">
  
  ![수강신청](https://github.com/user-attachments/assets/4ab93122-9e53-4b04-a5eb-703096001b82)
  

  ### ✨ 수강 신청 중복 검사
  
  * 중복 검사 기능

  ![수강신청-중복](https://github.com/user-attachments/assets/338c22fb-a678-49be-8ebb-48781f564b49)

</details>

<details>
  <summary> 과제 제출 </summary>

 ### 🧩 과제 제출
 
 * 메인 화면 - 과제 제출 (오늘의 강의)
   
 ![메인-과제제출-_online-video-cutter com_](https://github.com/user-attachments/assets/c7531295-2496-4c96-bbdc-94ce108e0d67)

 * 사이드바 - 과제 제출  / 예시) 'aaaa.txt' 파일 제출
   
 ![메뉴바-과제제출-_online-video-cutter com__1](https://github.com/user-attachments/assets/3a08ec9f-07e4-450e-a772-712872a99c94)

 * 제출 완료 시, 해당 교수가 확인 가능  / 예시) 'aaaa.txt' 파일 확인 가능

 ![과제제출 교수화면](https://github.com/user-attachments/assets/cebc0696-2b6a-4cad-adf0-9de37389504c)  

</details>
<br>

## 🛠기술 스택

<div align=center>
<img src="https://github.com/shinyorrr/ChoongangUniv/assets/113576529/c6363b5f-d4e6-448a-8950-52a356ad9ddd.png" width="800"> 
  <br>
<img src="https://img.shields.io/badge/JAVA-007396?style=for-the-badge&logo=Java&logoColor=white"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=for-the-badge&logo=Spring Boot&logoColor=white"> 
<img src="https://img.shields.io/badge/Spring Security-6DB33F?style=for-the-badge&logo=Spring Security&logoColor=white">
<img src="https://img.shields.io/badge/Jpa-006643?style=for-the-badge&logo=jpa&logoColor=white">
<img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
<img src="https://img.shields.io/badge/Gradle-02303A?style=for-the-badge&logo=Gradle&logoColor=white">
<img src="https://img.shields.io/badge/Jsp-41454A?style=for-the-badge&logo=jsp&logoColor=white">
  <br>
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
<img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
<img src="https://img.shields.io/badge/Ajax-34567C?style=for-the-badge&logo=ajax&logoColor=white">
<img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white">
<img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
<img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">
<img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
</div>

<br>
