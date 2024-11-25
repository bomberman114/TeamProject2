<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            background-color: #f5f5f5;
            font-family: "Pretendard", sans-serif;
        }

        .main-container {
            display: flex;
            padding: 40px;
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

        .filter-options button,
        .filter-options select {
            padding: 10px;
            border: 1px solid #d7dce5;
            border-radius: 8px;
            background: #fff;
            cursor: pointer;
            font-weight: 500;
        }

        .resume-list {
            flex-grow: 1; /* 이력서 목록이 남은 공간을 채우도록 설정 */
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .resume-item {
            margin-bottom: 20px;
            border-bottom: 1px solid #e0e0e0;
            padding-bottom: 10px;
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
            margin-top: 20px;
        }

        .pagination span, .pagination a {
            margin: 0 5px;
            padding: 8px 12px;
            border: 1px solid #d7dce5;
            border-radius: 4px;
            color: #333;
            text-decoration: none;
            cursor: pointer;
        }

        .current-page {
            background-color: #EBFFEE;
            color: #2E7D32;
            font-weight: bold;
            border: 1px solid #2E7D32;
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

                const option = document.querySelector(`#skill option[value="${skillId}"]`);
                if (option) {
                    option.selected = false;
                }
                listItem.remove();
            };
        });

        // X 버튼 클릭 시 해당 직무 항목 삭제
        document.querySelectorAll('#selected-commonDuty-list li button').forEach(button => {
            button.onclick = function(event) {
                event.preventDefault();
                const listItem = button.closest('li');
                const dutyId = listItem.dataset.skillId;

                const option = document.querySelector(`#commonDuty option[value="${dutyId}"]`);
                if (option) {
                    option.selected = false;
                }
                listItem.remove();
            };
        });

        // X 버튼 클릭 시 해당 지역 항목 삭제
        document.querySelectorAll('#selected-region-list li button').forEach(button => {
            button.onclick = function(event) {
                event.preventDefault();
                const listItem = button.closest('li');
                const regionId = listItem.dataset.skillId;

                const option = document.querySelector(`#region option[value="${regionId}"]`);
                if (option) {
                    option.selected = false;
                }
                listItem.remove();
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
                    hiddenInput.id = 'hidden-skill-' + option.value; // ID로 식별 가능하게 설정
                    
                    const removeButton = document.createElement('button');
                    removeButton.textContent = 'X';
                    removeButton.onclick = function() {
                        option.selected = false;
                        listItem.remove();
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
                    hiddenInput.id = 'hidden-skill-' + option.value; // ID로 식별 가능하게 설정

                    const removeButton = document.createElement('button');
                    removeButton.textContent = 'X';
                    removeButton.onclick = function() {
                        option.selected = false;
                        listItem.remove();
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
    <%@include file="/WEB-INF/includes/headerCompanyUser.jsp" %>

    <div class="main-container">
        <section class="filter-section">
            <h2>인재풀</h2>
            <form action="/Company/SearchResumes" method="get">
            <div class="filter-options">
                <button>최신순</button>
                <button>인기순</button>
                <p>기술스택</p>
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
				            	value="${checkedSkillList.skill_idx}">
				        </c:forEach>
				    </c:if>
				</ul> 
                <p>직무</p>
                <select id="commonDutys">
                    <option value="">직무 선택</option>
                    <c:forEach var="commonDutyList" items="${commonDutyList}">
                        <option value="${commonDutyList.common_duty_idx}">${commonDutyList.common_duty_name}</option>
                    </c:forEach>
                </select>
                 <ul id="selected-commonDuty-list">
				    <c:if test="${not empty checkedCommonDutyList}">
				        <c:forEach var="checkedCommonDutyList" items="${checkedCommonDutyList}">
				            <li data-skill-id="${checkedCommonDutyList.common_duty_idx}">
				                ${checkedCommonDutyList.common_duty_name}
				                <button id="commonDutyDelete" style="margin-left: 10px;">X</button>
				            </li>
				            <input type="hidden" name="common_duty_idx" 
				            	value="${checkedCommonDutyList.common_duty_idx}">
				        </c:forEach>
				    </c:if>
				</ul> 
                <p>지역</p>
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
				            	value="${checkedRegionList.region_idx}">
				        </c:forEach>
				    </c:if>
				</ul> 
            </div>
            <br>
            <input type="submit" value="검색">
            </form>
        </section>

        <section class="resume-list">
            <c:forEach var="userResume" items="${userResumeList}">
                <div class="resume-item">
                    <h3>${userResume.USER_TITLE}</h3>
                    <p>홍길동 · 22세 · 신입</p>
                    <p>대학 졸업 · 풀스택 개발자</p>
                    <span>${userResume.registration_date} 등록</span>
                </div>
            </c:forEach>
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
                <c:set var="url" value="${url}&common_duty_idx=${common_duty.common_duty_idx}" />
            </c:forEach>
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
                <c:set var="url" value="${url}&common_duty_idx=${common_duty.common_duty_idx}" />
            </c:forEach>
            <a class="${i == nowpage ? 'current-page' : ''}" href="${url}">${i}</a>
        </c:forEach>

        <c:if test="${ nowpage < pagination.endPage }">
            <c:set var="url" value="?nowpage=${nowpage + 1}&pageSize=${pageSize}" />
            <c:forEach var="skill" items="${checkedSkillList}">
                <c:set var="url" value="${url}&skill_idx=${skill.skill_idx}" />
            </c:forEach>
            <c:forEach var="region" items="${checkedRegionList}">
                <c:set var="url" value="${url}&region_idx=${region.region_idx}" />
            </c:forEach>
             <c:forEach var="common_duty" items="${checkedCommonDutyList}">
                <c:set var="url" value="${url}&common_duty_idx=${common_duty.common_duty_idx}" />
            </c:forEach>
            <a href="${url}">다음</a>
        </c:if>
    </div>
</body>
</html>
