<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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