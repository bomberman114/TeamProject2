<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 공고 보기 - 잡집사</title>
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: "Pretendard", sans-serif;
        }

        .container {
            display: flex;
            flex-direction: column;
            width: 100%;
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .content {
            display: flex;
            justify-content: space-between;
        }

        .main-content {
            width: 70%;
        }

       .sidebar {
		    width: 25%;
		    background-color: #fff;
		    height: 30%; /* 높이를 자동으로 조정 */
		    padding: 20px;
		    border: 2px solid rgba(224, 224, 224, 0.8); /* 선 두께를 두껍게 하고 색상을 진하게 */
		    border-radius: 8px;
		    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자를 추가하여 입체감 부여 */
		}


        .info-block {
            margin-bottom: 20px;
        }

        .info-block strong {
            display: inline-block;
            margin-right: 10px;
            font-weight: bold;
        }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        ul li {
            margin-bottom: 5px;
        }

        .button-group {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 20px;
        }

        .submit-button, .cancel-button {
            padding: 10px;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .submit-button {
            background-color: #a23541;
            color: #ffffff;
            border: none;
        }

        .cancel-button {
            background-color: #ffffff;
            color: #dc3545;
            border: 1px solid #dc3545;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/includes/headerCompanyUser.jsp" %>

    <div class="container">
        <div class="header">[${companyRecruitMap.COMPANY_NAME}] ${companyRecruitMap.RECRUIT_TITLE}</div>

        <div class="content">
            <div class="main-content">
                <div class="info-block">
                    <strong>근무지역:</strong> ${companyRecruitMap.REGION_NAME} 
                    <br>
                    <strong>근무주소:</strong> ${companyRecruitMap.COMPANY_ADDRESS} 
                </div>
                <div class="info-block">
                    <strong>모집인원:</strong> ${companyRecruitMap.GETMAN}명 
                    <br>
                    <strong>마감일:</strong> ${companyRecruitMap.APPLICATION_DEADLINE}
                </div>
                <div class="info-block">
                    <strong>직무:</strong> ${companyRecruitMap.COMMON_DUTY_NAME}
                </div>
                <div class="info-block">
                    <strong>모집부문:</strong> ${companyRecruitMap.COMPANY_JOB}
                </div>
                <div class="info-block">
                    <strong>기술스택:</strong>
                    <ul>
                    	<c:forEach var="skills" items="${ companyRecruitMap.SKILLS}">
                        <li>${skills}</li>
                    	</c:forEach>
                    </ul>
                </div>
                <div class="info-block">
                    <strong>주요업무:</strong>
                    <ul>
                        <li>${ companyRecruitMap.MAIN_WORK_CONTENT1 }</li>
                        <li>${ companyRecruitMap.MAIN_WORK_CONTENT2 }</li>
                        <li>${ companyRecruitMap.MAIN_WORK_CONTENT3 }</li>
                    </ul>
                </div>
                <div class="info-block">
                    <strong>자격요건:</strong>
                    <ul>
                        <li>${ companyRecruitMap.QUALIFICATION1 }</li>
                        <li>${ companyRecruitMap.QUALIFICATION2 }</li>
                        <li>${ companyRecruitMap.QUALIFICATION3 }</li>
                    </ul>
                </div>
                <div class="info-block">
                    <strong>우대사항:</strong>
                    <ul>
                        <li>${ companyRecruitMap.PREFERENTIAL_TREATMENT1 }</li>
                        <li>${ companyRecruitMap.PREFERENTIAL_TREATMENT2 }</li>
                        <li>${ companyRecruitMap.PREFERENTIAL_TREATMENT3 }</li>
                    </ul>
                </div>
                <div class="info-block">
                    <strong>회사소개:</strong>
                    <p>${ companyRecruitMap.COMPANY_INFO }</p>
                </div>
            </div>

            <div class="sidebar">
                <div class="sidebar-title">채용공고 제목</div>
                <div class="button-group">
                    <a href="/CompanyRecruit/CompanyRecruitUpdateForm?company_recruit_idx=${companyRecruitMap.COMPANY_RECRUIT_IDX}" 
                    	class="submit-button" >채용공고 수정하기</a>
                    <a  href="" class="cancel-button" >돌아가기</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
