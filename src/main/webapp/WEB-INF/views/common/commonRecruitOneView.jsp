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
    <%@include file="/WEB-INF/includes/headerMain.jsp" %>
    <main class="write-form recruit-oneview">
        <div class="inner">
          <div class="resume-container">
            <div class="resume-content">
              <div>
                <div class="recruit-details">
                  <h3>${vo.RECRUIT_TITLE}</h3>
                  <p>${vo.COMPANY_NAME}</p>
                </div>
                <ul class="work-info">
                  <li>
                    <p>근무지역</p>
                    <ul>
                      <li>${vo.REGION_NAME}</li>
                      <li>
                        <img src="/images//icon/space-bar.png" alt="여백바" />
                      </li>
                      <li>${vo.COMPANY_ADDRESS}</li>
                    </ul>
                  </li>
                  <li>
                    <p>모집인원</p>
                    <ul>
                      <li>${vo.GETMAN}명</li>
                    </ul>
                  </li>
                  <li>
                    <p>마감일</p>
                    <ul>
                      <li>${vo.APPLICATION_DEADLINE}</li>
                    </ul>
                  </li>
                </ul>
              </div>
              <ul class="resume-details recruit-oneview-info">
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
                  <p>주요업무</p>
                  <ul class="list-style-circle">
                    	<c:if test="${not empty vo.MAIN_WORK_CONTENT1}"><li>${vo.MAIN_WORK_CONTENT1}</li></c:if>
                    	<c:if test="${not empty vo.MAIN_WORK_CONTENT2}"><li>${vo.MAIN_WORK_CONTENT2}</li></c:if>
                    	<c:if test="${not empty vo.MAIN_WORK_CONTENT3}"><li>${vo.MAIN_WORK_CONTENT3}</li></c:if>
                  </ul>
                </li>
                <li>
                  <p>자격요건</p>
 									<ul class="list-style-circle">
                    	<c:if test="${not empty vo.QUALIFICATION1}"><li>${vo.QUALIFICATION1}</li></c:if>
                    	<c:if test="${not empty vo.QUALIFICATION2}"><li>${vo.QUALIFICATION2}</li></c:if>
                    	<c:if test="${not empty vo.QUALIFICATION3}"><li>${vo.QUALIFICATION3}</li></c:if>
                  </ul>
                </li>
                <li >
                  <p>우대사항</p>
                  <ul class="list-style-circle">
                    	<c:if test="${not empty vo.PREFERENTIAL_TREATMENT1}"><li>${vo.PREFERENTIAL_TREATMENT1}</li></c:if>
                    	<c:if test="${not empty vo.PREFERENTIAL_TREATMENT2}"><li>${vo.PREFERENTIAL_TREATMENT3}</li></c:if>
                    	<c:if test="${not empty vo.PREFERENTIAL_TREATMENT3}"><li>${vo.PREFERENTIAL_TREATMENT2}</li></c:if>
                  </ul>
                </li>
                <li>
                  <p>회사소개</p>
                  <ul>
                    <li>${vo.COMPANY_INFO}</li>
                  </ul>
                </li>
              </ul>
            </div>
          </div>
          <aside>
            <div class="recruit-oneview-aside">
              <div class="company-info">
                <div class="company-img"></div>
                <div class="company-name">
                  <h5>${vo.COMPANY_NAME}</h5>
                  <a href="#">기업정보 보기</a>
                </div>
              </div>
              <ul>
                <li>업력</li>
                <li>${companyHistory.COMPANY_YEAR}년차<span>(${companyHistory.ESTABLISH } 설립)</span></li>
              </ul>
              <button class="apply-btn">지원하기</button>
              <p><img src="/images/icon/recruit-oneview-mark-off.png" alt="북마크 아이콘">스크랩</p>
            </div>
          </aside>
        </div>
    </main>
    <%@include file="/WEB-INF/includes/footer.jsp" %>
  </body>
</html>

