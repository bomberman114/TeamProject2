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
    <style>
    h4 {
    text-align: center;
    }
    
    </style>
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
          <button type="button" class="write-btn" id="job-offer-btn">채용제의</button>
          <button type="button" class="write-btn">스크랩</button>
          <a href="/Company/SearchResumes">돌아가기</a>
        </div>
      </div>
    </div>
  </form>
<div class="modal-bg" id="job-offer-modal" style="display: none;">
    <div class="modal">
        <div class="modal-bar">
            <span>채용 제의</span>
            <img src="/images/icon/stack-remove.png" alt="" class="close-modal" />
        </div>
            <form id="job-offer-form" method="post" action="/Joboffer/JobOfferRoomCreate">
            <input type="hidden" name="user_idx"  value="${vo.USER_IDX }">
        <div class="modal-content" id="modal-content">
            <div id="recruitList"></div>
                <div class="modal-bar" style="display: flex; justify-content: center; cursor: pointer;" onclick="document.getElementById('job-offer-form').submit();">
                    <span>제출</span>
                </div>
                <a href="http://localhost:9090/Common/RecruitOneView?company_recruit_idx=8">채용공고제목</a>
        </div>
            </form>
    </div>
</div>

  
    </main>
    <script>
    
    document.getElementById("job-offer-btn").addEventListener("click", function() {

    	const recruitListEl = document.querySelector('#recruitList'); 
    	recruitListEl.innerHTML = ''; // 초기화

    	  // AJAX 요청
    	    fetch('/CompanyRecruit/RecruitListAjax')
    	        .then(response => response.json())
    	        .then(data => {
    	            // 채용 공고 갯수 표시
    	            console.log(data);
    	            recruitListEl.innerHTML = '총 ' + data.length + '개의 채용 공고가 있습니다.';

    	            // 받아온 채용 공고 목록을 라디오 버튼으로 추가
    	            data.forEach(function(companyRecruitList) {
    	                const radioContainer = document.createElement('div'); // 라디오 버튼을 감싸는 div

    	                const inputRecruitIdx = document.createElement('input');
    	                inputRecruitIdx.type = 'radio';
    	                inputRecruitIdx.name = 'company_recruit_idx'; // 같은 그룹으로 묶기 위한 name
    	                inputRecruitIdx.value = companyRecruitList.COMPANY_RECRUIT_IDX; // 값 설정
    	                
    	                const inputRecruitTitle = document.createElement('input');
    	                inputRecruitTitle.type = 'hidden';
    	                inputRecruitTitle.name = 'recruit_title'; // 같은 그룹으로 묶기 위한 name
    	                inputRecruitTitle.value = companyRecruitList.RECRUIT_TITLE; // 값 설정
    	                
    	                const inputLink = document.createElement('input');
    	                inputLink.type = 'hidden';
    	                inputLink.name = 'link'; // 같은 그룹으로 묶기 위한 name
    	                let recruiteLink = '<a href="http://localhost:9090/Common/RecruitOneView?company_recruit_idx='
    	                					+ companyRecruitList.COMPANY_RECRUIT_IDX + '"> 채용공고 제목 :  ' + companyRecruitList.RECRUIT_TITLE + '</a>';
    	                inputLink.value = recruiteLink; // 값 설정

    	                const label = document.createElement('label');
    	                label.textContent ='채용공고 제목: ' + companyRecruitList.RECRUIT_TITLE; // 제목 설정
    	                label.htmlFor = inputRecruitIdx.value; // label과 input 연결

    	                // 등록 날짜 추가
    	                const regDate = document.createElement('div');
    	                regDate.textContent = '등록일: ' + companyRecruitList.COMPANY_RECRUIT_REGDATE; // 등록일 설정

    	                // 라디오 버튼과 레이블을 추가
    	                radioContainer.appendChild(inputRecruitIdx);
    	                radioContainer.appendChild(inputRecruitTitle);
    	                radioContainer.appendChild(inputLink);
    	                radioContainer.appendChild(label);
    	                radioContainer.appendChild(regDate); // 등록일 추가
    	                recruitListEl.appendChild(radioContainer);
    	            });
    	        })
    	        .catch(function(error) {
    	            console.error('Error:', error);
    	        });
       

        document.getElementById("job-offer-modal").style.display = "flex";
    });

    document.querySelector(".close-modal").addEventListener("click", function() {
        document.getElementById("job-offer-modal").style.display = "none";
    });

    document.getElementById("job-offer-form").addEventListener("submit", function(e) {
        e.preventDefault();
        alert("채용 제의가 제출되었습니다."); 
        document.getElementById("job-offer-modal").style.display = "none";
    });
    </script>
    
  </body>
</html>

