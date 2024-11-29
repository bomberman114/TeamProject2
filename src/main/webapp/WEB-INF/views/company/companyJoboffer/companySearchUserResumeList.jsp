<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>잡집사 - 인재풀</title>
<link rel="icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<style type="text/css">

body {
background: #F5F5F8;

}

h2 {
margin-bottom: 25px;
}
.main-container {
	display: flex;
	padding: 40px;
	width: 1200px;
	margin: auto;
}

.filter-section {
	height: 60%;
	background-color: #fff;
	padding: 20px;
	border-radius: 12px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	width: 250px; /* 필터 섹션 폭 설정 */
	margin-right: 20px; /* 오른쪽 여백 */
}

.filter-options {
	display: flex;
	flex-direction: column; /* 세로 정렬 */
	gap: 10px;
}

.filter-options button, .filter-options select {
	padding: 10px;
	border: 1px solid #d7dce5;
	border-radius: 8px;
	background: #fff;
	cursor: pointer;
	font-weight: 500;
}

.resume-list {
	border-radius: 12px;
	width: 70%;
	
}

.resume-item {
	background: #ffffff;
	margin-bottom: 20px;
	border: 1px solid #e0e0e0;
	border-radius:12px;
	padding: 20px;
	border: 
}
.resume-item:hover {
	background-color: rgb(242,242,242); /* 호버 시 배경색 */
    color: black; /* 호버 시 글자색 변경 */
}


.resume-item h3 {
	margin: 0;
	font-size: 20px;
	font-weight: 600;
}

.resume-item p {
	margin: 5px 0;
	color: #555;
}

.resume-item span {
	font-size: 14px;
	color: #999;
}

.pagination {
	display: flex;
	justify-content: center;
		border-radius: 15px;
}

.pagination span, .pagination a {
	margin: 0 5px;
	padding: 8px 12px;
	border: 1px solid #ffffff;
	border-radius: 15px;
	color: black;
	text-decoration: none;
	cursor: pointer;
}
.com {
justify-content:space-between;
display: flex;
}
.current-page {
	background-color: #ffffff;
	color: #2E7D32;
	font-weight: bold;
	border: 1px solid #ffffff;
	border-radius: 15px;
}


.conditionButton:hover {
    background-color: #ffffff; /* 호버 시 배경색 */
    color: black; /* 호버 시 글자색 변경 */
}

.conditionButtonActive {
    background-color: white; /* 활성화된 버튼 배경색 */
    color: black; /* 활성화된 버튼 글자색 */
    font-weight:bold;
    border-color: black; /* 활성화된 버튼 테두리 색상 */
    display: inline-block; /* 인라인 블록으로 설정하여 버튼처럼 보이게 */
    text-decoration: none; /* 기본 스타일 제거 */
    padding: 10px 20px; /* 여백 */
    border: 1px solid #ddd; /* 기본 테두리 추가 */
    border-radius: 5px; /* 모서리 둥글게 */
    font-size: 16px; /* 글자 크기 */
    cursor: pointer; /* 마우스 커서 변경 */
    transition: background-color 0.3s, border-color 0.3s; /* 배경색과 테두리 색 변화에 애니메이션 추가 */
}

.conditionButton {
    display: inline-block; /* 인라인 블록으로 설정하여 버튼처럼 보이게 */
    text-decoration: none; /* 기본 스타일 제거 */
    color: black; /* 기본 글자 색상 */
    padding: 10px 20px; /* 여백 */
    background-color: #f5f5f5; /* 기본 배경색 */
    border-radius: 5px; /* 모서리 둥글게 */
    font-size: 16px; /* 글자 크기 */
    cursor: pointer; /* 마우스 커서 변경 */
    transition: background-color 0.3s, border-color 0.3s; /* 배경색과 테두리 색 변화에 애니메이션 추가 */
}

.search {
	background:#ffffff;
	border: 1px solid #d7dce5;
	width: 100%;
	height: 35px;
	border-radius: 8px;
}

.buuuuuton {
	background: #F8F8F8;
	padding: 10px;
}



</style>
<script type="text/javascript">
    window.onload = function() {
        const skillEl = document.querySelector('#skills');
        const selectedSkillsList = document.getElementById('selected-skill-list');
        const commonDutyEl = document.querySelector('#commonDutys');
        const selectedCommonDutyList = document.getElementById('selected-commonDuty-list');
        const regionEl = document.querySelector('#regions');
        const selectedRegionList = document.getElementById('selected-region-list');
		
        // X 버튼 클릭 시 해당 스킬 항목 삭제
        document.querySelectorAll('#selected-skill-list li button').forEach(button => {
            button.onclick = function(event) {
                event.preventDefault();
                const listItem = button.closest('li');
                const skillId = listItem.dataset.skillId;
                const hiddenInput = document.querySelector('#hidden-skill-' + listItem.dataset.skillId);
                const option = document.querySelector('#skill option[value="' + listItem.dataset.skillId + '"]');
                if (option) {
                    option.selected = false;
                }  if (listItem) {
                    listItem.remove(); // 목록에서 li 제거
                }
                if (hiddenInput) {
                    hiddenInput.remove(); // 숨겨진 input 요소 제거
                }
            };
        });

        // X 버튼 클릭 시 해당 직무 항목 삭제
        document.querySelectorAll('#selected-commonDuty-list li button').forEach(button => {
            button.onclick = function(event) {
                event.preventDefault();
                const listItem = button.closest('li');
                const dutyId = listItem.dataset.skillId;
                const hiddenInput = document.querySelector('#hidden-commonDuty-' + listItem.dataset.skillId);
                const option = document.querySelector('#commonDuty option[value="' + listItem.dataset.skillId + '"]');
                if (option) {
                    option.selected = false;
                }  
                	if (listItem) {
                listItem.remove(); // 목록에서 li 제거
            		}
            	if (hiddenInput) {
                hiddenInput.remove(); // 숨겨진 input 요소 제거
            	}
                
            };
        });

        // X 버튼 클릭 시 해당 지역 항목 삭제
        document.querySelectorAll('#selected-region-list li button').forEach(button => {
            button.onclick = function(event) {
                event.preventDefault();
                const listItem = button.closest('li');
                const regionId = listItem.dataset.skillId;
                const hiddenInput = document.querySelector('#hidden-region-' + listItem.dataset.skillId);
                const option = document.querySelector('#region option[value="' + listItem.dataset.skillId + '"]');
                if (option) {
                    option.selected = false;
                }  
                	if (listItem) {
                listItem.remove(); // 목록에서 li 제거
            		}
            	if (hiddenInput) {
                hiddenInput.remove(); // 숨겨진 input 요소 제거
            	}
            };
        });

     // 선택된 스킬을 목록에 추가
        skillEl.onchange = function () {
            const selectedOptions = Array.from(this.selectedOptions);

            selectedOptions.forEach(option => {
                // 중복 항목이 있는지 확인
                if (!Array.from(selectedSkillsList.children).some(item => item.dataset.skillId === option.value)) {
                    const listItem = document.createElement('li');
                    listItem.dataset.skillId = option.value; // 스킬 ID 저장
                    listItem.textContent = option.textContent; // 선택된 텍스트 표시
                    
                    // 숨겨진 input 요소 생성하여 선택한 스킬 값을 폼에 추가
                    const hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'skill_idx'; // 서버로 보낼 때 사용될 이름
                    hiddenInput.value = option.value;
                    hiddenInput.id = 'hidden-skill-' + option.value; // ID로 식별 가능하게 설정

                    // X 버튼 생성 및 클릭 이벤트 추가
                    const removeButton = document.createElement('button');
                    removeButton.textContent = 'X';
                    removeButton.onclick = function () {
                        option.selected = false; // 선택 해제
                        listItem.remove(); // 항목 삭제
                        hiddenInput.remove(); // 숨겨진 input 요소 제거
                    };

                    listItem.appendChild(removeButton); // 버튼 추가
                    selectedSkillsList.appendChild(listItem); // 목록에 항목 추가
                    selectedSkillsList.appendChild(hiddenInput); // 숨겨진 input을 목록에 추가
                }
            });
        };


        // 선택된 직무를 목록에 추가
        commonDutyEl.onchange = function() {
            const selectedOptions = Array.from(this.selectedOptions);

            selectedOptions.forEach(option => {
                if (!Array.from(selectedCommonDutyList.children).some(item => item.dataset.skillId === option.value)) {
                    const listItem = document.createElement('li');
                    listItem.dataset.skillId = option.value;
                    listItem.textContent = option.textContent;
					
                    // 숨겨진 input 요소 생성하여 선택한 스킬 값을 폼에 추가
                    const hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'common_duty_idx'; // 서버로 보낼 때 사용될 이름
                    hiddenInput.value = option.value;
                    hiddenInput.id = 'hidden-commonDuty-' + option.value; // ID로 식별 가능하게 설정
                    
                    const removeButton = document.createElement('button');
                    removeButton.textContent = 'X';
                    removeButton.onclick = function() {
                        option.selected = false;
                        listItem.remove();
                        hiddenInput.remove(); // 숨겨진 input 요소 제거
                    };

                    listItem.appendChild(removeButton);
                    selectedCommonDutyList.appendChild(listItem);
                    selectedCommonDutyList.appendChild(hiddenInput); // 숨겨진 input을 목록에 추가
                }
            });
        };

        // 선택된 지역을 목록에 추가
        regionEl.onchange = function() {
            const selectedOptions = Array.from(this.selectedOptions);

            selectedOptions.forEach(option => {
                if (!Array.from(selectedRegionList.children).some(item => item.dataset.skillId === option.value)) {
                    const listItem = document.createElement('li');
                    listItem.dataset.skillId = option.value;
                    listItem.textContent = option.textContent;
                    
                    // 숨겨진 input 요소 생성하여 선택한 스킬 값을 폼에 추가
                    const hiddenInput = document.createElement('input');
                    hiddenInput.type = 'hidden';
                    hiddenInput.name = 'region_idx'; // 서버로 보낼 때 사용될 이름
                    hiddenInput.value = option.value;
                    hiddenInput.id = 'hidden-region-' + option.value; // ID로 식별 가능하게 설정

                    const removeButton = document.createElement('button');
                    removeButton.textContent = 'X';
                    removeButton.onclick = function() {
                        option.selected = false;
                        listItem.remove();
                        hiddenInput.remove(); // 숨겨진 input 요소 제거
                    };

                    listItem.appendChild(removeButton);
                    selectedRegionList.appendChild(listItem);
                    selectedRegionList.appendChild(hiddenInput); // 숨겨진 input을 목록에 추가
                }
            });
        };
    };
    
    
    
    </script>
</head>
<body>
	<%@include file="/WEB-INF/includes/headerCompanyUser.jsp"%>

	<div class="main-container">
		<section class="filter-section">
			<h2>인재풀</h2>
			<form action="/Company/SearchResumes" method="get">
				<div class="filter-options">
					<c:set var="url" value="?nowpage=${nowpage}&pageSize=${pageSize}" />
					<c:forEach var="skill" items="${checkedSkillList}">
						<c:set var="url" value="${url}&skill_idx=${skill.skill_idx}" />
					</c:forEach>
					<c:forEach var="region" items="${checkedRegionList}">
						<c:set var="url" value="${url}&region_idx=${region.region_idx}" />
					</c:forEach>
					<c:forEach var="common_duty" items="${checkedCommonDutyList}">
						<c:set var="url"
							value="${url}&common_duty_idx=${common_duty.common_duty_idx}" />
					</c:forEach>
					<c:set var="condition" value="${param.condition}" />
					<c:set var="regdate" value="UR.USER_RESUME_REGDATE" />
					
					
					<div style="display: flex; gap: 1px;">
					<div class="buuuuuton"> <!-- 버튼 사이의 간격을 설정 -->
					<a class=" ${condition eq regdate ? 'conditionButtonActive' : 'conditionButton'}" href="${url}&condition=${regdate}">최신순</a>
					<c:set var="views" value="UR.USER_RESUME_VIEWS" />
					<a class="${condition eq views ? 'conditionButtonActive' : 'conditionButton'}" href="${url}&condition=${views}">인기순</a>
					</div>
					</div>
					
					<p><b>기술스택</b></p>
					<select id="skills">
						<option value="">기술스택 선택</option>
						<c:forEach var="skillList" items="${skillList}">
							<option value="${skillList.skill_idx}">${skillList.skill_name}</option>
						</c:forEach>
					</select>
					<ul id="selected-skill-list">
						<c:if test="${not empty checkedSkillList}">
							<c:forEach var="checkedSkillList" items="${checkedSkillList}">
								<li data-skill-id="${checkedSkillList.skill_idx}">
									${checkedSkillList.skill_name}
									<button id="skillDelete" style="margin-left: 10px;">X</button>
								</li>
								<input type="hidden" name="skill_idx"
									value="${checkedSkillList.skill_idx}"
									id="hidden-skill-${checkedSkillList.skill_idx}">
							</c:forEach>
						</c:if>
					</ul>
					<p><b>직무</b></p>
					<select id="commonDutys">
						<option value="">직무 선택</option>
						<c:forEach var="commonDutyList" items="${commonDutyList}">
							<option value="${commonDutyList.common_duty_idx}">${commonDutyList.common_duty_name}</option>
						</c:forEach>
					</select>
					<ul id="selected-commonDuty-list">
						<c:if test="${not empty checkedCommonDutyList}">
							<c:forEach var="checkedCommonDutyList"
								items="${checkedCommonDutyList}">
								<li data-skill-id="${checkedCommonDutyList.common_duty_idx}">
									${checkedCommonDutyList.common_duty_name}
									<button id="commonDutyDelete" style="margin-left: 10px;">X</button>
								</li>
								<input type="hidden" name="common_duty_idx"
									value="${checkedCommonDutyList.common_duty_idx}"
									id="hidden-commonDuty-${checkedCommonDutyList.common_duty_idx}">
							</c:forEach>
						</c:if>
					</ul>
					<p><b>지역</b></p>
					<select id="regions">
						<option value="">지역 선택</option>
						<c:forEach var="regionList" items="${regionList}">
							<option value="${regionList.region_idx}">${regionList.region_name}</option>
						</c:forEach>
					</select>
					<ul id="selected-region-list">
						<c:if test="${not empty checkedRegionList}">
							<c:forEach var="checkedRegionList" items="${checkedRegionList}">
								<li data-skill-id="${checkedRegionList.region_idx}">
									${checkedRegionList.region_name}
									<button id="regionDelete" style="margin-left: 10px;">X</button>
								</li>
								<input type="hidden" name="region_idx"
									value="${checkedRegionList.region_idx}"
									id="hidden-region-${checkedRegionList.region_idx}">
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<input type="hidden" name="nowpage" value="${nowpage}" >
				<input type="hidden" name="pageSize" value="${pageSize}" >
				<br> <input type="submit" value="검색" class="search">
			</form>
		</section>

		<section class="resume-list">
			<c:if test="${fn:length(userResumeList) > 0}">
		    <c:forEach var="userResume" items="${userResumeList}">
		        <div class="resume-item">
		        <a class="resume" href="/Company/CompanySearchUserResumeOneView?user_resume_idx=${userResume.USER_RESUME_IDX}">
		            <h3>${userResume.USER_TITLE}</h3>
		            <p><strong>${userResume.USER_NAME}</strong> · ${userResume.USER_AGE}세 · 
		            <c:if test="${userResume.USER_CAREER_IDX eq null }">
		            신입
		            </c:if>
		            <c:if test="${userResume.USER_CAREER_IDX ne null }">
		            경력
		            </c:if>
		            </p>
		            <p>${ userResume.EDUCATION_STATUS_TYPE}</p>
		            <p>${ userResume.COMMON_DUTY_NAME}</p>
		            <p class="com">${userResume.SKILL_NAME} <span>${userResume.USER_RESUME_REGDATE} 등록</span></p>
		           </a>
		        </div>
		    </c:forEach>
		</c:if>
		<c:if test="${fn:length(userResumeList) == 0}">
		     <div class="no-results" style="text-align: center; font-size: 24px; font-weight: bold; margin-top: 20px;">
		        결과가 없습니다.
		    </div>
		</c:if>
		</section>
	</div>

	<div class="pagination">
		<c:if test="${ nowpage > 1 }">
			<c:set var="url" value="?nowpage=${nowpage - 1}&pageSize=${pageSize}" />
			<c:forEach var="skill" items="${checkedSkillList}">
				<c:set var="url" value="${url}&skill_idx=${skill.skill_idx}" />
			</c:forEach>
			<c:forEach var="region" items="${checkedRegionList}">
				<c:set var="url" value="${url}&region_idx=${region.region_idx}" />
			</c:forEach>
			<c:forEach var="common_duty" items="${checkedCommonDutyList}">
				<c:set var="url"
					value="${url}&common_duty_idx=${common_duty.common_duty_idx}" />
			</c:forEach>
			<c:set var="url" value="${url}&condition=${condition}" />
			<a href="${url}">이전</a>
		</c:if>

		<c:forEach var="i" begin="1" end="${pagination.totalPageCount}">
			<c:set var="url" value="?nowpage=${i}&pageSize=${pageSize}" />
			<c:forEach var="skill" items="${checkedSkillList}">
				<c:set var="url" value="${url}&skill_idx=${skill.skill_idx}" />
			</c:forEach>
			<c:forEach var="region" items="${checkedRegionList}">
				<c:set var="url" value="${url}&region_idx=${region.region_idx}" />
			</c:forEach>
			<c:forEach var="common_duty" items="${checkedCommonDutyList}">
				<c:set var="url"
					value="${url}&common_duty_idx=${common_duty.common_duty_idx}" />
			</c:forEach>
			<c:set var="url" value="${url}&condition=${condition}" />
			<a class="${i == nowpage ? 'current-page' : ''}" href="${url}">${i}</a>
		</c:forEach>

		<c:if test="${  pagination.existNextPage }">
			<c:set var="url" value="?nowpage=${nowpage + 1}&pageSize=${pageSize}" />
			<c:forEach var="skill" items="${checkedSkillList}">
				<c:set var="url" value="${url}&skill_idx=${skill.skill_idx}" />
			</c:forEach>
			<c:forEach var="region" items="${checkedRegionList}">
				<c:set var="url" value="${url}&region_idx=${region.region_idx}" />
			</c:forEach>
			<c:forEach var="common_duty" items="${checkedCommonDutyList}">
				<c:set var="url"
					value="${url}&common_duty_idx=${common_duty.common_duty_idx}" />
			</c:forEach>
			<c:set var="url" value="${url}&condition=${condition}" />
			<a href="${url}">다음</a>
		</c:if>
	</div>
</body>
</html>
