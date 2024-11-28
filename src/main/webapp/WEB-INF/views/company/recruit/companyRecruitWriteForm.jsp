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
    <script src="/js/headerSubmenu.js" defer></script>
<title>채용 공고 작성</title>
    <style>
* {
    box-sizing: border-box;
}
body {
    padding: 20px;
  
    margin: 0;
    display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    align-items: center; /* 수평 중앙 정렬 */
}
.wrapper {
    display: flex; /* 본문 내에서 플렉스 사용 */
    gap: 20px; /* 사이드바와 내용 사이의 간격 */
    justify-content: center; /* 수평 중앙 정렬 */
    width: 100%; /* 전체 너비 사용 */
}
.container {
    margin-top: 20px;
    display: flex; /* 본문 내에서 플렉스 사용 */
    height: 114px;
}
.input-container {
    width: 840px; /* input-container 너비 설정 */
    background-color: #fff;
    padding: 20px;
    border: 1px solid rgba(224, 224, 224, 0.5);
    border-radius: 8px;
    box-shadow: none;
}
.details-container {
    width: 840px; /* 전체 너비 설정 */
    background-color: #fff;
    padding: 20px;
    border: 1px solid rgba(224, 224, 224, 0.5);
    border-radius: 8px;
    margin-top: 20px; /* 컨테이너 간 여백 */
    box-shadow: none;
    height: auto;
    margin-bottom: 50px;
}
.sidebar {
   margin-left:20px;
    width: 340px; /* 사이드바 고정 너비 설정 */
    background-color: #fff; /* 흰색 배경 */
    padding: 20px;
    border: 1px solid rgba(224, 224, 224, 0.5); /* 연한 테두리 */
    border-radius: 8px;
    box-shadow: none;
    height: 598px; /* 높이를 자동으로 조정 */
      display: flex; /* 플렉스 컨테이너로 설정 */
    flex-direction: column; /* 세로 방향으로 정렬 */
    justify-content: space-between; /* 사이드바 내부 요소를 위 아래로 정렬 */
}
.sidebar-title {
    font-size: 36px;
    position: relative; /* 상대 위치 지정 */
    padding: 10px; /* 상하좌우 패딩 */
    font-weight: bold;
    margin-top: 5px;
}

.sidebar-title::after {
    content: ''; /* 가상의 요소 생성 */
    position: absolute; /* 절대 위치 지정 */
    left: 0;
    right: 0;
    bottom: -30px; /* 텍스트 아래쪽으로 10px 이동 */
    height: 1px; /* 선의 높이 */
    background: rgba(0, 0, 0, 0.1); /* 선의 색상 */
}
.sidebar-subtitle {
   margin-left:13px;
   margin-top:40px;
   font-size: 20px;
   font-weight: bold;
   
}
.title {
    font-size: 36px;
    font-weight: bold;
    padding: 10px;
    border: none; 
    outline: none; 
}
.button-group {
    display: flex;
    gap: 10px;
    flex-direction: column; /* 세로 방향으로 정렬 */
    align-items: center; /* 중앙 정렬 */
    margin-top: 20px; /* 상단 여백 추가 */
    width: 280px;
    margin-top: auto; /* 버튼 그룹을 아래쪽으로 이동 */
}
.submit-button, .cancel-button {
    padding: 10px 0;
    border-radius: 4px;
    font-weight: bold;
    cursor: pointer;
    width: 260px;
    font-size: 16px;
    text-align: cetner;
    margin-left: 25px;
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
.required-fields {
   margin-left:13px;
}

.jickmu {
  border: none; 
    outline: none; 
    margin-left: 13px;
    margin-top: 0px;
    font-weight: bold;
}

.default-option {
   color: gray; /* 기본 옵션 색상 설정 */
}

select {
    width: 97%; /* 원하는 너비 설정 */
    padding: 10px; /* 여백 추가 */
    font-size: 16px; /* 글자 크기 설정 */
    color: #767676; /* 기본 텍스트 색상 설정 */
    margin-left: 10px;
    margin-top: 0px;
    margin-bottom: 0px;
    background: #F5F5F8;
   border: none; 
    border-radius: 5px;
    height: auto; /* 자동 높이 설정 */
}
#skill {
    background-color: #F5F5F8; /* 선택된 배경색 */
    color: gray; /* 텍스트 색상 */
}

#skill option {
    background-color: #F5F5F8; /* 모든 옵션의 배경색 설정 */
    color: gray; /* 모든 옵션의 텍스트 색상 설정 */
}

#skill{
   margin-top: 10px; /* 위쪽 여백 제거 */
    margin-bottom: 20px; /* 아래쪽 여백 제거 */
}

 #skillStack {
    margin-top: 10px; /* 위쪽 여백 제거 */
    margin-bottom: 15px; /* 아래쪽 여백 제거 */
}


.form-group label {
    display: block; /* label을 블록 요소로 변경하여 아래에 위치하게 함 */
    margin-bottom: 1px; /* label과 input/select 간의 간격 */
}

#deadline {
    width: 97%; /* 입력 필드 너비 설정 */
    margin-left: 10px; /* 왼쪽 여백 추가 */
    padding: 10px; /* 여백 추가 */
    font-size: 16px; /* 글자 크기 설정 */
    color: #767676; /* 기본 텍스트 색상 설정 */
    background: #F5F5F8; /* 배경색 설정 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
}
.form-group input[type="number"],
.form-group input[type="text"] {
    width: 97%; /* 원하는 너비 설정 */
    padding: 10px; /* 여백 추가 */
    font-size: 16px; /* 글자 크기 설정 */
    color: #767676; /* 기본 텍스트 색상 설정 */
    margin-top: 1px; /* 위쪽 여백 추가 */
    background: #F5F5F8; /* 배경색 설정 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
    height: auto; /* 자동 높이 설정 */
    margin-left: 10px;
    margin-bottom: 1px;
}

.form-group select {
    width: 97%; /* 셀렉트 박스 너비 설정 */
    margin-top: 1px; /* 셀렉트 박스와 레이블 간의 간격 */
    margin-bottom:30px;
    padding: 10px; /* 여백 추가 */
    font-size: 16px; /* 글자 크기 설정 */
    color: #767676; /* 기본 텍스트 색상 설정 */
    background: #F5F5F8; /* 배경색 설정 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
}
.date-input {
    width: 97%; /* 입력 필드 너비 설정 */
    margin-left: 10px; /* 왼쪽 여백 추가 */
    padding: 10px; /* 여백 추가 */
    font-size: 16px; /* 글자 크기 설정 */
    color: #767676; /* 기본 텍스트 색상 설정 */
    background: #F5F5F8; /* 배경색 설정 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
    cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능함을 표시 */
    margin-bottom: 15px !important;
}
.location-flex-container {
    display: flex; /* 플렉스 박스 사용 */
    align-items: flex-start; /* 세로 정렬을 시작점으로 설정 */
    margin-top: 10px; /* 위쪽 여백 추가 */
}

.location-select {
    width: 160px !important; /* 지역 선택 필드의 너비 강제 설정 */
    padding: 10px; /* 여백 추가 */
    font-size: 16px; /* 글자 크기 설정 */
    color: #767676; /* 기본 텍스트 색상 설정 */
    background: #FFFFFF !important;/* 배경색 설정 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
    margin-right: 10px; /* 상세 주소 필드와의 간격 추가 */
     outline: none; /* 포커스 시 테두리 제거 */
}

.address-input {
    width: 700px !important; /* 상세 주소 필드의 너비 강제 설정 */
    padding: 10px; /* 여백 추가 */
    font-size: 20px; /* 글자 크기 설정 */
    color: #767676; /* 기본 텍스트 색상 설정 */
    background: #FFFFFF !important; /* 배경색 설정 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
     outline: none; /* 포커스 시 테두리 제거 */
}

.company-info {
    width: 97%; /* 원하는 너비 설정 */
    padding: 10px; /* 여백 추가 */
    font-size: 16px; /* 글자 크기 설정 */
    color: #767676; /* 기본 텍스트 색상 설정 */
    background: #F5F5F8; /* 배경색 설정 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
    height: auto; /* 자동 높이 설정 */
    margin-left: 10px; /* 왼쪽 여백 추가 */
    margin-bottom: 1px; /* 아래 여백 추가 */
    resize: none; /* 사용자가 크기를 조절할 수 없도록 설정 */
    overflow: hidden; /* 스크롤바 감추기 */
}

.gunmu {
 border: none; 
    outline: none; 
    margin-left: 13px;
    margin-top: 40px;
    font-weight: bold;
    margin-bottom: 20px !important;

}

.soge {
border: none; 
    outline: none; 
    margin-left: 13px;
    margin-top: 40px;
    font-weight: bold;
    margin-bottom: 20px !important;

}



.flex-container {
    display: flex; /* 플렉스 박스 사용 */
    justify-content: space-between; /* 레이블과 버튼 사이에 공간 분배 */
    align-items: center; /* 세로 중앙 정렬 */
    margin-bottom: 10px; /* 아래쪽 여백 추가 (필요시 조정) */
    margin-top: 20px;
}

.add-button {
    margin-left: auto; /* 버튼을 오른쪽 끝으로 이동 */
    padding: 5px 10px; /* 버튼 패딩 */
    font-size: 16px; /* 글자 크기 */
    cursor: pointer; /* 커서 포인터로 변경 */
    background-color: #ffffff; /* 버튼 배경색 */
    color: #767676; /* 버튼 글자색 */
    border: none; /* 테두리 제거 */
    border-radius: 4px; /* 모서리 둥글게 */
    font-weight: bold;
    margin-right: 5px !important;
}
 
.underline {
    height: 1px; /* 줄 높이 */
    background-color: black; /* 줄 색상 */
    margin: 10px 0; /* 위아래 여백 */
    width: 97%; /* 줄 너비 */
    margin-left: 10px !important;
}

#main-task {
    width: 97%; /* 너비 설정 */
    padding: 10px; /* 여백 추가 */
    font-size: 16px; /* 글자 크기 설정 */
    color: #767676; /* 기본 텍스트 색상 설정 */
    background: #ffffff; /* 배경색 설정 */
    margin-top: 5px; /* 위쪽 여백 추가 */
    margin-bottom: 20px; /* 아래쪽 여백 추가 */
    outline: none; /* 포커스 시 테두리 제거 */
    border: none; /* 테두리 제거 */
}

/* 포커스 시 스타일 */
#main-task:focus {
    border-color: #ffffff; /* 포커스 시 테두리 색상 */
}

#qualifications {
 width: 97%; /* 너비 설정 */
    padding: 10px; /* 여백 추가 */
    font-size: 16px; /* 글자 크기 설정 */
    color: #767676; /* 기본 텍스트 색상 설정 */
    background: #ffffff; /* 배경색 설정 */
    margin-top: 5px; /* 위쪽 여백 추가 */
    margin-bottom: 20px; /* 아래쪽 여백 추가 */
    outline: none; /* 포커스 시 테두리 제거 */
    border: none; /* 테두리 제거 */
}
#qualifications:focus {
  border-color: #ffffff; /* 포커스 시 테두리 색상 */
}

#benefits {
width: 97%; /* 너비 설정 */
    padding: 10px; /* 여백 추가 */
    font-size: 16px; /* 글자 크기 설정 */
    color: #767676; /* 기본 텍스트 색상 설정 */
    background: #ffffff; /* 배경색 설정 */
    margin-top: 5px; /* 위쪽 여백 추가 */
    margin-bottom: 20px; /* 아래쪽 여백 추가 */
    outline: none; /* 포커스 시 테두리 제거 */
    border: none; /* 테두리 제거 */
}
#benefits:focus {
border-color: #ffffff;
}


#company-desc {
width: 97%; /* 너비 설정 */
    padding: 10px; /* 여백 추가 */
    font-size: 16px; /* 글자 크기 설정 */
    color: #767676; /* 기본 텍스트 색상 설정 */
    background: #ffffff; /* 배경색 설정 */
    margin-top: 5px; /* 위쪽 여백 추가 */
    margin-bottom: 20px; /* 아래쪽 여백 추가 */
    outline: none; /* 포커스 시 테두리 제거 */
    border: none;
 
}
</style>
<script type="text/javascript">
window.onload = function() {

    const recruit_titleEl = document.querySelector('[name="recruit_title"]');
    const common_duty_idxEl = document.querySelector('[name="common_duty_idx"]');
    const getmanEl = document.querySelector('[name="getman"]');
    const application_deadlineEl = document.querySelector('[name="application_deadline"]');
    const main_work_content1El = document.querySelector('[name="main_work_content1"]');
    const qualification1El = document.querySelector('[name="qualification1"]');
    const preferential_treatment1El = document.querySelector('[name="preferential_treatment1"]');
    const region_idxEl = document.querySelector('[name="region_idx"]');
    const company_addressEl = document.querySelector('[name="company_address"]');
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

    skillStackEl.onchange = function() {
        let skillStack = skillStackEl.value;       
        const skillSelect = document.getElementById('skill');

        // 기술 스택 초기화 (기본 옵션 제거)
        skillSelect.innerHTML = ''; // 기존 옵션 제거

        // AJAX 요청으로 서버에 선택된 분야 ID 전송
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
function autoResize(textarea) {
    textarea.style.height = 'auto'; // 높이를 초기화하여 줄 수에 따라 조정
    textarea.style.height = textarea.scrollHeight + 'px'; // 콘텐츠에 맞게 높이 조정

    // 부모 요소의 높이를 조정
    const parent = textarea.closest('.form-group');
    if (parent) {
        parent.style.height = 'auto'; // 부모 높이를 초기화
        parent.style.height = textarea.scrollHeight + 'px'; // 자식 요소에 맞게 조정
    }
}

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
    } else if (type === 'qualification') {
        newInput.placeholder = '자격요건을 입력해주세요.';
        newInput.name = 'qualification' + (currentInputsQualification.length + 2); // 자격요건 name 속성
        qualificationContainerEl.appendChild(newInput); // 자격요건 컨테이너에 추가
    } else if (type === 'preferential_treatment') {
        newInput.placeholder = '우대사항을 입력해주세요.';
        newInput.name = 'preferential_treatment' + (currentInputsBenefits.length + 2); // 우대사항 name 속성
        benefitsContainerEl.appendChild(newInput); // 우대사항 컨테이너에 추가
    }

    // 스타일 적용
    newInput.style.width = '97%'; // 너비 설정
    newInput.style.padding = '10px'; // 여백 추가
    newInput.style.fontSize = '16px'; // 글자 크기 설정
    newInput.style.color = '#767676'; // 기본 텍스트 색상 설정
    newInput.style.background = '#FFFFFF'; // 배경색 설정
    newInput.style.border = 'none'; // 테두리 제거
    newInput.style.borderRadius = '5px'; // 모서리 둥글게
    newInput.style.marginTop = '5px'; // 위쪽 여백 추가
    newInput.style.marginBottom = '20px'; // 아래쪽 여백 추가
    newInput.style.marginLeft = '0'; // 왼쪽 여백을 0으로 설정하여 왼쪽으로 더 당김
    newInput.style.outline = 'none'; // 포커스 시 아웃라인 제거


}
</script>
</head>
<body>
    <%@include file="/WEB-INF/includes/headerCompanyUser.jsp" %>
    <form action="/CompanyRecruit/RecruitWrite" method="get" id="recruitWrite">
        <div class="container">
            <!-- 1. 채용공고 제목 입력 -->
            <div class="input-container">
                <input type="text" class="title" name="recruit_title" placeholder="채용공고 제목을 입력해주세요."> 
                <input type="hidden" name="company_user_idx" value="${companyUserVo.company_user_idx}">
                <input type="hidden" name="company_name" value="${companyUserVo.company_name}">
                
            </div>

            <!-- 2. 오른쪽 사이드바 -->
            <div class="sidebar">
                <div class="sidebar-title">채용공고 작성</div>
                </br>
               
                <div class="sidebar-subtitle">입력항목</div>
                </br>
                <ul class="required-fields">
                    <li><span>*</span> 직무</li>
                    <li><span>&nbsp;&nbsp;</span> 기술스택</li>
                    <li><span>*</span> 모집인원</li>
                    <li><span>*</span> 마감일</li>
                    <li><span>*</span> 주요업무</li>
                    <li><span>*</span> 자격요건</li>
                    <li><span>*</span> 우대사항</li>
                    <li><span>*</span> 근무지역</li>
                    <li><span>*</span> 회사소개</li>
                    </br>
                </ul>
                <div class="button-group">
                    <input type="submit" class="submit-button" value="저장하기">
                    <input type="submit" class="cancel-button" value="취소하기">
                </div>
            </div>
        </div>
        <div class="details-container">
            <div class="form-group">
                <label for="job" class="jickmu">직무</label>
                <select id="job" name="common_duty_idx">
                    <option value="" class="default-option">직무를 선택해주세요.</option>
                    <c:forEach var="commonDutyList" items="${commonDutyList}">
                        <option value="${commonDutyList.common_duty_idx}">${commonDutyList.common_duty_name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="job"  class="jickmu">학력</label>
                <select id="job" name="education_status_idx">
                    <option value="">학력을 선택해주세요.</option>
                    <c:forEach var="educationStatuList" items="${educationStatuList}">
                        <option value="${educationStatuList.education_status_idx}">${educationStatuList.education_status_type}</option>
                    </c:forEach>
                </select>
            </div>
           <div class="form-group">
    <label for="skillStack" class="jickmu">개발 분야</label>
    <select id="skillStack">
        <option value="">분야를 선택해주세요.</option></br>
        <c:forEach var="skillStack" items="${skillStackList}">
            <option value="${skillStack.skill_stack_idx}">${skillStack.skill_stack_name}</option>
        </c:forEach>
    </select>
</div>
<div class="form-group">
    <label for="skill" class="jickmu">기술 스택</label>
    <select id="skill" multiple>
        <option value="" disabled selected>기술 스택을 등록해주세요.</option>
    </select>
    <ul id="selected-skills-list"></ul>
</div>
            <div class="form-group">
                <label for="recruitment" class="jickmu">모집인원</label> 
                <input type="number" id="recruitment" name="getman" placeholder="모집인원을 입력해주세요.">
            </div>
            <div class="form-group">
                <label for="recruitment" class="jickmu">모집부문</label> 
                <input type="text" id="company_job" name="company_job" placeholder="모집부문을 입력해주세요.">
            </div>
         <div class="form-group">
    <label for="deadline" class="jickmu">마감일</label>
    <input type="date" id="deadline" name="application_deadline" class="date-input" required> <!-- class로 스타일링 -->
</div>
            <div class="form-group">
                <input type="hidden" id="company_establish" name="company_establish" value="${companyUserVo.company_establish}" readonly="readonly">
            </div>
            
            
            
       <div class="form-group">
    <div class="flex-container">
        <label for="main-task" class="jickmu">주요업무</label>
        <button type="button" class="add-button" onclick="addInput('main_work_content')">추가</button>
    </div>
    <div class="underline"></div> <!-- 줄 추가 -->
    <input id="main-task" name="main_work_content1" placeholder="주요업무를 입력해주세요.">
    <div id="mainWorkContainer"></div>
</div>

<div class="form-group">
    <div class="flex-container">
        <label for="qualifications" class="jickmu">자격요건</label>
        <button type="button" class="add-button" onclick="addInput('qualification')">추가</button>
    </div>
    <div class="underline"></div> <!-- 줄 추가 -->
    <input id="qualifications" name="qualification1" placeholder="자격요건을 입력해주세요.">
    <div id="qualificationContainer"></div>
</div>

<div class="form-group">
    <div class="flex-container">
        <label for="benefits" class="jickmu">우대사항</label>
        <button type="button" class="add-button" onclick="addInput('preferential_treatment')">추가</button>
    </div>
    <div class="underline"></div> <!-- 줄 추가 -->
    <input id="benefits" name="preferential_treatment1" placeholder="우대사항을 입력해주세요.">
    <div id="benefitsContainer"></div>
</div>

 <div class="form-group">
    <label for="location" class="gunmu">근무지역</label>
    <div class="underline"></div> <!-- 줄 추가 -->
    <div class="location-flex-container"> <!-- 새로운 클래스 사용 -->
        <select id="location" name="region_idx" class="location-select"> <!-- 클래스 추가 -->
            <option value="" class="ji">지역 선택</option>
            <c:forEach var="regionList" items="${regionList}">
                <option value="${regionList.region_idx}">${regionList.region_name}</option>
            </c:forEach>
        </select>
        <input type="text" name="company_address" placeholder="상세 주소를 입력해주세요." class="address-input"> <!-- 클래스 추가 -->
    </div>
</div>

        <div class="form-group">
    <label for="company-desc" class="soge">회사소개</label>
     <div class="underline"></div> <!-- 줄 추가 -->
    <textarea id="company-desc" name="company_info" placeholder="내용을 입력해주세요." class="company-info"></textarea> <!-- class 추가 -->
</div>
        </div>
    </form>
</body>
</html>