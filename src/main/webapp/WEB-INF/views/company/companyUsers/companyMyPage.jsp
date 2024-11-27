<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회사 정보</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<style>
body {
   
}

h2 {
   font-size: 32px;
   font-weight: bold;
}
main {
 padding-top: 40px; /* 위쪽 패딩 추가 */
}
header {
   position: relative; /* position 속성 추가 */
   padding: 0 20px; /* 패딩 추가하여 오른쪽으로 이동 */
}

header::after {
   content: ''; /* 가상의 요소 생성 */
   position: absolute; /* 절대 위치 지정 */
   left: 0;
   right: 0;
   bottom: 0; /* 헤더의 아래쪽에 위치 */
   height: 1px; /* 그림자 높이 */
   background: rgba(0, 0, 0, 0.1); /* 배경색을 통해 그림자 효과 */
   z-index: -1; /* 뒤로 보내기 */
}

.profile-img {
   width: 150px; /* 너비 설정 */
   height: 150px; /* 높이 설정 */
   background-color: #ddd; /* 배경색 설정 */
   border-radius: 50%; /* 원형으로 만들기 */
   margin-bottom: 50px; /* 이미지 아래 여백 추가 */
   position: relative; /* 선을 추가하기 위해 위치 지정 */
}

.profile-img::after {
   content: ''; /* 가상의 요소 생성 */
   position: absolute; /* 절대 위치 지정 */
   bottom: -30px; /* 이미지 아래로 위치 */
   left: 0;
   right: 0; /* 전체 너비 사용 */
   height: 1px; /* 선의 두께 */
   background: rgba(0, 0, 0, 0.1); /* 희미한 선 색상 */
}


aside {
    display: flex; /* flex 사용 시 */
    flex-direction: column; /* 세로 정렬 */
    align-items: flex-start; /* 왼쪽 정렬 */
}


.p1 {
   text-align: left;
   font-weight: bold;
   font-size: 16px;
   margin-top: 20px;
}

p {
   font-size: 16px;
   font-weight: bold;
}

.section-title {
   font-weight: bold;
   margin-top: 30px;
   margin-bottom: 15px;
}


   & .user-apply {
        display: flex;
        align-items: center;
        border: solid 1px #333;
        border-radius: 8px;
        margin-top: 20px;

        & li {
          width: 25%;
          padding: 30px 24px;
          text-align: center;
          position: relative;

          & a {
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 10px;
            font-weight: 500;
            & p:last-child {
              font-size: 22px;
            }
          }
        }

        & li::after {
          content: "";
          background: #ccc;
          position: absolute;
          display: block;
          width: 1px;
          height: 40px;
          right: 0;
          top: 50%;
          transform: translateY(-50%);
        }
      }
    }
  }
}
nav a {
   text-decoration: none;
   color: inherit; 
   font-weight: bold; 
}

nav {
   margin-right: 30px; 
}

.ms-auto {
   margin-left: 20px; 
}

.col-md-3.text-center {
    padding-left: 150px;
    padding-top: 40px;
}

h3 {
font-weight: bold;
font-size: 20px;
padding-bottom: 10px;
}


</style>
</head>
<body>
      <%@ include file="/WEB-INF/includes/headerCompanyUser.jsp" %>
   <div class="container mt-4">
      <div class="row">
         <aside class="col-md-3 text-center">
            <div class="profile-img"><img class="profile-img" alt="" src="<c:url value='${companyMap.COMPANY_SFILE_NAME}'/>"></div>
            <a href="/Company/CompanyMypageUpdateForm" class="p1">계정 정보 설정</a>
             <a href="/Company/CompanyMypageUpdateForm" class="p1">계정 탈퇴</a>
         </aside>

         <main class="col-md-9">
            <h2 class="mb-3">${companyMap.COMPANY_NAME}</h2>
            <p>
               <img src="/images/icon/Calendar.png" alt="달력" />&nbsp;${companyMap.COMPANY_ESTABLISH} 설립
            </p>
            <p>
               <img src="/images/icon/call.png" alt="전화" />&nbsp;${companyMap.COMPANY_PHONE}
            </p>
            <p>
               <img src="/images/icon/Mail.png" alt="메일" />&nbsp;${companyMap.COMPANY_EMAIL}
            </p>
            <br/>
            <h3>담당자:${companyMap.COMPANY_USER_NAME}</h3>
            <p>
               <img src="/images/icon/call.png" alt="전화" />&nbsp;${companyMap.COMPANY_PHONE}
            </p>
            <p>
               <img src="/images/icon/Mail.png" alt="메일" />&nbsp;${companyMap.COMPANY_USER_EMAIL}
            </p>
            <br/>
            <h3 class="section-title">나의 현황</h3>
              <ul class="user-apply">
            <li>
              <a href="/Users/MyPage/Apply/List">
                <p>신규 지원자</p>
                <p>${applicationStatusIdx.APPLICATION_STATUS_IDX1}</p>
              </a>
            </li>
            <li>
              <a href="/Users/MyPage/Apply/List">
                <p>서류통과</p>
                <p>${applicationStatusIdx.APPLICATION_STATUS_IDX2}</p>
              </a>
            </li>
            <li>
              <a href="/Users/MyPage/Apply/List">
                <p>최종합격</p>
                <p>${applicationStatusIdx.APPLICATION_STATUS_IDX3}</p>
              </a>
            </li>
            <li>
              <a href="/Users/MyPage/Apply/List">
                <p>불합격</p>
                <p>${applicationStatusIdx.APPLICATION_STATUS_IDX4}</p>
              </a>
            </li>
          </ul>
         
         </main>
      </div>
   </div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
