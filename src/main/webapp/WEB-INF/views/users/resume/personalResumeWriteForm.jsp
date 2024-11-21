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
  </head>
  <body>
    <%@include file="/WEB-INF/includes/headerUser.jsp" %>
    <main class="write-form">
      <form action="/Resume/Write" method="post">
        <div class="inner">
          <div class="resume-container">
            <div class="resume-title">
              <input
                type="text"
                name="user_title"
                placeholder="이력서 제목을 입력해주세요."
              />
            </div>
            <div class="resume-content">
              <div class="user-info">
                <div class="user-img"></div>
                <div class="user-details">
                  <div class="user-util">
                    <h3>
                      ${vo.user_name}
                      <select>
                        <option>신입</option>
                        <option>경력</option>
                      </select>
                    </h3>
                    <a href="/Users/UpdateForm">계정정보 설정</a>
                  </div>
                  <ul>
                    <li>
                      <img
                        src="/images/icon/Calendar.png"
                        alt="생년월일"
                      />${userBirthYear}년생(${vo.user_gender})
                    </li>
                    <li>
                      <img
                        src="/images/icon/Phone.png"
                        alt="전화번호"
                      />${vo.user_phone}
                    </li>
                    <li>
                      <img src="/images/icon/Mail.png" alt="이메일" />
                      ${vo.user_email}
                    </li>
                  </ul>
                </div>
              </div>
              <ul class="resume-details">
                <li>
                  <p>직무</p>
                  <select class="write-input" name="duty_idx" required>
                    <option style="display: none;" value="">직무를 선택해주세요.</option>
                    <option>집 좀 보내주소</option>
                  </select>
                </li>
                <li class="stack-input-li">
                  <p>기술스택(업무 툴/스킬)</p>
                  <ul class="select-stack-list"></ul>
                  <div class="write-input search-stack-input">
                    <img
                      src="/images/icon/stack-search.png"
                      alt="기술스택 검색"
                    />기술스택을 등록해주세요.
                    <div class="search-stack-list">
                      <div class="stack-inner">
                        <ul class="stack-type">
                          <li>프론트엔드</li>
                          <li>백엔드</li>
                          <li>데이터베이스</li>
                          <li>모바일</li>
                        </ul>
                        <ul class="stack-list">
                          <li>React</li>
                          <li>자바</li>
                          <li>뷰</li>
                          <li>앵귤러</li>
                          <li>집가고 싶다</li>
                          <li>React</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <p class="punder">학력</p>
                  <div class="edu-inner">
                    <div>
                      <select name="" id="" required>
                        <option value="">학력 구분</option>
                        <option>고등학교 졸업</option>
                      </select>
                    </div>
                    <span><img src="/images/icon/space-bar.png" alt=""></span>
                    <input type="text" placeholder="학교명을 입력해주세요.">
                  </div>
                </li>
                <li class="career-li">
                  <p class="punder">경력(업무경험)</p>
                  <div class="career-inner">
                    <div class="date-input">
                      <input type="text" name="career_startdate" maxlength="6" placeholder="YYYYMM" disabled>
                      <span>~</span>
                      <input type="text" name="career_enddate" maxlength="6" placeholder="YYYYMM" disabled>
                    </div>
                    <span><img src="/images/icon/space-bar.png" alt=""></span>
                    <div class="career-info">
                      <input type="text" placeholder="회사명을 입력해주세요." required disabled>
                      <textarea placeholder="주요업무 및 성과를 입력해주세요." oninput="handleResizeHeight(this)" disabled></textarea>
                    </div>
                  </div>
                </li>
                <li class="intro-inner">
                  <p class="punder">자기소개서</p>
                  <input
                    type="text"
                    placeholder="자기소개서 제목을 입력해주세요"
                    required
                  />
                  <textarea placeholder="내용을 입력해주세요." oninput="handleResizeHeight(this)" rows="4"></textarea>
                </li>
              </ul>
            </div>
          </div>
          <aside>
            <h3>이력서 작성</h3>
            <p>입력항목</p>
            <ul>
              <li><span>*</span>직무</li>
              <li><span></span>기술스택</li>
              <li><span>*</span>학력</li>
              <li><span></span>경력</li>
              <li><span>*</span>자기소개서</li>
            </ul>
            <div class="write-btn-container">
              <button class="write-btn">저장하기</button>
              <a href="">취소하기</a>
            </div>
          </aside>
        </div>
      </form>
    </main>
    <script>
      const $searchInput = document.querySelector(".search-stack-input");
      const $stackList = document.querySelector(".search-stack-list");
      const $stackItem = document.querySelectorAll(".stack-list li");
      const $selectList = document.querySelector(".select-stack-list");

      let stackNameArr = [];
      let stackIdxArr = [];

      $searchInput.addEventListener("click", (e) => {
        e.stopPropagation();
        $stackList.style.display = "block";
      });

      document.addEventListener("click", (e) => {
        const element = e.target;
        if (!element.closest(".search-stack-list")) {
          $stackList.style.display = "none";
        }
      });

      $stackItem.forEach((item) => {
        item.addEventListener("click", () => {
          stackNameArr.push(item.textContent);
          stackNameArr = new Set(stackNameArr);
          stackNameArr = Array.from(stackNameArr);
          displaySelectStack(stackNameArr, $selectList);
        });
      });

      function displaySelectStack(arr, output) {
        let listInner = "";
        arr.forEach((a,i) => {
          listInner += `<li>${a} <img src="/images/icon/stack-remove.png" alt="스택 제거" onclick="removeStack(${i})"></li>`;
        });
        output.innerHTML = listInner;
      }

      function removeStack(index){
        console.log(index)
        stackNameArr.splice(index,1);
        displaySelectStack(stackNameArr, $selectList);
      }

      const $textareas = document.querySelectorAll("textarea");
      function handleResizeHeight(item){
        item.style.height = "auto";
        item.style.height = item.scrollHeight + "px"
      }

      const $careerBtn = document.querySelector(".user-util h3 select")
      $careerBtn.addEventListener("change",(e)=>{
        const $careerLi = document.querySelector(".career-li")
        const $careerInput = document.querySelectorAll(".career-li input, .career-li textarea ")
        console.log($careerInput)
        if(e.target.value == "신입"){
          $careerLi.style.display = "none"
          $careerInput.forEach(input=>{
            input.disabled = true;
          })
        }else{
          $careerLi.style.display = "block"
          $careerInput.forEach(input=>{
            input.disabled = false;
            input.required = true;
          })
        }
      })

      const $form = document.querySelector("form");
      $form.addEventListener("submit",(e)=>{
        e.preventDefault();
        stackNameArr.forEach((stack)=>{
          let stackInput = document.createElement("input")
          stackInput.type  = "hidden";
          stackInput.name  = "skill_idx";
          stackInput.value = stack
          $form.append(stackInput);
        })
        $form.submit()
      })
    </script>
  </body>
</html>
