<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>잡집사</title>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
}

header {
	display: flex;
	align-items: center; /* 수직 중앙 정렬 */
	justify-content: center; /* 중앙 정렬 */
	position: relative; /* 자식 요소의 절대 위치를 위한 기준 설정 */
	padding: 10px; /* 패딩 추가 */
}

.logo {
	position: absolute; /* 로고를 절대 위치로 설정 */
	left: 20px; /* 왼쪽 여백 */
}

.search-container {
	flex-grow: 1; /* 검색 컨테이너가 남은 공간을 차지하도록 설정 */
	text-align: center; /* 중앙 정렬 */
}

input[type="text"] {
	padding: 10px; /* 입력 필드 패딩 */
	width: 300px; /* 입력 필드 너비 */
	border: 1px solid #ccc; /* 테두리 스타일 */
	border-radius: 4px; /* 모서리 둥글게 */
}
</style>
</head>
<body>
	<header>
		<img src="logo.png" alt="로고" />
		<div class="search-container">
			<form action="/Common/RecruitSearch" method="get">
				<input type="text" name="recruit_title" placeholder="검색어를 입력해주세요⌕"> 채용 정보
			</form>
		</div>
		<nav>		
				<li><a href="/users/personalUsers/personalLoginFrom">로그인</a></li>
		</nav>
	</header>


</body>
</html>

