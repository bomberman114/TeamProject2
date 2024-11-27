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
					<li class="sort-active">프론트엔드</li>
					<li>백엔드</li>
					<li>데이터베이스</li>
					<li>협업툴</li>
				</ul>
				<div class="recruit-carasel">
					<img class="prev-btn" src="/images/icon/carasel-left.png"
						alt="이전 버튼"> <img class="next-btn"
						src="/images/icon/carasel-right.png" alt="다음 버튼">
					<div class="carasel-inner">
						<div class="develop-recruit-list">
							<div class="recruit-card">
								<img class="bookmark bookoff" src="/images/icon/mark-off.png"
									alt="북마크">
								<div class="recruit-img">기업로고/직무 이미지</div>
								<div class="recruit-info">
									<div class="company-info">
										<p class="company-name">기업이름</p>
										<p class="recruit-title">1채용 공고 제목</p>
									</div>
									<ul class="stack-list">
										<li>React</li>
									</ul>
								</div>
							</div>
							<div class="recruit-card">
								<img class="bookmark bookoff" src="/images/icon/mark-off.png"
									alt="북마크">
								<div class="recruit-img">기업로고/직무 이미지</div>
								<div class="recruit-info">
									<div class="company-info">
										<p class="company-name">기업이름</p>
										<p class="recruit-title">2채용 공고 제목</p>
									</div>
									<ul class="stack-list">
										<li>React</li>
									</ul>
								</div>
							</div>
							<div class="recruit-card">
								<img class="bookmark bookoff" src="/images/icon/mark-off.png"
									alt="북마크">
								<div class="recruit-img">기업로고/직무 이미지</div>
								<div class="recruit-info">
									<div class="company-info">
										<p class="company-name">기업이름</p>
										<p class="recruit-title">3채용 공고 제목</p>
									</div>
									<ul class="stack-list">
										<li>React</li>
									</ul>
								</div>
							</div>
							<div class="recruit-card">
								<img class="bookmark bookoff" src="/images/icon/mark-off.png"
									alt="북마크">
								<div class="recruit-img">기업로고/직무 이미지</div>
								<div class="recruit-info">
									<div class="company-info">
										<p class="company-name">기업이름</p>
										<p class="recruit-title">4채용 공고 제목</p>
									</div>
									<ul class="stack-list">
										<li>React</li>
									</ul>
								</div>
							</div>
							<div class="recruit-card">
								<img class="bookmark bookoff" src="/images/icon/mark-off.png"
									alt="북마크">
								<div class="recruit-img">기업로고/직무 이미지</div>
								<div class="recruit-info">
									<div class="company-info">
										<p class="company-name">기업이름</p>
										<p class="recruit-title">5채용 공고 제목</p>
									</div>
									<ul class="stack-list">
										<li>React</li>
									</ul>
								</div>
							</div>
							<div class="recruit-card">
								<img class="bookmark bookoff" src="/images/icon/mark-off.png"
									alt="북마크">
								<div class="recruit-img">기업로고/직무 이미지</div>
								<div class="recruit-info">
									<div class="company-info">
										<p class="company-name">기업이름</p>
										<p class="recruit-title">6채용 공고 제목</p>
									</div>
									<ul class="stack-list">
										<li>React</li>
									</ul>
								</div>
							</div>
							<div class="recruit-card">
								<img class="bookmark bookoff" src="/images/icon/mark-off.png"
									alt="북마크">
								<div class="recruit-img">기업로고/직무 이미지</div>
								<div class="recruit-info">
									<div class="company-info">
										<p class="company-name">기업이름</p>
										<p class="recruit-title">7채용 공고 제목</p>
									</div>
									<ul class="stack-list">
										<li>React</li>
									</ul>
								</div>
							</div>
							<div class="recruit-card">
								<img class="bookmark bookoff" src="/images/icon/mark-off.png"
									alt="북마크">
								<div class="recruit-img">기업로고/직무 이미지</div>
								<div class="recruit-info">
									<div class="company-info">
										<p class="company-name">기업이름</p>
										<p class="recruit-title">8채용 공고 제목</p>
									</div>
									<ul class="stack-list">
										<li>React</li>
									</ul>
								</div>
							</div>
							<div class="recruit-card">
								<img class="bookmark bookoff" src="/images/icon/mark-off.png"
									alt="북마크">
								<div class="recruit-img">기업로고/직무 이미지</div>
								<div class="recruit-info">
									<div class="company-info">
										<p class="company-name">기업이름</p>
										<p class="recruit-title">9채용 공고 제목</p>
									</div>
									<ul class="stack-list">
										<li>React</li>
									</ul>
								</div>
							</div>
							<div class="recruit-card">
								<img class="bookmark bookoff" src="/images/icon/mark-off.png"
									alt="북마크">
								<div class="recruit-img">기업로고/직무 이미지</div>
								<div class="recruit-info">
									<div class="company-info">
										<p class="company-name">기업이름</p>
										<p class="recruit-title">10채용 공고 제목</p>
									</div>
									<ul class="stack-list">
										<li>React</li>
									</ul>
								</div>
							</div>
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
									<a
										href="/Common/RecruitOneView?company_recruit_idx=${recruit.COMPANY_RECRUIT_IDX}"></a><img
										alt="" src="<c:url value='${recruit.COMPANY_SFILE_NAME}'/>">
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
	
	  const $sortLists   = document.querySelectorAll(".develop-recruit-sort li");
	  $sortLists.forEach((li)=>{
	    li.addEventListener("click",(e)=>{
	      $sortLists.forEach(a=>{
	        a.classList.remove("sort-active")
	      })
	      li.classList.remove("sort-active")
	      e.target.classList.add("sort-active")
	    })
	  })
	
	
	
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

      let recruitListIndex = 0;
      
      const $prevBtn              = document.querySelector(".prev-btn");
      const $nextBtn              = document.querySelector(".next-btn");
      const $developRecruitList   = document.querySelector(".develop-recruit-list");
      
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

