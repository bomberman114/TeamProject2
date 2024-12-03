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
                <div class="company-img">
                <c:choose>
                	<c:when test="${not empty companyImage.COMPANY_SFILE_NAME}">
               			 <img alt="프로필 이미지" src="${companyImage.COMPANY_SFILE_NAME}">
                	</c:when>
                	<c:otherwise>
                	</c:otherwise>
                </c:choose>
                </div>
                
                <div class="company-name">
                  <h5>${vo.COMPANY_NAME}</h5>
                  <a href="#">기업정보 보기</a>
                </div>
              </div>
              <ul>
                <li>업력</li>
                <li>${companyHistory.COMPANY_YEAR}년차<span>(${companyHistory.ESTABLISH } 설립)</span></li>
              </ul>
              <ul>
                <li>조회수</li>
                <li>${vo.COMPANY_RECRUIT_VIEWS}</li>
              </ul>
              <button class="apply-btn">지원하기</button>
			  <c:if test="${not empty userBookMarkList}">
			    <c:set var="isBookmarked" value="false" />
			    <c:forEach var="markup" items="${userBookMarkList}">
			      <c:if test="${markup.company_recruit_idx eq vo.COMPANY_RECRUIT_IDX and markup.bookmark_check eq 1}">
			        <c:set var="isBookmarked" value="true" />
			      </c:if>
			      </c:forEach>
			   </c:if>
			   <c:choose>
			     <c:when test="${isBookmarked}">
		           <p class="bookmark-btn mark-up"><img src="/images/icon/mark-up.png" alt="북마크 아이콘">스크랩</p>									
				 </c:when>
				 <c:otherwise>
		           <p class="bookmark-btn mark-down"><img src="/images/icon/recruit-oneview-mark-off.png" alt="북마크 아이콘">스크랩</p>
				 </c:otherwise>
			  </c:choose>
            </div>
          </aside>
        </div>
    </main>
    <%@include file="/WEB-INF/includes/footer.jsp" %>
    <c:if test="${not empty sessionScope.userLogin}">
    	<div class="modal-bg">
	      <div class="modal">
	        <div class="modal-bar">
	          <span>입사지원</span
	          ><img src="/images/icon/stack-remove.png" alt="" />
	        </div>
	        <div class="modal-content">
	          <h4>${vo.RECRUIT_TITLE}</h4>
	          <p>${vo.COMPANY_NAME}</p>
	          <h5>계정정보</h5>
	          <ul>
	            <li>
	              <span>이름</span>
	              <span>${sessionScope.userLogin.user_name}</span>
	            </li>
	            <li>
	              <span>이메일</span>
	              <span>${sessionScope.userLogin.user_email}</span>
	            </li>
	            <li>
	              <span>연락처</span>
	              <span>${sessionScope.userLogin.user_phone}</span>
	            </li>
	          </ul>
	          <h5>이력서 <span>총 ${resumeCount}개</span></h5>
	          <form action="/Users/Apply" method="post">
	          <input type="hidden" name="company_recruit_idx" value="${vo.COMPANY_RECRUIT_IDX}">
	          <div class="modal-resume-list">
	          	<c:forEach var="resume" items="${resumeList}">
	              <div class="modal-resume-item">
	                <input type="radio" name="user_resume_idx" value="${resume.USER_RESUME_IDX}"/>
	                <div>
	                  	<p class="resume-title">${resume.USER_TITLE}</p>
	                  	<p class="resume-info">
	                  		<c:if test="${not empty resume.CARRER_MONTH or not empty resume.CARRER_YEAR}">총 </c:if>
	                  		<c:if test="${not empty resume.CARRER_MONTH and not empty resume.CARRER_YEAR }">${resume.CARRER_YEAR}년 ${resume.CARRER_MONTH}개월, </c:if>
	                  		<c:if test="${not empty resume.CARRER_YEAR and empty resume.CARRER_MONTH}">${resume.CARRER_YEAR}년, </c:if>
	                  		<c:if test="${not empty resume.CARRER_MONTH and empty resume.CARRER_YEAR}">${resume.CARRER_MONTH}개월, </c:if>
	                  		${resume.EDUCATION_STATUS_TYPE}
	                  	</p>
	                  	<p class="resume-info">${resume.SKILLS}</p>
	                  	<p class="resume-regdate">등록일 : ${resume.USER_RESUME_REGDATE}</p>
	                	</div>
	              	</div>
	          	 </c:forEach>
	           </div>
	           <button class="resume-apply-btn">지원하기</button>
	          </form>
	        </div>
	      </div>
	    </div>
    </c:if>
    <script>

	
    	const $applyBtn       = document.querySelector(".apply-btn");
    	const $bookmarkbtn    = document.querySelector(".bookmark-btn");
		const bookmarkStatus  = document.querySelector(".bookmark-btn img");
		const $resumeApplyBtn = document.querySelector(".resume-apply-btn");
    	
    	$applyBtn.addEventListener("click",()=>{
    		if("${sessionScope.userLogin}"){
    			const $modal  = document.querySelector(".modal-bg");
    			$modal.style.display = "block"
    		}else{
    			alert("로그인이 필요합니다.")
    		}
    	})

		$bookmarkbtn.addEventListener("click",function(){
			if("${sessionScope.userLogin}"){
				const userIdx    = "${sessionScope.userLogin.user_idx}";
				const recruitIdx = "${vo.COMPANY_RECRUIT_IDX}"
				if(this.classList[1] == "mark-down"){
					this.classList.remove("mark-down");
					this.classList.add("mark-up");
					recruitBookMarkAjax(userIdx,recruitIdx);
					bookmarkStatus.src = "/images/icon/mark-up.png"
				}else{
					this.classList.remove("mark-up")
					this.classList.add("mark-down");
					recruitBookMarkAjax(userIdx,recruitIdx);
					bookmarkStatus.src = "/images/icon/recruit-oneview-mark-off.png"
				}					
			}else{
				alert("로그인이 필요합니다.")
			}
		})
	
		async function recruitBookMarkAjax(userIdx, recruitIdx) {
	    const res = await fetch(`/Users/RecruitMarkUp`, {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json",
	        },
	        body: JSON.stringify({ userIdx : userIdx, recruitIdx : recruitIdx})
	    });

	    if (!res.ok) {
	        throw new Error(`HTTP error status: ${res.status}`);
	    }
	
	    const result = await res.json();
	    console.log(result.vo)
	    return result.vo;
		}
    	
    	if("${sessionScope.userLogin}"){
    		const $resumeApplyBtn = document.querySelector(".resume-apply-btn");
    		const $form           = document.querySelector("form");
				
    		$form.addEventListener("submit",(e)=>{
    			e.preventDefault()
					if(document.querySelectorAll("input[type='radio']:checked").length === 0){
						alert("이력서를 선택해주세요.")
					}else{
		    		const userResumeIdx = document.querySelector("input[name='user_resume_idx']:checked").value;
						const recruitIdx    = "${vo.COMPANY_RECRUIT_IDX}";
    				userApplySubmitAjax(userResumeIdx,recruitIdx)						
					}
    		})
    		
    	const $modal         = document.querySelector(".modal-bg");
    	const $modalCloseBtn = document.querySelector(".modal-bar img"); 
			
    	$modalCloseBtn.addEventListener("click",()=>{$modal.style.display="none"})
    	document.addEventListener("click",(e)=>{
    		if(!e.target.closest(".modal, .apply-btn ")){
    			$modal.style.display="none"
    		}
    	})
    	
    	}
    	
    	async function userApplySubmitAjax(userResumeIdx, recruitIdx) {
    	    const res = await fetch("/Users/Apply", {
    	        method: "POST",
    	        headers: {
    	            "Content-Type": "application/json",
    	        },
    	        body: JSON.stringify({ userResumeIdx : userResumeIdx, recruitIdx : recruitIdx})
    	    });

    	    if (!res.ok) {
    	        throw new Error(`HTTP error status: ${res.status}`);
    	    }
    	
    	    const result = await res.json();
    	    alert(result.result)
    	    const $modal  = document.querySelector(".modal-bg");
    			$modal.style.display = "none"
    	    return result;
    		}
    	
    </script>
  </body>
</html>

