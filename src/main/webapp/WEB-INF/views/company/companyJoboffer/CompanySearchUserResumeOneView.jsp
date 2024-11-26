<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
    <script src="/js/inputForm.js" defer></script>
  </head>
  <body>
    <%@include file="/WEB-INF/includes/headerCompanyUser.jsp"%>
    <main class="write-form">
      <form action="/Users/MyPage/Resume/UpdateForm" method="post">
      	<input type="hidden" name="user_resume_idx" value="${vo.USER_RESUME_IDX}">
        <div class="inner">
          <div class="resume-container">
            <div class="resume-content">
              <div class="user-info">
                <div class="user-img"></div>
                <div class="user-details">
                  <div class="user-util">
                    <h3>
                      ${vo.USER_NAME}
                      <c:if test="${not empty vo.CAREER_TYPE}"><span class="career-type">경력</span></c:if>
                      <c:if test="${empty vo.CAREER_TYPE}"><span class="career-type">신입</span></c:if>
                    </h3>
                  </div>
                  <ul>
                    <li>
                      <img
                        src="/images/icon/Calendar.png"
                        alt="생년월일"
                      />${vo.USER_BIRTH}년생(${vo.USER_GENDER})
                    </li>
                    <li>
                      <img
                        src="/images/icon/Phone.png"
                        alt="전화번호"
                      />${vo.USER_PHONE}
                    </li>
                    <li>
                      <img src="/images/icon/Mail.png" alt="이메일" />
                      ${vo.USER_EMAIL}
                    </li>
                  </ul>
                </div>
              </div>
              <ul class="resume-details">
                <li class="view-flex">
                  <p>지역</p>
                  <ul>
                  	<li>${vo.REGION_NAME}</li>
                  	<li>${vo.REGION_ADDRESS}</li>
                  </ul>
                </li>
                <li class="view-flex">
                  <p>직무</p>
   								<h3>${vo.COMMON_DUTY_NAME}</h3>
                </li>
	                <li class="stack-input-li">
	                  <p>기술스택(업무 툴/스킬)</p>
	                  <ul class="select-stack-list">
	                  	<c:forEach var="skill" items="${vo.SKILLS}">
	                  	 <c:if test="${not empty skill}">
	                  	  <li>${skill}</li>	                  	
	                  	 </c:if>
	                  	 <c:if test="${empty skill}">
	                  	  <li>등록된 기술스택이 없습니다.</li>	                  	
	                  	 </c:if>
	                  	</c:forEach>
	                  </ul>
	                </li>
                <li>
                  <p class="punder">학력</p>
                  <div class="edu-inner">
                    <div class="view-edu-status">
                   		${vo.EDUCATION_STATUS_TYPE}
                    </div>
                    <span><img src="/images/icon/space-bar.png" alt="여백바"></span>
                    <input type="text" value="${vo.USER_SCHOOL_NAME}" readonly="readonly">
                  </div>
                </li>
                <li>
                  <p class="punder">경력(업무경험)</p>
                  <div class="career-inner">
	                  <c:if test="${not empty vo.CAREER_TYPE}">
		                  	   <div class="date-input">
				                      <input type="text" value="${vo.USER_WOOKED_YEAR_START}" readonly="readonly"> 
				                      <span>~</span>
				                      <input type="text" value="${vo.USER_WOOKED_YEAR_END}" readonly="readonly">
				                    </div>
				                    <span><img src="/images/icon/space-bar.png" alt=""></span>
				                    <div class="career-info">
				                      <input type="text" value="${vo.USER_WOOKED_COMPANY_NAME}">
				                      <textarea readonly="readonly">${vo.USER_CAREER_CONTENTE}</textarea>
				                    </div>                 	
		                </c:if>
	                  <c:if test="${empty vo.CAREER_TYPE}">
	                  	<ul class="select-stack-list">
	                    	<li>등록된 경력이 없습니다.</li>	                  	
	                  	</ul>
	                  </c:if>
                   
                  </div>
                </li>
                <li class="intro-inner">
                  <p class="punder">자기소개서</p>
                  <input
                    type="text"
                    value = "${vo.USER_RESUME_INTRO_TITLE}"
                    readonly="readonly"
                  />
                  <textarea name="user_resume_intro_content" readonly="readonly">${vo.USER_RESUME_INTRO_CONTENT}</textarea>
                </li>
              </ul>
            </div>
          </div>
          <aside>
          	<div class="aside-inner aside-view">
	            <h3>${vo.USER_TITLE}</h3>
	            <div class="write-btn-container">
	              <button class="write-btn">채용제의</button>
	              <button class="write-btn">스크랩</button>
	              <a href="/Company/SearchResumes">돌아가기</a>
	            </div>  	
          	</div>
          </aside>
        </div>
      </form>
    </main>
  </body>
</html>

