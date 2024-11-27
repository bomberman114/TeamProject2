<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <main class="home user-apply">
      <div class="inner">
				<h2 class="bookmark-count">공고 스크랩 리스트 (${markupCount})</h2>
		    <div class="recruit-list">
					<c:forEach var="recruit" items="${bookmarkList}">
					    <div class="recruit-card">
	                <img class="bookmark mark-up" src="/images/icon/mark-up.png" alt="북마크" data-recruitidx ="${recruit.COMPANY_RECRUIT_IDX}">
					        <div class="recruit-img">기업로고/직무 이미지</div>
					        <div class="recruit-info">
					            <div class="company-info">
					                <p class="recruit-title">${recruit.RECRUIT_TITLE}</p>
					                <p class="company-name">${recruit.COMPANY_NAME}</p>
					            </div>
					            <ul class="stack-list">
					                <c:if test="${not empty recruit.SKILLS}">
					                        <li>${recruit.SKILLS}</li>
					                </c:if>
					            </ul>
					        </div>
					    </div>
					</c:forEach>
		    </div>
      </div>
    </main>
    <script>
        const userIdx  = "${sessionScope.userLogin.user_idx}";
        
    	document.addEventListener("click",(e)=>{
    		const clicked = e.target;
    		
    		if(clicked.matches(".bookmark")){
    	    	let   $bookMarkList  = document.querySelectorAll(".mark-up")
    	    	const $bookmarkCount = document.querySelector(".bookmark-count")
    			const recruitIdx     = clicked.dataset.recruitidx;
    			clicked.parentNode.remove();
    			recruitBookMarkAjax(userIdx, recruitIdx);
    			const bookmarkCount  = document.querySelectorAll(".mark-up").length;
    			$bookmarkCount.textContent =  "공고 스크랩 리스트 ("+ bookmarkCount+")";
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
	    return result;
	}
    </script>
  </body>
</html>

