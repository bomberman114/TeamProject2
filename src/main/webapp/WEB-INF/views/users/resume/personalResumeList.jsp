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
    <main class="user-resume">
      <div class="inner">
        <div class="resume-list-container">
          <div class="add-btn-contianer">
            <h2>이력서관리</h2>
            <a href="#">이력서 추가</a>
          </div>
          <div class="resume-list">
            <div class="resume-item">
              <div class="resume-item-top">
                <div>
                  <h4>이력서 제목</h4>
                  <img src="/images/icon/util-btn.png" alt="이력서 메뉴" />
                  <ul class="resume-submenu">
                    <li><a href="#">이력서 수정</a></li>
                    <li><a href="#">이력서 삭제</a></li>
                  </ul>
                </div>
                <p>학력, 경력</p>
                <ul class="resume-item-top-skill">
                  <li>기술스택</li>
                </ul>
              </div>
              <div class="resume-item-bottom">
                <p>입사 지원 내역 <span>0건</span></p>
                <p>2024.11.10 등록</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script>
      const $menuBtn = document.querySelectorAll(".resume-item-top img")
      const $subMenu = document.querySelectorAll(".resume-submenu")

      $menuBtn.forEach((item,i)=>{
        item.addEventListener("click",(e)=>{
          e.stopPropagation()
          const submenu = $subMenu[i];
          submenu.style.display = submenu.style.display === "block" ? "none" : "block";

          $subMenu.forEach((menu,index)=>{
            if(i != index){
              menu.style.display = "none"
            }
          })
          
        })
      })

      document.addEventListener("click",(e)=>{
        const element = e.target;
        if(!element.closest(".resume-submenu") && !element.closest(".resume-item-top img") ){
          $menuBtn.forEach((_,i)=>{
            $subMenu[i].style.display = "none"
          })
        }
      })

    </script>
  </body>
</html>

