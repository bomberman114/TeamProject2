<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
<title>채용 공고 작성</title>
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	display: flex;
	justify-content: center;
	align-items: flex-start;
	padding: 20px;
	min-height: 100vh;
	margin: 0;
}

.container {
	width: 900px;
	display: flex;
	gap: 20px;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.form-section {
	width: 65%;
}

.sidebar {
	width: 30%;
	height: 30%;
	background-color: #fff; /* 흰색 배경 */
	padding: 20px;
	border: 1px solid rgba(224, 224, 224, 0.5); /* 연한 테두리 */
	border-radius: 8px;
	box-shadow: none;
	background-color: #fff; /* 그림자 제거 */
}

.title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 20px;
	width: 80%;
}

.form-group {
	margin-bottom: 15px;
	display: flex;
	flex-direction: column;
}

.form-group label {
	font-weight: bold;
	margin-bottom: 5px;
	font-size: 14px;
}

.form-group input, .form-group select {
	padding: 8px;
	border: 1px solid #ced4da; /* 테두리 색상 설정 */
	border-radius: 4px;
	font-size: 14px;
}

.form-group textarea {
	height: 120px; /* 텍스트 영역 높이 증가 */
	border: 1px solid #ced4da; /* 테두리 색상 설정 */
	resize: none; /* 크기 조절 비활성화 */
}

.add-button {
	margin-top: 5px; /* 위쪽 여백 추가 */
	color: #007bff;
	cursor: pointer;
	font-size: 12px;
	background-color: transparent;
	border: none;
	text-decoration: underline;
}

.sidebar-title {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 10px;
}

.required-fields {
	font-size: 14px;
	list-style: none;
	padding: 0;
	margin: 0;
	line-height: 1.8;
}

.required-fields li {
	display: flex;
	align-items: center;
}

.required-fields li span {
	color: #dc3545;
	margin-right: 5px;
}

.button-group {
	display: flex;
	gap: 10px;
	margin-top: 20px;
}

.submit-button, .cancel-button {
	padding: 10px 0;
	border-radius: 4px;
	font-weight: bold;
	cursor: pointer;
	width: 100%;
	font-size: 16px;
}

.submit-button {
	background-color: #dc3545;
	color: #ffffff;
	border: none;
}

.cancel-button {
	background-color: #ffffff;
	color: #dc3545;
	border: 1px solid #dc3545;
}
</style>
<script type="text/javascript">
	window.onload = function() {

		const recruit_titleEl = document
				.querySelector('[name="recruit_title"]');
		const common_duty_idxEl = document
				.querySelector('[name="common_duty_idx"]');
		const getmanEl = document.querySelector('[name="getman"]');
		const application_deadlineEl = document
				.querySelector('[name="application_deadline"]');
		const main_work_content1El = document
				.querySelector('[name="main_work_content1"]');
		const qualification1El = document
				.querySelector('[name="qualification1"]');
		const preferential_treatment1El = document
				.querySelector('[name="preferential_treatment1"]');
		const region_idxEl = document.querySelector('[name="region_idx"]');
		const company_addressEl = document
				.querySelector('[name="company_address"]');
		const company_infoEl = document.querySelector('[name="company_info"]');
		
		const skillStackEl = document.querySelector('#skillStack');
		const skillEl = document.querySelector('#skill');

		const recruitWriteEl = document.querySelector('#recruitWrite');
		
		 const today = new Date().toISOString().split('T')[0];  // 현재 날짜를 'yyyy-MM-dd' 형식으로 가져옴

         // 오늘부터 가능하도록 설정 (채용공고기간)
         const applicationDeadlineEl = document.querySelector('[name=application_deadline]');
         applicationDeadlineEl.setAttribute("min", today);

		recruitWriteEl.onsubmit = function() {

			if (recruit_titleEl.value == "") {
				alert("공고제목을 입력하세요.");
				recruit_titleEl.focus();
				return false;
			}
			if (common_duty_idxEl.value == "") {
				alert("직무를 선택하세요.");
				common_duty_idxEl.focus();
				return false;
			}
			if (skillEl.value == "") {
				alert("기술 스택을 입력하세요.");
				skillEl.focus();
				return false;
			}
			 if ( skillStackEl.value == "") {
			      alert("개발 분야를 선택해주세요.");
			      skillStackEl.focus();
			      return false;
			    }
			    if (skillEL.value == "") {
			        alert("기술 스택을 선택해주세요.");
			        skillEL.focus();
			        return false;
			    }
			if (getmanEl.value == "") {
				alert("모집인원을 입력하세요.");
				getmanEl.focus();
				return false;
			}
			if (application_deadlineEl.value == "") {
				alert("마감일을 입력하세요.");
				application_deadlineEl.focus();
				return false;
			}
			if (main_work_content1El.value == "") {
				alert("주요업무를 입력하세요.");
				main_work_content1El.focus();
				return false;
			}
			if (qualification1El.value == "") {
				alert("자격요건을 입력하세요.");
				qualification1El.focus();
				return false;
			}
			if (preferential_treatment1El.value == "") {
				alert("우대사항을 입력하세요.");
				preferential_treatment1El.focus();
				return false;
			}
			if (region_idxEl.value == "") {
				alert("근무지역을 선택하세요.");
				region_idxEl.focus();
				return false;
			}
			if (company_addressEl.value == "") {
				alert("회사 주소를 입력하세요.");
				company_addressEl.focus();
				return false;
			}
			if (company_infoEl.value == "") {
				alert("회사 소개를 입력하세요.");
				company_infoEl.focus();
				return false;
			}

			// 모든 값이 유효할 경우 true 반환
			return true;
		};
		
		        skillStackEl.onchange = function(){
		        	//alert("123");
				let skillStack = skillStackEl.value;		       
		        const skillSelect = document.getElementById('skill');
		        //alert(skillStack);
		        // 기술 스택 초기화
		        skillSelect.innerHTML = '<option value="">기술 스택을 선택해주세요</option>';
		        
		        // AJAX 요청으로 서버에 선택된 분야 ID 전송
		       // fetch('/CompanyRecruit/SeletedSkillStackSkillList?skill_stack_idx='skillStack)
		        fetch('/CompanyRecruit/SeletedSkillStackSkillList?skill_stack_idx=' + skillStack)
		            .then(response => response.json())
		            .then(data => {
		                // 받아온 기술 스택 목록을 select 요소에 추가
		                data.forEach(skill => {
		                    const option = document.createElement('option');
		                    option.value = skill.skill_idx;
		                    option.textContent = skill.skill_name;
		                    skillSelect.appendChild(option);
		                });
		            })
		            .catch(error => console.error('Error:', error));
		        
		        }; 
		     // 선택된 스킬을 목록에 표시하고, 숨겨진 input에 값 저장
		        document.getElementById('skill').onchange = function() {
		            const selectedSkillsList = document.getElementById('selected-skills-list');
		            const selectedOptions = Array.from(this.selectedOptions);

		            selectedOptions.forEach(option => {
		                // 이미 선택된 스킬이 목록에 있는지 확인
		                if (!Array.from(selectedSkillsList.children).some(item => item.dataset.skillId === option.value)) {
		                    // 선택된 스킬을 표시할 li 요소 생성
		                    const listItem = document.createElement('li');
		                    listItem.textContent = option.textContent;
		                    listItem.dataset.skillId = option.value; // 스킬 ID를 데이터 속성에 저장

		                    // 숨겨진 input 요소 생성하여 선택한 스킬 값을 폼에 추가
		                    const hiddenInput = document.createElement('input');
		                    hiddenInput.type = 'hidden';
		                    hiddenInput.name = 'skill_idx'; // 서버로 보낼 때 사용될 이름
		                    hiddenInput.value = option.value;
		                    hiddenInput.id = 'hidden-skill-' + option.value; // ID로 식별 가능하게 설정

		                    // X 버튼 생성하여 선택 해제 기능 추가
		                    const removeButton = document.createElement('button');
		                    removeButton.textContent = 'X';
		                    removeButton.style.marginLeft = '10px';
		                    removeButton.onclick = function() {
		                        option.selected = false; // select에서 선택 해제
		                        listItem.remove(); // 목록에서 li 제거
		                        hiddenInput.remove(); // 숨겨진 input 요소 제거
		                    };

		                    listItem.appendChild(removeButton);
		                    selectedSkillsList.appendChild(listItem);
		                    selectedSkillsList.appendChild(hiddenInput); // 숨겨진 input을 목록에 추가
		                }
		            });
		        };
		        
		      
		    };
		    
		    function addInput(type) {
		        const mainWorkContainerEl = document.getElementById('mainWorkContainer'); // 주요업무 입력 필드 컨테이너
		        const qualificationContainerEl = document.getElementById('qualificationContainer'); // 자격요건 입력 필드 컨테이너
		        const benefitsContainerEl = document.getElementById('benefitsContainer'); // 우대사항 입력 필드 컨테이너

		        const currentInputsMainWork = mainWorkContainerEl.querySelectorAll('input'); // 현재 주요업무 입력 필드들
		        const currentInputsQualification = qualificationContainerEl.querySelectorAll('input'); // 현재 자격요건 입력 필드들
		        const currentInputsBenefits = benefitsContainerEl.querySelectorAll('input'); // 현재 우대사항 입력 필드들


		        // 각 타입별 최대 개수 체크
		        if (type === 'main_work_content' && currentInputsMainWork.length >= 2) {
		            alert('주요업무는 최대 3개까지 추가할 수 있습니다.');
		            return;
		        }
		        if (type === 'qualification' && currentInputsQualification.length >= 2) {
		            alert('자격요건은 최대 3개까지 추가할 수 있습니다.');
		            return;
		        }
		        if (type === 'preferential_treatment' && currentInputsBenefits.length >= 2) {
		            alert('우대사항은 최대 3개까지 추가할 수 있습니다.');
		            return;
		        }

		        const newInput = document.createElement('input'); // 새로운 입력 필드 생성
		        newInput.type = 'text';

		        // type에 따라 placeholder와 name 속성 설정
		        if (type === 'main_work_content') {
		            newInput.placeholder = '주요업무를 입력해주세요.';
		            newInput.name = 'main_work_content' + (currentInputsMainWork.length + 2); // 주요업무 name 속성
		            mainWorkContainerEl.appendChild(newInput); // 주요업무 컨테이너에 추가
		            mainWorkContainerEl.innerHTML += '<br>'; // 줄바꿈 추가
		        } if (type === 'qualification') {
		            newInput.placeholder = '자격요건을 입력해주세요.';
		            newInput.name = 'qualification' + (currentInputsQualification.length + 2); // 자격요건 name 속성
		            qualificationContainerEl.appendChild(newInput); // 자격요건 컨테이너에 추가
		            qualificationContainerEl.innerHTML += '<br>'; // 줄바꿈 추가
		        } if (type === 'preferential_treatment') {
		            newInput.placeholder = '우대사항을 입력해주세요.';
		            newInput.name = 'preferential_treatment' + (currentInputsBenefits.length + 2); // 우대사항 name 속성
		            benefitsContainerEl.appendChild(newInput); // 우대사항 컨테이너에 추가
		            benefitsContainerEl.innerHTML += '<br>'; // 줄바꿈 추가
		        }
		    }

		    
		
	 
</script>
</head>
<body>
  <%@include file="/WEB-INF/includes/headerCompanyUser.jsp" %>
	<form action="/CompanyRecruit/RecruitWrite" method="get" id="recruitWrite">
		<div class="container">
			<div class="form-section">
				<div class="title">채용공고 제목</div>
				<input type="text" class="title" name="recruit_title" placeholder="채용공고 제목을 입력해주세요."> 
				<input type="hidden" name="company_user_idx" value="${companyUserVo.company_user_idx}">
				<input type="text" name="company_name" value="${companyUserVo.company_name}" readonly>
				<div class="form-group">
					<label for="job">직무</label>
					 <select id="job" name="common_duty_idx">
						<option value="">직무를 선택해주세요.</option>
						<c:forEach var="commonDutyList" items="${commonDutyList}">
							<option value="${commonDutyList.common_duty_idx }">${commonDutyList.common_duty_name }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="job">학력</label>
					 <select id="job" name="education_status_idx">
						<option value="">학력를 선택해주세요.</option>
						<c:forEach var="educationStatuList" items="${educationStatuList}">
							<option value="${educationStatuList.education_status_idx }">${educationStatuList.education_status_type }</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="category">개발 분야 (필수)</label> 
					<select id="skillStack" >
						<option value="">분야를 선택해주세요</option>
						<c:forEach var="skillStack" items="${skillStackList}">
							<option value="${skillStack.skill_stack_idx}">${skillStack.skill_stack_name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="form-group">
			    <label for="skill">기술 스택 (필수)</label>
			    <select id="skill" multiple>
			        <option value="">기술 스택을 선택해주세요</option>
			    </select>
			    <ul id="selected-skills-list"></ul> <!-- 선택된 스킬들을 표시할 영역 -->
				</div>
				<div class="form-group">
					<label for="recruitment">모집인원</label> 
					<input type="number" id="recruitment" name="getman" placeholder="모집인원을 입력해주세요.">
				</div>
				<div class="form-group">
					<label for="recruitment">모집부문</label> 
					<input type="text" id="company_job" name="company_job" placeholder="모집부문을 입력해주세요.">
				</div>
				<div class="form-group">
					<label for="deadline">마감일</label> 
					<input type="date" id="deadline" name="application_deadline">
				</div>
				<div class="form-group">
					<label for="deadline">회사 설립일</label> 
					<input type="date" id="company_establish" name="company_establish" 
					value="${companyUserVo.company_establish }" readonly="readonly">
				</div>
				<div class="form-group">
			    <label for="main-task">주요업무</label>
			    <button type="button" class="add-button" onclick="addInput('main_work_content')">추가</button>
			    <input id="main-task" name="main_work_content1" placeholder="주요업무를 입력해주세요.">
			    <div id="mainWorkContainer"></div>
			</div>
			<div class="form-group">
			    <label for="qualifications">자격요건</label>
			    <button type="button" class="add-button" onclick="addInput('qualification')">추가</button>
			    <input id="qualifications" name="qualification1" placeholder="자격요건을 입력해주세요.">
			    <div id="qualificationContainer"></div>
			</div>
			<div class="form-group">
			    <label for="benefits">우대사항</label>
			    <button type="button" class="add-button" onclick="addInput('preferential_treatment')">추가</button>
			    <input id="benefits" name="preferential_treatment1" placeholder="우대사항을 입력해주세요.">
			    <div id="benefitsContainer"></div>
			</div>
				<div class="form-group">
					<label for="location">근무지역</label> <select id="location"
						name="region_idx">
						<option value="">지역 선택</option>
						<c:forEach var="regionList" items="${regionList}">
							<option value="${regionList.region_idx }">${regionList.region_name }</option>
						</c:forEach>
					</select> <input type="text" name="company_address"
						placeholder="상세 주소를 입력해주세요." style="margin-top: 10px;">
				</div>
				<div class="form-group">
					<label for="company-desc">회사소개</label>
					<textarea id="company-desc" name="company_info"
						placeholder="내용을 입력해주세요."></textarea>
				</div>
			</div>
			<div class="sidebar">
				<div class="sidebar-title">채용공고 작성</div>
				<ul class="required-fields">
					<li><span>*</span> 직무</li>
					<li><span>*</span> 기술스택</li>
					<li><span>*</span> 모집인원</li>
					<li><span>*</span> 마감일</li>
					<li><span>*</span> 주요업무</li>
					<li><span>*</span> 자격요건</li>
					<li><span>*</span> 우대사항</li>
					<li><span>*</span> 근무지역</li>
					<li><span>*</span> 회사소개</li>
				</ul>
				<div class="button-group">
					<input type="submit" class="submit-button" value="저장하기"> <input
						type="submit" class="cancel-button" value="취소하기">
				</div>
			</div>
		</div>
	</form>
</body>
</html>
