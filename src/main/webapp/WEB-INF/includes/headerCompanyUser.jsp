<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="login-header">
    <div class="inner">
      <div class="header-left">
        <h1>
          <a href="/"><img src="/images/logo.svg" alt="잡집사 로고" /></a>
        </h1>
        <ul class="user-nav">
          <li><a href="/Company/CompanyMypage">마이홈</a></li>
          <li><a href="/CompanyRecruit/RecruitList">채용공고 관리</a></li>

          <li><a href="/Company/SearchResumes">지원자검색</a></li>
          <li><a href="/CompanyApply/CompanyRecruitApplyUserResumeAllList">지원자관리</a></li>
          <li><a href="/Joboffer/JobOfferRoomComapnyUser">메시지</a></li>
        </ul>
      </div>
      <ul class="header-right logined">
        <li class="user">
          <span class="bedge role-company">회사</span>${companylogin.company_user_name}
          <ul class="submenu">
	      		<li><a href="/Company/CompanyMypageUpdateForm">회사회원정보수정</a></li>
	      		<li><a href="/Company/Logout">로그아웃</a></li>
          </ul>
        </li>
        <li class="home-btn"><a href="/">잡집사 홈</a></li>
      </ul>
    </div>
  </header>