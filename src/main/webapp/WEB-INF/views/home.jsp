<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%@include file="/WEB-INF/includes/headerMain.jsp" %>
	<main class="home">
	  <div class="inner">
	    <h2>개발자 분야별<br />인기공고</h2>
	    <div class="develop-recruit">
	      <ul class="develop-recruit-sort">
	        <li class="sort-active">프론트엔드</li>
	        <li>백엔드</li>
	        <li>데이터베이스</li>
	        <li>모바일</li>
	      </ul>
	      <div class="recruit-carasel">
	        <img class="prev-btn" src="/images/icon/carasel-left.png" alt="이전 버튼"></button>
	        <img class="next-btn" src="/images/icon/carasel-right.png" alt="다음 버튼"></button>
	        <div class="carasel-inner">
	          <div class="develop-recruit-list">
	            <div class="recruit-card">
	              <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
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
	              <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
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
	              <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
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
	              <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
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
	              <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
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
	              <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
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
	              <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
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
	              <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
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
	              <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
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
	              <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
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
	      <div class="recruit-card">
	        <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
	        <div class="recruit-img">기업로고/직무 이미지</div>
	        <div class="recruit-info">
	          <div class="company-info">
	            <p class="recruit-title">1채용 공고 제목</p>
	            <p class="company-name">기업이름</p>
	          </div>
	          <ul class="stack-list">
	            <li>React</li>
	          </ul>
	        </div>
	      </div>
	      <div class="recruit-card">
	        <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
	        <div class="recruit-img">기업로고/직무 이미지</div>
	        <div class="recruit-info">
	          <div class="company-info">
	            <p class="recruit-title">1채용 공고 제목</p>
	            <p class="company-name">기업이름</p>
	          </div>
	          <ul class="stack-list">
	            <li>React</li>
	          </ul>
	        </div>
	      </div>
	      <div class="recruit-card">
	        <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
	        <div class="recruit-img">기업로고/직무 이미지</div>
	        <div class="recruit-info">
	          <div class="company-info">
	            <p class="recruit-title">1채용 공고 제목</p>
	            <p class="company-name">기업이름</p>
	          </div>
	          <ul class="stack-list">
	            <li>React</li>
	          </ul>
	        </div>
	      </div>
	      <div class="recruit-card">
	        <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
	        <div class="recruit-img">기업로고/직무 이미지</div>
	        <div class="recruit-info">
	          <div class="company-info">
	            <p class="recruit-title">1채용 공고 제목</p>
	            <p class="company-name">기업이름</p>
	          </div>
	          <ul class="stack-list">
	            <li>React</li>
	          </ul>
	        </div>
	      </div>
	      <div class="recruit-card">
	        <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
	        <div class="recruit-img">기업로고/직무 이미지</div>
	        <div class="recruit-info">
	          <div class="company-info">
	            <p class="recruit-title">1채용 공고 제목</p>
	            <p class="company-name">기업이름</p>
	          </div>
	          <ul class="stack-list">
	            <li>React</li>
	          </ul>
	        </div>
	      </div>
	      <div class="recruit-card">
	        <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
	        <div class="recruit-img">기업로고/직무 이미지</div>
	        <div class="recruit-info">
	          <div class="company-info">
	            <p class="recruit-title">1채용 공고 제목</p>
	            <p class="company-name">기업이름</p>
	          </div>
	          <ul class="stack-list">
	            <li>React</li>
	          </ul>
	        </div>
	      </div>
	      <div class="recruit-card">
	        <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
	        <div class="recruit-img">기업로고/직무 이미지</div>
	        <div class="recruit-info">
	          <div class="company-info">
	            <p class="recruit-title">1채용 공고 제목</p>
	            <p class="company-name">기업이름</p>
	          </div>
	          <ul class="stack-list">
	            <li>React</li>
	          </ul>
	        </div>
	      </div>
	      <div class="recruit-card">
	        <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
	        <div class="recruit-img">기업로고/직무 이미지</div>
	        <div class="recruit-info">
	          <div class="company-info">
	            <p class="recruit-title">1채용 공고 제목</p>
	            <p class="company-name">기업이름</p>
	          </div>
	          <ul class="stack-list">
	            <li>React</li>
	          </ul>
	        </div>
	      </div>
	      <div class="recruit-card">
	        <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
	        <div class="recruit-img">기업로고/직무 이미지</div>
	        <div class="recruit-info">
	          <div class="company-info">
	            <p class="recruit-title">1채용 공고 제목</p>
	            <p class="company-name">기업이름</p>
	          </div>
	          <ul class="stack-list">
	            <li>React</li>
	          </ul>
	        </div>
	      </div>
	      <div class="recruit-card">
	        <img class="bookmark bookoff" src="/images/icon/mark-off.png" alt="북마크">
	        <div class="recruit-img">기업로고/직무 이미지</div>
	        <div class="recruit-info">
	          <div class="company-info">
	            <p class="recruit-title">1채용 공고 제목</p>
	            <p class="company-name">기업이름</p>
	          </div>
	          <ul class="stack-list">
	            <li>React</li>
	          </ul>
	        </div>
	      </div>
	    </div>
	  </div>
	</main>
	<%@include file="/WEB-INF/includes/footer.jsp" %>

</body>
</html>

