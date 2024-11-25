<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>잡집사</title>
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
  </head>
  <body>
   <%@include file="/WEB-INF/includes/headerLogin.jsp" %>
    <main class="login-form">
      <div class="inner">
        <h2><span>개인회원</span> 로그인</h2>
        <form action="/Users/Login" method="post">
          <div class="form-inner">
            <ul>
              <li>
                <p>아이디</p>
                <input type="text" name="user_id" placeholder="아이디" value="asd123">
              </li>
              <li>
                <p>비밀번호</p>
                <input type="text" name="user_passwd" placeholder="비밀번호" value="asd123">
                <span class="id-dup ref"></span>
              </li>
            </ul>
            <button class="login-btn">로그인</button>
            <div class="hr-bar"><hr><span>또는</span></div>
            <a class="login-btn login-another" href="/Company/LoginForm">기업회원 로그인</a>
            <p class="registe-go">아직 회원이 아니세요? <a href="/Users/RegisterForm">회원가입</a></p>
          </div>
        </form>
      </div>
    </main>
    <script>
    const $form = document.querySelector("form")
    const $ref  = document.querySelector(".ref")
    
	$form.addEventListener("submit", async (e) => {
	    e.preventDefault(); // 먼저 폼 제출을 막습니다.
	
	    const userId = document.querySelector("input[name='user_id']").value;
	    const userPd = document.querySelector("input[name='user_passwd']").value;
	
	    // 입력값 검증
	    if (!userId || !userPd) {
	        alert("아이디와 비밀번호를 입력해주세요.");
	        return;
	    }
	
	    try {
	        const isExist = await isUserExist(userId, userPd);
	        if (isExist) {
	            // 사용자가 존재하면 폼의 기본 제출 동작을 허용합니다.
	            e.target.submit();
	        } else {
	        		$ref.innerHTML   = "※ 아이디 또는 비밀번호가 일치하지 않습니다."
	            $ref.style.color = "red"
	        }
	    } catch (err) {
	        console.log("Error Ajax", err);
	        alert("로그인 중 오류가 발생했습니다.");
	    }
	});
	
	async function isUserExist(userId, userPd) {
	    const res = await fetch("/Users/IsUserExist", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json",
	        },
	        body: JSON.stringify({ userId: userId, userPd: userPd })
	    });
	
	    if (!res.ok) {
	        throw new Error(`HTTP error status: ${res.status}`);
	    }
	
	    const result = await res.json();
	    return result.isExist;
	}
    
    </script>
  </body>
</html>

