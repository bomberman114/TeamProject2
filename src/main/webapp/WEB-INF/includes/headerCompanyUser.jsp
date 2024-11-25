<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="login-header">
    <div class="inner">
      <div class="header-left">
        <h1>
          <a href="/"><img src="/images/logo.svg" alt="잡집사 로고" /></a>
        </h1>
        <ul class="user-nav">
          <li><a href="/Users/MyPage/Home">마이홈</a></li>
          <li><a href="/Users/MyPage/Resume/List">채용공고 관리</a></li>
          <li><a href="#">스크랩</a></li>
          <li><a href="#">지원자관리</a></li>
          <li><a href="#">메시지</a></li>
        </ul>
      </div>
      <ul class="header-right logined">
        <li class="user">
          <span class="bedge">회사</span>${companylogin.company_user_name}
          <ul class="submenu">
	      		<li><a href="/Users/MyPage/Home">마이페이지</a></li>
	      		<li><a href="/Users/MyPage/UpdateForm">회사회원정보수정</a></li>
	      		<li><a href="/Users/Logout">로그아웃</a></li>
          </ul>
        </li>
        <li class="home-btn"><a href="/">잡집사 홈</a></li>
      </ul>
    </div>
  </header>