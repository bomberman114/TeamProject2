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
    <style>
        /* 오른쪽 이력서 박스 스타일 */
        .aside-inner {
            background-color: #ffffff; /* 배경색 */
            border: 1px solid #e0e0e0; /* 테두리 */
            border-radius: 8px; /* 모서리 둥글게 */
            padding: 20px; /* 안쪽 여백 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            margin-left: 20px; /* 왼쪽 여백 */
        }

        .aside-inner h3 {
            font-size: 1.5em; /* 제목 크기 */
            margin-bottom: 10px; /* 아래 여백 */
        }

        .write-btn-container {
            display: flex; /* 플렉스 박스 */
            justify-content: space-between; /* 양쪽 끝으로 배치 */
            align-items: center; /* 세로 중앙 정렬 */
        }

        select {
            padding: 10px; /* 안쪽 여백 */
            border: 1px solid #ccc; /* 테두리 */
            border-radius: 5px; /* 모서리 둥글게 */
            flex: 1; /* 가로 크기 조정 */
            margin-right: 10px; /* 오른쪽 여백 */
        }

        .current-status {
            padding: 10px; /* 안쪽 여백 */
            border-radius: 5px; /* 모서리 둥글게 */
            flex: 1; /* 가로 크기 조정 */
            text-align: center; /* 텍스트 중앙 정렬 */
        }

        /* 상태에 따른 스타일 */
        .status-unqualified {
            color: red; /* 불합격 글자 색상 */
        }

        .status-passed {
            background-color: #4CAF50; /* 서류통과 배경색 */
            color: white; /* 글씨 색상 */
        }

        .status-qualified {
            color: #4CAF50; /* 합격 글자 색상 */
        }

        .write-btn {
            padding: 10px 15px; /* 버튼 안쪽 여백 */
            background-color: #4CAF50; /* 저장 버튼 색상 */
            color: white; /* 글씨 색상 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 모서리 둥글게 */
            cursor: pointer; /* 커서 변경 */
        }
        
         .write-btn-select {
            padding: 10px 15px; /* 버튼 안쪽 여백 */
            background-color: black; /* 저장 버튼 색상 */
            color: white; /* 글씨 색상 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 모서리 둥글게 */
            cursor: pointer; /* 커서 변경 */
        }

        .cancel-button {
            padding: 10px 15px; /* 버튼 안쪽 여백 */
            background-color: #white; /* 취소 버튼 색상 */
            color: white; /* 글씨 색상 */
            border-radius: 5px; /* 모서리 둥글게 */
            text-decoration: none; /* 밑줄 제거 */
        }
    </style>
</head>
<body>
    <%@include file="/WEB-INF/includes/headerUser.jsp" %>
    <main class="write-form">
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
                    <a href="/Users/MyPage/UpdateForm">계정정보 설정</a>
                  </div>
                  <ul>
                    <li>
                      <img src="/images/icon/Calendar.png" alt="생년월일" />${vo.USER_BIRTH}년생(${vo.USER_GENDER})
                    </li>
                    <li>
                      <img src="/images/icon/Phone.png" alt="전화번호" />${vo.USER_PHONE}
                    </li>
                    <li>
                      <img src="/images/icon/Mail.png" alt="이메일" />${vo.USER_EMAIL}
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
                  <input type="text" value="${vo.USER_RESUME_INTRO_TITLE}" readonly="readonly" />
                  <textarea name="user_resume_intro_content" readonly="readonly">${vo.USER_RESUME_INTRO_CONTENT}</textarea>
                </li>
              </ul>
            </div>
          </div>
          <aside>
            <div class="aside-inner">
            <form action="/CompanyApply/CompanyApplyUserResumeChangeApply" method="post">
              <h3>${vo.USER_TITLE}</h3>
              <input type="hidden" name="user_resume_idx" value="${vo.USER_RESUME_IDX }">
              <input type="hidden" name="application_idx" value="${vo.APPLICATION_IDX }">
              <input type="hidden" name="company_recruit_idx" value="${vo.COMPANY_RECRUIT_IDX }">
              <div class="write-btn-container">
              <div class="write-btn">${vo.APPLICATION_STATUS_TYPE}</div>
              <c:if test="${vo.APPLICATION_STATUS_IDX ne 9 }">
                <select class="write-btn-select" name="application_status_idx" id="status">
                   <c:forEach var="applicationStatuList" items="${applicationStatuList}">
                    <option value="${applicationStatuList.application_status_idx}"
                    <c:if test="${vo.APPLICATION_STATUS_IDX eq applicationStatuList.application_status_idx}">
                    selected
                    </c:if>
                    >${applicationStatuList.application_status_type }</option>
                    </c:forEach>
                </select>
                <input type="submit" class="write-btn" value="저장하기">
                </c:if>
                <a href="/CompanyApply/CompanyRecruitApplyUserResumeAllList" class="cancel-button">돌아가기</a>
              </div> 
              </form> 	
            </div>
          </aside>
        </div>
    </main>
</body>
</html>
