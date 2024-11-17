<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>정보 수정</title>
        <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Jua&family=Poor+Story&display=swap" rel="stylesheet"> 
    <style>
    body {
        background-color: #ffffff;
        margin: 0;
        padding: 0;
        text-align: center;
        font-family: "Jua", serif;
    }

    .header {
        background-color: #ffffff;
        color: black;
        padding: 20px;
        font-size: 24px;
        font-weight: bold;
        border-bottom: 2px solid #470065;
    }

    .container {
        max-width: 1000px;
        margin: 20px auto;
        padding: 20px;
        background-color: #EBFFEE;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        text-align: center;
    }

    .info-box {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 20px;
        font-weight: bold;
        font-size: 18px;
        text-align: left;
        padding-bottom: 10px;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15);
    }

    h1 {
        color: #470065;
        font-size: 28px;
        margin-bottom: 20px;
    }

    .info-item {
        font-size: 18px;
        margin: 10px 0;
        margin-left: 30px;
        font-weight: bold;
        text-align: left;
    }

    .highlight {
        color: #2e8b57;
    }

    .link-container {
        display: flex;
        justify-content: center;
        margin: 20px 0;
        max-width: 600px;
        width: 100%;
        margin: 0 auto;
    }

    .link-box {
        flex: 1;
        max-width: 280px;
        background-color: #EBFFEE;
        color: #470065;
        padding: 20px;
        border-radius: 8px;
        text-align: center;
        font-size: 18px;
        font-weight: bold;
        margin: 10px;
        cursor: pointer;
        text-decoration: none;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15);
    }

    .link-box:hover {
        background-color: #DFF5E1;
    }

    .button {
        background-color: #EBFFEE;
        color: #470065;
        padding: 10px 20px;
        border-radius: 8px;
        font-size: 20px;
        margin: 10px;
        cursor: pointer;
        text-decoration: none;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.15);
        border: none;
        font-weight: bold;
        text-align: center; 
    }

    .button:hover {
        background-color: #495057;
    }

    footer {
        text-align: center;
        font-family: "Jua", serif;
    }

    .logo-container {
        margin-top: 20px;
        margin-bottom: 10px;
        text-align: center;
    }

    /* 추가한 CSS: 버튼 중앙 정렬 */
    .button-container {
        text-align: center; /* 저장 버튼을 중앙에 정렬 */
    }
    
    footer {
        text-align: center;
        font-family: "Jua", serif;
    }
    
    input[type="text"] {
        font-family: "Jua", serif; /* 원하는 폰트로 변경 */
        font-size: 16px; /* 폰트 크기도 조정할 수 있습니다 */      
        color: #333; /* 텍스트 색상 조정 */
        padding: 10px; /* 내부 여백 조정 */
        border: 1px solid #ccc; /* 테두리 색상 조정 */
        border-radius: 5px; /* 모서리 둥글게 */
        box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
        width: calc(100% - 22px); /* 폭 조정 (여백 고려) */
        }
    
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
    <footer>    
    <br/><span>이메일 : help@arabojob.co.kr<br/> Fax : 02-0000-0000(대표)</span><br/>
	<p></p>
</footer>
</body>
</html>