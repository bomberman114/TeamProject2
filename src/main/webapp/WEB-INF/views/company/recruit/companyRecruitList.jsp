<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

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
	margin: 20px 0;
	font-size: 18px;
}

.tabs span {
	margin-right: 20px;
	cursor: pointer;
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
}

.job-card h3 {
	margin: 0 0 10px 0;
}

.job-card .delete {
	color: red;
	cursor: pointer;
}

.add-button {
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.add-button:hover {
	background-color: #0056b3;
}
</style>
<title>채용공고 관리</title>
</head>
<body>
	<header>
		<div class="header-container">
			<h1>잡집사</h1>
			<nav>
				<ul>
					<li><a href="#">마이홈</a></li>
					<li><a href="#">채용공고</a></li>
					<li><a href="#">인재풀</a></li>
					<li><a href="#">스크랩</a></li>
					<li><a href="#">지원자 관리</a></li>
				</ul>
			</nav>
			<div class="notification">
				<span>기업회원</span>
				<button>잡집사 홈</button>
			</div>
		</div>
	</header>

	<main>
		<div class="container">
			<h2>채용공고 관리</h2>
			<div class="tabs">
				<span>전체</span> <span>마감된 공고</span>
			</div>
			<div class="job-list">
				<c:forEach var="companyRecruitList" items="${companyRecruitList}">
				<div class="job-card">
					<h3>${companyRecruitList.RECRUIT_TITLE }</h3>
					<p>공고 수정</p>
					<p class="delete">공고 삭제</p>
					<p>지원자 ${companyRecruitList.APPLICATION_COUNT }명</p>
					<p>${companyRecruitList.COMPANY_RECRUIT_REGDATE } 등록</p>
				</div>
				</c:forEach>
				
			</div>
			<button class="add-button">채용공고 추가</button>
		</div>
	</main>
</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용공고 목록</title>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&family=Poor+Story&display=swap" rel="stylesheet"> 
<style>     
</style>
</head>
<body>
   
</body>
</html>
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
