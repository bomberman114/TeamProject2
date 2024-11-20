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
</head>
<body>
    <header>
        <div class="inner">
          <div class="header-left">
            <h1>
              <a href="/"><img src="/images/logo.svg" alt="잡집사 로고" /></a>
            </h1>
            <div class="header-nav">
              <div class="search-div">
                <input type="text" name="search" placeholder="검색어를 입력해주세요." autocomplete="off"/>
                <div class="recent-list">
                  <p><span>최근 검색</span><button class="recnet-remove-all" onclick="removeRecentAll()">전체삭제</button></p>
                  <ul></ul>
                </div>
              </div>
              <ul>
                <li><a href="#">채용정보</a></li>
              </ul>
            </div>
          </div>
          <ul class="header-right">
            <li><a href="#">로그인</a></li>
            <li><img src="/images/icon/space-bar.png" alt="|" /></li>
            <li><a href="#">회원가입</a></li>
          </ul>
        </div>
      </header>
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
  
      <script>
        let recentHistory  = JSON.parse(localStorage.getItem("recent-history")) || [];
  
        const $body        = document.querySelector("body");
        const $searchDiv   = document.querySelector(".search-div");
        const $searchInput = document.querySelector("input[name='search']");
        const $sortLists    = document.querySelectorAll(".develop-recruit-sort li")
        const $recentList  = document.querySelector(".recent-list ul");
        const $prevBtn     = document.querySelector(".prev-btn");
        const $nextBtn     = document.querySelector(".next-btn");
        const $recruitList = document.querySelector(".develop-recruit-list")
  
        displayRecent()
  
        // 검색인풋 클릭시 클래스 추가
        $searchDiv.addEventListener("click", (e) => {
          if(recentHistory.length != 0){
            $searchDiv.classList.add("recent");
          }
        });
  
        // 검색인풋 이외에 클릭하면 클래스 제거
        $body.addEventListener("click", (e) => {
          const element = e.target;
          if (!element.closest(".search-div") && !element.closest(".recent-remove") && recentHistory.length > 0) {
            $searchDiv.classList.remove("recent");
          }
        });
  
        $searchInput.addEventListener("keyup",(e)=>{
          if(e.keyCode == 13 && e.target.value != ""){
            saveRecent(e.target.value.trim())
            displayRecent();
            $searchDiv.classList.add("recent")
          }
        })
  
        function displayRecent(){
            let recentInnerHtml = "";
            recentHistory.forEach((item,index) => {
              recentInnerHtml += `<li>
                                    <a href="#">`+item+`</a>
                                    <img src="/images/icon/recent-close.png"
                                    alt="검색 삭제" class="recent-remove" onclick="removeRecent(${index})"/>
                                  </li>`
            });
            $recentList.innerHTML = recentInnerHtml;
        }
  
        // 최근검색 저장 함수
        function saveRecent (keyword){
          if(keyword != "" && keyword != null){
            recentHistory.unshift(keyword);
          }
          if(recentHistory.length > 10){
            recentHistory.pop();
          }
          localStorage.setItem('recent-history', JSON.stringify(recentHistory));
        }
  
          // 최근검색 삭제 함수
          function removeRecent(index) {
            recentHistory.splice(index,1);
            localStorage.setItem('recent-history', JSON.stringify(recentHistory));
            displayRecent();
            if(recentHistory.length == 0){
              $searchDiv.classList.remove("recent");
            }
          }
  
          function removeRecentAll() {
            recentHistory = []
            localStorage.setItem('recent-history', JSON.stringify(recentHistory));
            $searchDiv.classList.remove("recent");
          }
  
          $sortLists.forEach((li)=>{
            li.addEventListener("click",(e)=>{
              $sortLists.forEach(a=>{
                a.classList.remove("sort-active")
              })
              li.classList.remove("sort-active")
              e.target.classList.add("sort-active")
            })
          })

          let recruitListIndex = 0
  
          $nextBtn.addEventListener("click",(e)=>{
            recruitListIndex++;
            console.log(recruitListIndex)
            moveRecruitList(recruitListIndex)
            if(recruitListIndex >= 6){
              e.target.style.display = "none"
            }
            if(recruitListIndex >= 1){
              $prevBtn.style.display = "block"
            }
          })
  
          $prevBtn.addEventListener("click",(e)=>{
            recruitListIndex--;
            moveRecruitList(recruitListIndex)
            if(recruitListIndex < 6){
              $nextBtn.style.display = "block"
            }
            if(recruitListIndex < 1){
              e.target.style.display = "none"
            }
          })
  
          function moveRecruitList(i){
            $recruitList.style.transform=`translateX(${i*-260}px)`
          }
  
  
      </script>
</body>
</html>

