<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <script src="/js/headerSubmenu.js" defer></script>
    <title>지원자 관리</title>

    <style>   
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ffffff;
            padding: 20px;
        }

        .header-container h1 {
            margin: 0;
            font-size: 24px;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            text-decoration: none;
            color: #333;
        }

        main {
            display: flex; /* Flexbox 사용 */
            width: 80%;
            margin: 20px auto;
        }

        .job-list {
            flex: 0 0 25%; /* 30% 너비 */
            margin-right: 20px;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 340px !important;
            margin-bottom: 100px;
            
        }
        .application-container {
            flex: 1; /* 나머지 공간을 차지 */
            display: flex;
            flex-direction: column; /* 위아래 정렬 */
        }
		
		.resume-info {
		    padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px; /* 박스 간격 */
            width: 842px !important;
            height: auto;
		}
		
        .application-status{
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px; /* 박스 간격 */
            display: flex;
            width: 842px !important;
            gap:45px;
            
        }

        .application-status h3 {
            margin: 0;
        }

        .job-card {
            background-color: #ffffff;
            border-radius: 5px;
            padding: 5px;
            margin: 10px 0;
            font-weight: bold;
            color: #767676;
        }

        .job-card p {
            margin: 5px 0;
        }

        .active-link {
            font-weight: bold;
            color: #fff;
            background: #A23541;
        }

        .every {
            border: 1px solid;
            background: #ffffff;
            text-align: center;
            display: block;
            width: 300px;
            height: 50px;
            border-radius: 5px;
            margin-top: 30px;
            margin-bottom: 30px;
            position: relative; /* position 속성 추가 */
            font-weight: bold;
            line-height: 50px;
        }

        .table {
            font-size: 14px;
            color: #767676;
            text-align: center;
            
        }

        .title-with-line {
            border-top: 1px solid #ccc; /* 제목 위에 선 추가 */
            border-bottom: 1px solid #ccc; /* 제목 아래에 선 추가 */
            margin: 10px 0; /* 위아래 여백 추가 */
            padding: 10px 0; /* 위아래 여백 추가 */
            width: 100%; /* 폭을 100%로 설정 */
            box-sizing: border-box; /* 패딩과 보더를 포함한 폭 계산 */
        }
        
        th {
        	font-weight: bold;
        }
    </style>
</head>
<body>
    <%@include file="/WEB-INF/includes/headerCompanyUser.jsp"%>

    <main>
        <!-- 지원자 관리 박스 -->
        <div class="job-list">
            <h2>지원자 관리</h2>
            <a href="/CompanyApply/CompanyRecruitApplyUserResumeAllList" class="every">지원자 전체</a>
            <div class="toggle-section">
                <div style="display: flex; align-items: center;">
                    <h3 class="title-with-line">
                        <img src="/images/icon/Frame571.png" alt="Toggle" class="toggle-btn" onclick="toggleVisibility('activeJobs')" style="cursor: pointer; margin-right: 10px; height: 24px; width: auto;" />
                        활성화 공고
                    </h3>
                </div>
                <div id="activeJobs" class="job-cards" style="display: none; margin-top: 10px;">
                    <c:forEach var="companyRecruitList" items="${companyRecruitList}">
                        <div class="job-card">
                            <p>
                                <span>· </span>
                                <a href="/CompanyApply/CompanyRecruitApplyUserResumeAllList?company_recruit_idx=${companyRecruitList.COMPANY_RECRUIT_IDX}" class="${companyRecruitIdx eq companyRecruitList.COMPANY_RECRUIT_IDX ? 'active-link' : ''}">
                                    ${companyRecruitList.RECRUIT_TITLE}
                                </a>
                            </p>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="toggle-section">
                <div style="display: flex; align-items: center;">
                    <h3 class="title-with-line">
                        <img src="/images/icon/Frame571.png" alt="Toggle" class="toggle-btn" onclick="toggleVisibility('inactiveJobs')" style="cursor: pointer; margin-right: 10px; height: 24px; width: auto;" />
                        마감된 공고
                    </h3>
                </div>
                <div id="inactiveJobs" class="job-cards" style="display: none; margin-top: 10px;">
                    <c:forEach var="companyRecruitDeadList" items="${companyRecruitDeadList}">
                        <div class="job-card">
                            <p>
                                <span>· </span>
                                <a href="/CompanyApply/CompanyRecruitApplyUserResumeAllList?company_recruit_idx=${companyRecruitDeadList.COMPANY_RECRUIT_IDX}" class="${companyRecruitIdx eq companyRecruitDeadList.COMPANY_RECRUIT_IDX ? 'active-link' : ''}">
                                    ${companyRecruitDeadList.RECRUIT_TITLE}
                                </a>
                            </p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <!-- 독립된 resume-info 박스 -->
        <div class="application-container">
            <div class="application-status">
                <h3>지원완료 (${applicationStatusIdx.APPLICATION_STATUS_IDX1})</h3>
                <h3>서류통과 (${applicationStatusIdx.APPLICATION_STATUS_IDX2})</h3>
                <h3>최종합격 (${applicationStatusIdx.APPLICATION_STATUS_IDX3})</h3>
                <h3>불합격 (${applicationStatusIdx.APPLICATION_STATUS_IDX4})</h3>
                <h3>지원취소 (${applicationStatusIdx.APPLICATION_STATUS_IDX5})</h3>
            </div>

           <div class="resume-info">
    <table class="table" >
        <colgroup>
        	<col width="10%"></col>
        	<col width="35%"></col>
        	<col width="20%"></col>
        	<col width="20%"></col>
        	<col width="15%"></col>
        </colgroup>
        <thead>
            <tr>
                <th>지원일</th>
                <th>지원자정보 (이름,경력)</th>
                <th>직무</th>
                <th>지원상태</th>
                <th>바로가기</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="companyRecruitApplyUserResumeAllList" items="${companyRecruitApplyUserResumeAllList}">
                <c:if test="${companyRecruitApplyUserResumeAllList.USER_RESUME_IDX ne null}">
                    <tr>
                        <td>${companyRecruitApplyUserResumeAllList.APPLIED_DATE} 지원</td>
                        <td>${companyRecruitApplyUserResumeAllList.USER_NAME}<span>                            <c:if test="${companyRecruitApplyUserResumeAllList.years eq null && companyRecruitApplyUserResumeAllList.months eq null}">
                                신입
                            </c:if>
                            <c:if test="${companyRecruitApplyUserResumeAllList.years ne null && companyRecruitApplyUserResumeAllList.years ne 0}">
                                ${companyRecruitApplyUserResumeAllList.years}년
                            </c:if>
                            <c:if test="${companyRecruitApplyUserResumeAllList.months ne null && companyRecruitApplyUserResumeAllList.months ne 0}">
                                ${companyRecruitApplyUserResumeAllList.months}월
                            </c:if>
                        </span></td>
                        <td>${companyRecruitApplyUserResumeAllList.COMMON_DUTY_NAME}</td>
                        <td>${companyRecruitApplyUserResumeAllList.APPLICATION_STATUS_TYPE}</td>
                        <td>
                            <a href="/CompanyApply/CompanyApplyUserResumeView?user_resume_idx=${companyRecruitApplyUserResumeAllList.USER_RESUME_IDX}&application_idx=${companyRecruitApplyUserResumeAllList.APPLICATION_IDX}">
                                보기
                            </a>
                        </td>
                    </tr>
                </c:if>
            </c:forEach>
            <!-- 추가 지원자 정보가 여기에 들어갑니다. -->
        </tbody>
    </table>
</div>
</main>
<script>
function toggleVisibility(sectionId) {
    const section = document.getElementById(sectionId);
    if (section.style.display === "none" || section.style.display === "") {
        section.style.display = "block"; // 보이게 설정
    } else {
        section.style.display = "none"; // 숨기기 설정
    }
}
</script>
</body>
</html>