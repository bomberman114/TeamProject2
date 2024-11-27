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
            <a href="/Users/MyPage/Resume/WriteForm">이력서 추가</a>
          </div>
          <div class="resume-list">
          	<c:forEach var="resume" items="${resumeList}">
	            <div class="resume-item">
	              <div class="resume-item-top">
	                <div>
	                  <h4><a href="/Users/MyPage/Resume/OneView?user_resume_idx=${resume.USER_RESUME_IDX}">${resume.USER_TITLE}</a></h4>
	                  <img src="/images/icon/util-btn.png" alt="이력서 메뉴" />
	                  <ul class="resume-submenu">
	                    <li><a href="/Users/MyPage/Resume/UpdateForm?user_resume_idx=${resume.USER_RESUME_IDX}">이력서 수정</a></li>
	                    <li><a href="/Users/MyPage/Resume/Delete?user_resume_idx=${resume.USER_RESUME_IDX}">이력서 삭제</a></li>
	                  </ul>
	                </div>
	                <p>${resume.EDUCATION_STATUS_TYPE}<c:if test="${not empty resume.CARRER_YEAR or not empty resume.CARRER_MONTH}">, 경력</c:if>
	                	<c:if test="${not empty resume.CARRER_YEAR}">${resume.CARRER_YEAR}년</c:if>
	                	<c:if test="${not empty resume.CARRER_MONTH}">${resume.CARRER_MONTH}개월</c:if>	                	
	                </p>
	                <ul class="resume-item-top-skill">
	               		<c:if test="${not empty resume.SKILLS}">
					    	<c:forEach var="item" items="${resume.SKILLS}">
					    		<c:if test="${not empty item}"><li>${item}</li></c:if>
					    	</c:forEach>
						</c:if>
	                </ul>
	              </div>
	              <div class="resume-item-bottom">
	                <p>입사 지원 내역 <span>0건</span></p>
	                <p>${resume.USER_RESUME_REGDATE} 등록</p>
	              </div>
	            </div>
          	</c:forEach>
          </div>
        </div>
      </div>
    </main>
    <script>
      let $menuBtn = null;
      let $subMenu = null;

      document.addEventListener("click",(e)=>{
        const clicked = e.target;
        if(clicked.matches(".resume-item-top img")){
        	e.stopPropagation()
        	$menuBtn = document.querySelectorAll(".resume-item-top img")
        	$subMenu = document.querySelectorAll(".resume-submenu")
        	const submenu = e.target.nextSibling.nextSibling;
        	$menuBtn.forEach((_,i)=>{
                $subMenu[i].style.display = "none"
              })
        	submenu.style.display = "block"
        }
        if(!clicked.closest(".resume-submenu") && !clicked.closest(".resume-item-top img") ){
          $menuBtn.forEach((_,i)=>{
            $subMenu[i].style.display = "none"
          })
        }
      })
    </script>
  </body>
</html>

