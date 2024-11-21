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
    <script src="/js/inputForm.js" defer></script>
  </head>
  <body>
  	<%@include file="/WEB-INF/includes/headerUser.jsp" %>
		<main class="mypage-update">
      <div class="inner">
        <div class="aside">
          <h2>계정 정보 설정</h2>
          <div class="user-img"><img alt=""/></div>
          <input type="file" id="upfile" name="upfile" aria-label="upfile" accept=".jpg,.jpeg,.png">
          <label class="profile-btn" for="upfile">프로필 변경</label>
        </div>
        <div class="update-container">
          <form action="/Users/MyPage/Update" method="post">
          <input type="hidden" name="user_idx" value="${vo.user_idx}">
            <p>기본정보</p>
            <table>
              <tbody>
                <tr>
                  <td>이름</td>
                  <td><input type="text" name="user_name" value="${vo.user_name}"></td>
                </tr>
                <tr>
                  <td>생년월일</td>
                  <td><input type="text" name="user_birth" value="${vo.user_birth}" oninput="formatBirthNumber(this)" maxlength="8" ></td>
                </tr>
                <tr>
                  <td>성별</td>
                  <td>
                  	<select name="user_gender">
                  		<c:choose>
                  			<c:when test="${vo.user_gender eq '남'}">
                  				<option selected="selected">남</option>
	                    		<option>여</option>	
                  			</c:when>
                  			<c:otherwise>
			                    <option>남</option>
			                    <option selected="selected">여</option>                  			
                  			</c:otherwise>
                  		</c:choose>
                  	</select>
                  </td>
                </tr>
              </tbody>
            </table>
            <p>연락처 정보</p>
            <table>
              <tbody>
                <tr>
                  <td>휴대폰</td>
                  <td><input type="text" name="user_phone" oninput="formatPhoneNumber(this)" value="${vo.user_phone }" maxlength="13"></td>
                </tr>
                <tr>
                  <td>이메일</td>
                  <td><input type="email" name="user_email" value="${vo.user_email}"></td>
                </tr>
              </tbody>
            </table>
            <p class="btn-container">
              <a href="javascript:window.history.back();">취소</a>
              <button class="update-btn">수정</button>
            </p>
          </form>
        </div>
      </div>
    </main>
    <script>
    const $fileInput = document.querySelector("input[type='file']");
    const $userImg = document.querySelector(".user-img img");

    $fileInput.addEventListener("change", handleImgFileSelector);

    function handleImgFileSelector(e) {
        const files = e.target.files;
        if (files && files[0]) {
            const reader = new FileReader();
            reader.addEventListener("load", (e) => {
            	$userImg.src = e.target.result;
            });
            reader.readAsDataURL(files[0]);
        }
    }
    
    
    </script>
  </body>
</html>
