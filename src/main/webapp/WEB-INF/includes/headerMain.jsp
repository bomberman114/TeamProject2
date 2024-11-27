<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
  <div class="inner">
    <div class="header-left">
      <h1>
        <a href="/"><img src="/images/logo.svg" alt="잡집사 로고" /></a>
      </h1>
      <div class="header-nav">
        <div class="search-div">
          <input type="text" name="search" placeholder="검색어를 입력해주세요." autocomplete="off"/>
          <div class="recent-list">
            <p><span>최근 검색</span><button class="recnet-remove-all" onclick="removeRecentAll()">전체삭제</button></p>
            <ul></ul>
          </div>
        </div>
        <ul>
          <li><a href="#">채용정보</a></li>
        </ul>
      </div>
    </div>
    <c:choose>
    	<c:when test="${not empty sessionScope.userLogin}">
    		<ul class="header-right logined">
		      <li class="user"><span class="bedge role-user">개인</span>${sessionScope.userLogin.user_name}
		      	<ul class="submenu">
		      		<li><a href="/Users/MyPage/Home">마이페이지</a></li>
		      		<li><a href="/Users/MyPage/UpdateForm">회원정보수정</a></li>
		      		<li><a href="/Users/Logout">로그아웃</a></li>
		      	</ul>
		      </li>
		    </ul>
    	</c:when>
    	<c:when test="${not empty sessionScope.companylogin}">
    		<ul class="header-right logined">
		      <li class="user"><span class="bedge role-company">기업</span>${sessionScope.companylogin.company_user_name}
		      	<ul class="submenu">
		      		<li><a href="/Company/Mypage/Home">마이페이지</a></li>
		      		<li><a href="/Company/Mypage/UpdateForm">회원정보수정</a></li>
		      		<li><a href="/Company/Logout">로그아웃</a></li>
		      	</ul>
		      </li>
		    </ul>
    	</c:when>
    	<c:otherwise>
		    <ul class="header-right">
		      <li><a href="/Users/LoginForm">로그인</a></li>
		      <li><img src="/images/icon/space-bar.png" alt="|" /></li>
		      <li><a href="/Users/RegisterForm">회원가입</a></li>
		    </ul>
    	</c:otherwise>
    </c:choose>
  </div>
</header>