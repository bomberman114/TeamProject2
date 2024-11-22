<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<!DOCTYPE html>
<html>
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
    <%@ include file="/WEB-INF/includes/headerUser.jsp" %>
    <main class="mypage-update">
        <div class="inner">
        	<form action="/Company/MypageProfileUpdate" method="post"  enctype ="multipart/form-data" >
            <div class="aside">
                <h2>계정 정보 설정</h2>
                <div class="user-img"><img alt="프로필 이미지" /></div>
                <input type="file" id="upfile" name="profileImge" aria-label="upfile" accept=".jpg,.jpeg,.png">
                <label class="profile-btn" for="upfile">프로필 변경</label>
            </div>
            <div class="update-container">
                    <input type="hidden" name="company_user_idx" value="${companyUserVo.company_user_idx}">
                    <h3>기업 정보</h3>
                    <table>
                        <tbody>
                            <tr>
                                <td>기업명</td>
                                <td><input type="text" name="company_name" value="${companyUserVo.company_name}"></td>
                            </tr>
                            <tr>
                                <td>사업자등록번호</td>
                                <td><input type="text" name="company_bcode" value="${companyUserVo.company_bcode}"></td>
                            </tr>
                            <tr>
                                <td>대표자 명</td>
                                <td><input type="text" name="company_boss_name" value="${companyUserVo.company_boss_name}"></td>
                            </tr>
                            <tr>
                                <td>공식 이메일</td>
                                <td><input type="email" name="company_email" value="${companyUserVo.company_email}"></td>
                            </tr>
                            <tr>
                                <td>설립일</td>
                                <td><input type="date" name="company_establish" value="${companyUserVo.company_establish}"></td>
                            </tr>
                        </tbody>
                    </table>
                    <h3>담당자 정보</h3>
                    <table>
                        <tbody>
                            <tr>
                                <td>이름</td>
                                <td><input type="text" name="company_user_name" value="${companyUserVo.company_user_name}"></td>
                            </tr>
                            <tr>
                                <td>전화번호</td>
                                <td><input type="text" name="company_phone" value="${companyUserVo.company_phone}" maxlength="13" oninput="formatPhoneNumber(this)"></td>
                            </tr>
                            <tr>
                                <td>이메일</td>
                                <td><input type="email" name="company_user_email" value="${companyUserVo.company_user_email}"></td>
                            </tr>
                        </tbody>
                    </table>
                    <p class="btn-container">
                        <a href="javascript:window.history.back();">취소</a>
                        <input type="submit" value="수정" class="update-btn">
                    </p>
            </div>
       	 </form>
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
=======
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
        <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&family=Poor+Story&display=swap" rel="stylesheet"> 
 <style>
 </style>
</head>
<body>
 <header class="logo-container">
        <a href="/Company/Info">
    		<img src="\css\NEXT.png" alt="사이트 로고" style="height: 8em;">
        </a>
    </header>
    <div class="container">
    <h1>회사 정보 수정</h1>
        <div class="info-box">
        <form action="/Company/InfoUpdate" method="POST">
                <div class="info-item">회사 ID: <input type="text" name="company_id" value="${companyUserVo.company_id}" readonly /></div>
                <div class="info-item">회사 이름: <input type="text" name="company_name" value="${companyUserVo.company_name}" /></div>
                <div class="info-item">대표자: <input type="text" name="company_boss_name" value="${companyUserVo.company_boss_name}" /></div>
                <div class="info-item">전화번호: <input type="text" name="company_phone" value="${companyUserVo.company_phone}" /></div>
                <div class="info-item">이메일: <input type="text" name="company_email" value="${companyUserVo.company_email}" /></div>
                <div class="info-item">설립일: <input type="text" name="company_establish" value="${companyUserVo.company_establish}" /></div>
                <div class="info-item">등록일: <input type="text" name="company_regdate" value="${companyUserVo.company_regdate}" readonly /></div>
                <div class="button-container">
                    <input type="submit" class="button" value="저장" />
                </div>
            </form>
        </div>
    </div>
</body>
</html>
>>>>>>> 2e351f5ebeccc2194ee41f374e30dce8fb498c69
