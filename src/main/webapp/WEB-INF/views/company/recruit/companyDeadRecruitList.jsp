<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="/js/headerSubmenu.js" defer></script>
<style type="text/css">

.header-container {
   display: flex;
   justify-content: space-between;
   align-items: center;
   background-color: #ffffff;
   padding: 20px;
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.header-container h1 {
   margin: 0;
   font-size: 24px;
}

.separator {
    margin: 0 10px; /* 구분자의 여백 */
    font-weight: bold; /* 구분자 강조 */
}

nav ul {
   list-style-type: none;
   padding: 0;
   margin: 0;
   display: flex;
}

nav ul li {
   margin: 0 15px;
}

nav ul li a {
   text-decoration: none;
   color: #333;
}

.notification {
   display: flex;
   align-items: center;
}

.notification button {
   margin-left: 10px;
}

.container {
   max-width: 1200px;
   margin: 20px auto;
   padding: 20px;
   background-color: #ffffff;
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

h2 {
   margin: 0;
}

.tabs {
    display: flex; /* Flexbox 사용 */
    justify-content: space-between; /* 양쪽 끝에 배치 */
    align-items: center; /* 수직 중앙 정렬 */
    margin-bottom: 20px; /* 아래쪽 여백 */
}

.link-container {
    display: flex; /* 링크들을 가로로 배치 */
    align-items: center; /* 세로 중앙 정렬 */
    margin-right: 680px; /* h2 오른쪽에 여백 추가 */
}
.tabs span {
   margin-right: 20px;
   cursor: pointer;
   padding: 5px 10px;
   border-radius: 5px;
}

.tabs .active {
   background-color: #007bff;
   color: white;
}

.job-list {
   display: flex;
   flex-wrap: wrap;
}

.job-card {
	background-color: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 15px;
	margin: 10px;
	flex: 1 1 calc(33% - 20px);
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	 width: 360px;

    height: 200px;
      flex-direction: column; /* 세로 방향으로 배치 */
    justify-content: space-between; /* 내용 간의 간격을 조정하여 아래로 밀기 */
    display: flex; /* Flexbox 사용 */
      position: relative; /* 위치 설정 */
}

.job-header {
    display: flex; /* Flexbox 사용 */
    justify-content: space-between; /* 양 끝에 배치 */
    align-items: center; /* 수직 중앙 정렬 */
}

.toggle-btn {
    cursor: pointer; /* 클릭 가능하게 설정 */
    margin-left: 10px; /* 제목과 아이콘 간의 여백 */
}

.details {
   display: none;
          position: absolute;
          top: 30px;
          right: 0;
          padding: 12px 20px;
          background: #fff;
          border-radius: 8px;
          font-weight: 500;
}

.job-card h3 {
   margin: 0 0 10px 0;
}

.job-card .delete {
   color: red;
   cursor: pointer;
}

.add-button {
    background-color: #e63946; /* 버튼 배경색 */
    color: white; /* 버튼 글자색 */
    padding: 10px 15px; /* 버튼 패딩 */
    border-radius: 4px; /* 둥근 모서리 */
    text-decoration: none; /* 밑줄 제거 */
}
.add-button:hover {
   background-color: #0056b3;
}
.job-info {
    display: flex; /* Flexbox 사용 */
    justify-content: space-between; /* 양끝에 위치하게 */
    margin-top: 10px; /* 위쪽 여백 추가 (선택 사항) */
     margin-top: auto; /* 위쪽 여백을 자동으로 설정하여 아래로 밀기 */
}
.job-info {
    display: flex; /* Flexbox 사용 */
    justify-content: space-between; /* 양끝에 위치하게 */
    margin-top: 10px; /* 위쪽 여백 추가 (선택 사항) */
     margin-top: auto; /* 위쪽 여백을 자동으로 설정하여 아래로 밀기 */
}
.highlight {
color: red;   
font-weight: bold;
}

</style>
<title>채용공고 관리</title>
</head>
<body>
   <%@include file="/WEB-INF/includes/headerCompanyUser.jsp"%>
<main>
    <div class="container">
        <div class="tabs">
            <h2>채용공고 관리</h2>
            <div class="link-container">
                <a href="/CompanyRecruit/RecruitList">전체</a>
                <span class="separator">|</span>
                <a href="/CompanyRecruit/DeadRecruittList"  class="highlight">마감된 공고</a>
            </div>
            <a href="/CompanyRecruit/RecruitWriteForm" class="add-button">채용공고 추가</a>
        </div>
<div class="job-list">
    <c:forEach var="companyRecruitDeadList" items="${companyRecruitDeadList}">
        <div class="job-card">
         <div class="job-header">
                <h3>${companyRecruitDeadList.RECRUIT_TITLE}</h3>
                <div class="toggle-btn" onclick="toggleDetails(this)">
                    <img src="/images/icon/toggle.png" alt="토글 아이콘" />
                </div>
            </div>
            <div class="details" style="display: none;">
                <p><a href="/CompanyRecruit/CompanyRecruitUpdateForm?company_recruit_idx=${companyRecruitDeadList.COMPANY_RECRUIT_IDX}">공고 수정</a></p>
                <p class="delete">공고 삭제</p>
            </div>
            <p class="job-info">
                <span>지원자&nbsp;<strong>${companyRecruitDeadList.APPLICATION_COUNT}명</strong></span>
                <span>${companyRecruitDeadList.COMPANY_RECRUIT_REGDATE} 등록</span>
            </p>
        </div>
    </c:forEach>
</div>

    </div>
</main>
<script>
function toggleDetails(element) {
    const details = element.closest('.job-card').querySelector('.details'); // 부모 요소에서 .details 선택
    if (details.style.display === "none" || details.style.display === "") {
        details.style.display = "block"; // 펼치기
    } else {
        details.style.display = "none"; // 접기
    }
}
</script>
</body>
</html>
