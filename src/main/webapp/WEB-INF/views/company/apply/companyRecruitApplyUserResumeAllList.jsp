<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지원자 관리</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
        }
       .job-list {
		    flex: 0 0 30%; /* flex-grow: 0, flex-shrink: 0, flex-basis: 30% */
		    margin-right: 20px;
		    padding: 20px;
		    background-color: #fff;
		    border: 1px solid #ddd;
		    border-radius: 5px;
		}
        .job-card {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin: 10px 0;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        .job-card p {
            margin: 5px 0;
        }
        .resume-info {
            flex: 1;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .resume-info h3 {
            margin-top: 0;
        }
        .application-status {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }
        .application-status h3 {
            margin: 0;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <h1>잡집사</h1>
            <nav>
                <ul>
                    <li><a href="#">마이홈</a></li>
                    <li><a href="#">인재풀</a></li>
                    <li><a href="#">스크랩</a></li>
                    <li><a href="#">채용공고</a></li>
                    <li><a href="#">지원자 관리</a></li>
                </ul>
            </nav>
            <div class="notification">
                <span>기업회원</span>
                <button>잡집사 홈</button>
            </div>
        </div>
    </header>

    <main>
        <div class="container">
            <div class="job-list">
                <h2>지원자 관리</h2>
                <h3>활성화 공고</h3>
                <c:forEach var="companyRecruitList" items="${companyRecruitList}">
                <div class="job-card">
                    <p>
                    	<a href="/CompanyApply/CheckedCompanyRecruitApplyUserResumeList?company_recruit_idx=${companyRecruitList.COMPANY_RECRUIT_IDX}">	
                    		${companyRecruitList.RECRUIT_TITLE}
                    	</a>
                    </p>
                </div>
                </c:forEach>
                <h3>비성화 공고</h3>
                <c:forEach var="companyRecruitDeadList" items="${companyRecruitDeadList}">
                <div class="job-card">
                    <p>
                    	<a href="/CompanyApply/CheckedCompanyRecruitApplyUserResumeList?company_recruit_idx=${companyRecruitDeadList.COMPANY_RECRUIT_IDX}">
                    		${companyRecruitDeadList.RECRUIT_TITLE}
                    	</a>
                    </p>
                </div>
                </c:forEach>
            </div>
            <div class="resume-info">
                <h3>지원자 정보</h3>
                <div class="application-status">
                    <h3>지원완료 (${applicationStatusIdx.APPLICATION_STATUS_IDX1})</h3>
                    <h3>서류통과 (${applicationStatusIdx.APPLICATION_STATUS_IDX2})</h3>
                    <h3>최종합격 (${applicationStatusIdx.APPLICATION_STATUS_IDX3})</h3>
                    <h3>불합격 (${applicationStatusIdx.APPLICATION_STATUS_IDX4})</h3>
                    <h3>지원취소 (${applicationStatusIdx.APPLICATION_STATUS_IDX5})</h3>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>지원일</th>
                            <th>이름</th>
                            <th>경력</th>
                            <th>직무</th>
                            <th>지원상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="companyRecruitApplyUserResumeAllList"  items="${companyRecruitApplyUserResumeAllList}">
                        <c:if test="${companyRecruitApplyUserResumeAllList.USER_RESUME_IDX ne null }">
                        <tr>
                            <td>${companyRecruitApplyUserResumeAllList.APPLIED_DATE } 지원</td>
                            <td>${companyRecruitApplyUserResumeAllList.USER_NAME }</td>
                            <td>${companyRecruitApplyUserResumeAllList.years}년 ${companyRecruitApplyUserResumeAllList.months}월</td>
                            <td>${companyRecruitApplyUserResumeAllList.APPLIED_DATE }</td>
                            <td>${companyRecruitApplyUserResumeAllList.APPLICATION_STATUS_TYPE }</td>
                        </tr>
                        </c:if>
                        </c:forEach>
                        <!-- 추가 지원자 정보가 여기에 들어갑니다. -->
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>