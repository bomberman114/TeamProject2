<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"	 %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>잡집사</title>
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <script src="/js/headerSubmenu.js" defer></script>
  </head>
  <body>
  	<%@include file="/WEB-INF/includes/headerUser.jsp" %>
    <main class="mypage-home">
      <div class="inner">
        <aside>
          <div class="user-img">
          	<c:choose>
	            <c:when test="${not empty vo.USER_SFILE_NAME}">
          			<img class="profile-img" alt="" src="<c:url value='${vo.USER_SFILE_NAME}'/>">
          		</c:when>
          		<c:otherwise>
          		</c:otherwise>
          	</c:choose>
          </div>
          <ul class="user-menu">
            <li><a href="/Users/MyPage/UpdateForm">계정 정보 설정</a></li>
            <li><a href="#">계정 탈퇴</a></li>
          </ul>
        </aside>
        <div class="user-container">
          <h2>${vo.USER_NAME}</h2>
          <ul class="user-info">
            <li>
              <img src="/images/icon/Calendar.png" alt="달력" />${userBirth}년생(${vo.USER_GENDER})
            </li>
            <li>
              <img src="/images/icon/Phone.png" alt="달력" />${vo.USER_PHONE}
            </li>
            <li>
              <img src="/images/icon/Mail.png" alt="달력" />${vo.USER_EMAIL}
            </li>
          </ul>
          <h3>나의 현황</h3>
          <ul class="user-apply">
            <li>
              <a href="/Users/MyPage/Apply/List">
                <p>지원완료</p>
                <p>${userApplyCountList.SUBMITTED}</p>
              </a>
            </li>
            <li>
              <a href="/Users/MyPage/Apply/List">
                <p>서류통과</p>
                <p>${userApplyCountList.PAPER_PASSED}</p>
              </a>
            </li>
            <li>
              <a href="/Users/MyPage/Apply/List">
                <p>최종합격</p>
                <p>${userApplyCountList.PASS}</p>
              </a>
            </li>
            <li>
              <a href="/Users/MyPage/Apply/List">
                <p>불합격</p>
                <p>${userApplyCountList.FAIL}</p>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </main>
  </body>
</html>

