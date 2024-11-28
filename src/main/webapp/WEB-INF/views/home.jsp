<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>잡집사</title>
<link rel="icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="/js/headerMain.js" defer></script>
</head>
<body>
	<%@include file="/WEB-INF/includes/headerMain.jsp"%>
	<main class="home">
		<div class="inner">
			<h2>
				기술스택별<br />인기공고
			</h2>
			<div class="develop-recruit">
				<ul class="develop-recruit-sort">
					<li class="sort-active"  value="3">프론트엔드</li>
					<li value="1">백엔드</li>
					<li value="2">데이터베이스</li>
					<li value="4">협업툴</li>
				</ul>
				<div class="recruit-carasel">
					<img class="prev-btn" src="/images/icon/carasel-left.png"
						alt="이전 버튼"> <img class="next-btn"
						src="/images/icon/carasel-right.png" alt="다음 버튼">
					<div class="carasel-inner">
						<div id="develop-recruit-list" class="develop-recruit-list">
						</div>
					</div>
				</div>
			</div>
			<h2>요즘 뜨는 공고</h2>
			<div class="recruit-list">
				<c:forEach var="recruit" items="${companyHomeRecruiteList}">
					<div class="recruit-card">
						<c:set var="isBookmarked" value="false" />
						<c:if test="${not empty userBookMarkList}">
							<c:forEach var="markup" items="${userBookMarkList}">
								<c:if
									test="${markup.bookmark_check eq 1 and markup.company_recruit_idx eq recruit.COMPANY_RECRUIT_IDX}">
									<c:set var="isBookmarked" value="true" />
								</c:if>
							</c:forEach>
						</c:if>
						<c:choose>
							<c:when test="${isBookmarked}">
								<img class="bookmark mark-up" src="/images/icon/mark-up.png"
									alt="북마크" data-recruitidx="${recruit.COMPANY_RECRUIT_IDX}">
							</c:when>
							<c:otherwise>
								<img class="bookmark mark-down" src="/images/icon/mark-off.png"
									alt="북마크" data-recruitidx="${recruit.COMPANY_RECRUIT_IDX}">
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${not empty recruit.COMPANY_SFILE_NAME}">
								<div class="recruit-img">
									<a href="/Common/RecruitOneView?company_recruit_idx=${recruit.COMPANY_RECRUIT_IDX}"></a>
									<img alt="" src="<c:url value='${recruit.COMPANY_SFILE_NAME}'/>">
								</div>
							</c:when>
							<c:otherwise>
								<div class="recruit-img">
									<a class="not-image"
										href="/Common/RecruitOneView?company_recruit_idx=${recruit.COMPANY_RECRUIT_IDX}">등록된
										이미지가 없습니다.</a>
								</div>
							</c:otherwise>
						</c:choose>
						<div class="recruit-info">
							<div class="company-info">
								<p class="recruit-title">
									<a
										href="/Common/RecruitOneView?company_recruit_idx=${recruit.COMPANY_RECRUIT_IDX}">${recruit.RECRUIT_TITLE}</a>
								</p>
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
	<%@include file="/WEB-INF/includes/footer.jsp"%>
	<script>
         let recruitListIndex = 0;	
    
		  const developRecruitListEl = document.getElementById('develop-recruit-list');
	      const $prevBtn              = document.querySelector(".prev-btn");
	      const $nextBtn              = document.querySelector(".next-btn");
	      const $developRecruitList   = document.querySelector(".develop-recruit-list");
	    	// AJAX 요청
	     getDevelopRecruitListAjax()
	     	
	      function getDevelopRecruitListAjax(developValue = 3){
	    		
	    	fetch('/CompanyRecruit/RecruitListSkillStackAjax?skill_stack_idx=' + developValue)
	    	    .then(response => response.json())
	    	    .then(data => {
	    	        // 받아온 채용 공고 목록을 추가
	    	        //console.log(data);
	    	        recruitListIndex = 0;
	    	        moveRecruitList(recruitListIndex);
	    	        $prevBtn.style.display = "none";
    	       		const developRecruitListEl = document.getElementById('develop-recruit-list');
    	            developRecruitListEl.innerHTML = '';
	    	        data.forEach(function(recruitListSkillStack) {

	    	            // recruit-card div 생성
	    	            const recruitCard = document.createElement('div');
	    	            recruitCard.className = 'recruit-card';

	    	            // 기업 로고 이미지 추가
	    	            const img = document.createElement('img');
	    	            console.log(recruitListSkillStack.BOOKMARK_CHECK);
	    	            if(recruitListSkillStack.BOOKMARK_CHECK === 1){
	    	            img.className = 'bookmark mark-up';
	    	            img.src = '/images/icon/mark-up.png'; // 이미지 경로 설정
	    	            	
	    	            }
	    	            else {
	    	            img.className = 'bookmark mark-down';
	    	            img.src = '/images/icon/mark-off.png'; // 이미지 경로 설정
	    	            };
	    	            img.alt = '북마크'; // 대체 텍스트 설정
	    	            img.setAttribute('data-recruitidx', recruitListSkillStack.COMPANY_RECRUIT_IDX); // data-recruitidx 속성 추가
	    	            
	    	            // 기업 로고 및 직무 이미지 추가
	    	            const recruitImg = document.createElement('div');
	    	            recruitImg.className = 'recruit-img';
	    	            
	    	            const dimmed = document.createElement("a")
	    	            dimmed.href = "/Common/RecruitOneView?company_recruit_idx=" + recruitListSkillStack.COMPANY_RECRUIT_IDX
	    	            recruitImg.appendChild(dimmed);
	    	            
	    	            const recruitInfo = document.createElement('div');
	    	            recruitInfo.className = 'recruit-info';
	    	            		
	    	            const logoImg = document.createElement('img');
	    	            logoImg.alt = ''; // 대체 텍스트 설정
	    	            logoImg.src = recruitListSkillStack.COMPANY_SFILE_NAME; // 기업 로고 이미지 설정
	    	            recruitImg.appendChild(logoImg); // 로고 이미지를 div에 추가

	    	            // 기업 정보 추가
	    	            const companyInfo = document.createElement('div');
	    	            companyInfo.className = 'company-info';

	    	            const companyName = document.createElement('p');
	    	            companyName.className = 'company-name';
	    	            companyName.textContent = recruitListSkillStack.COMPANY_NAME; // 기업 이름 추가

	    	            const recruitTitle = document.createElement('p');
	    	            recruitTitle.className = 'recruit-title';
	    	            recruitTitle.textContent = recruitListSkillStack.RECRUIT_TITLE; // 채용 공고 제목 추가


	    	            // 스택 리스트 추가
	    	            const stackList = document.createElement('ul');
	    	            stackList.className = 'stack-list';
	    	            stackList.textContent =  recruitListSkillStack.SKILL_NAME ;

	    	            companyInfo.appendChild(companyName);
	    	            companyInfo.appendChild(recruitTitle);
	    	            
	    	            recruitInfo.appendChild(companyInfo);
	    	            recruitInfo.appendChild(stackList);

	    	            // recruit-card에 모든 요소들을 추가
	    	            recruitCard.appendChild(img); // 북마크 이미지 추가
	    	            recruitCard.appendChild(recruitImg); // 기업 로고/직무 이미지 추가
	    	            recruitCard.appendChild(recruitInfo); // 기업 정보 추가

	    	            // 최종적으로 developRecruitListEl에 recruit-card 추가
	    	            developRecruitListEl.appendChild(recruitCard);
	    	        });
	    	    })
	    	    .catch(error => {
	    	        console.error('Error fetching data:', error);
	    	    });
	    	}	
	
    if ("${sessionScope.userLogin}") {
        const $bookMarkUp = document.querySelectorAll(".mark-up");
        $bookMarkUp.forEach((item) => {
          item.src = "/images/icon/mark-up.png";
        });

        const $bookMarkDown = document.querySelectorAll(".mark-down");
        $bookMarkDown.forEach((item) => {
          item.src = "/images/icon/mark-off.png";
        });
      }

      document.addEventListener("click", (e) => {
    	  const clicked = e.target
          if (clicked.matches(".bookmark")) {
              if ("${sessionScope.userLogin}") {
                const userIdx = "${sessionScope.userLogin.user_idx}";
                const recruitIdx = e.target.dataset.recruitidx;
                if (clicked.classList[1] == "mark-down") {
                	  clicked.classList.remove("mark-down");
                	  clicked.classList.add("mark-up");
                      recruitBookMarkAjax(userIdx, recruitIdx);
                      clicked.src = "/images/icon/mark-up.png";
                } else {
                	  clicked.classList.remove("mark-up");
                	  clicked.classList.add("mark-down");
                      recruitBookMarkAjax(userIdx, recruitIdx);
                      clicked.src = "/images/icon/mark-off.png";
                }
              } else {
                alert("로그인이 필요합니다.");
              }
        }
        if (clicked.matches(".next-btn")) {
          recruitListIndex++;
          moveRecruitList(recruitListIndex);
          if (recruitListIndex >= 6) {
        	clicked.style.display = "none";
          }
          if (recruitListIndex >= 1) {
           $prevBtn.style.display = "block";
          }
        }
        if (clicked.matches(".prev-btn")) {
          recruitListIndex--;
          moveRecruitList(recruitListIndex);
          if (recruitListIndex < 6) {
           $nextBtn.style.display = "block";
          }
          if (recruitListIndex < 1) {
            clicked.style.display = "none";
          }
        }
        
        if(clicked.matches(".develop-recruit-sort li")){
    	  const value = clicked.getAttribute("value"); // value 속성 가져오기
	    	// AJAX 요청
			getDevelopRecruitListAjax(value)
	      const $sortLists = document.querySelectorAll(".develop-recruit-sort li")   
	      $sortLists.forEach(a=>{
	        a.classList.remove("sort-active")
	      })
	      clicked.classList.add("sort-active")
	    
       }
        
      });

      async function recruitBookMarkAjax(userIdx, recruitIdx) {
        const res = await fetch(`/Users/RecruitMarkUp`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ userIdx: userIdx, recruitIdx: recruitIdx }),
        });

        if (!res.ok) {
          throw new Error(`HTTP error status: ${res.status}`);
        }

        const result = await res.json();
        return result;
      }

      function moveRecruitList(i) {
        $developRecruitList.style.transform = "translateX(" + i * -260 +"px)";
      }
      
	</script>
</body>
</html>

