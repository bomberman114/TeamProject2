<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>잡집사</title>
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <script src="/js/headerSubmenu.js" defer></script>
    <script src="/js/inputForm.js" defer></script>
  </head>
  <body>
    <%@include file="/WEB-INF/includes/headerUser.jsp" %>
    <main class="write-form">
      <form action="/Users/MyPage/Resume/Update" method="post">
        <input type="hidden" name="user_idx" value="${vo.USER_IDX}">
        <input type="hidden" name="user_resume_idx" value="${vo.USER_RESUME_IDX}">
        <input type="hidden" name="user_gender" value="${vo.USER_GENDER}">
        <input type="hidden" name="user_name" value="${vo.USER_NAME}">
        <input type="hidden" name="user_birth" value="${vo.USER_BIRTH}">
        <input type="hidden" name="user_phone" value="${vo.USER_PHONE}">
        <input type="hidden" name="user_email" value="${vo.USER_EMAIL}">
        <div class="inner">
          <div class="resume-container">
            <div class="resume-title">
              <input
                type="text"
                name="user_title"
                placeholder="이력서 제목을 입력해주세요."
                required="required"
                value = "${vo.USER_TITLE}"
              />
            </div>
            <div class="resume-content">
              <div class="user-info">
                <div class="user-img"><img alt="프로필 이미지" src="${map.USER_SFILE_NAME}"></div>
                <div class="user-details">
                  <div class="user-util">
                    <h3>
                      ${vo.USER_NAME}
                      <select name="user_resume_career_type">
                      	<c:choose>
                      		<c:when test="${vo.CAREER_TYPE eq 'exp'}">
                      			<option value="">신입</option>
                        		<option value="exp" selected="selected">경력</option>
                      		</c:when>
                      		<c:otherwise>
                      			<option value="" selected="selected">신입</option>
                        		<option value="exp" >경력</option>
                      		</c:otherwise>
                      	</c:choose>
                      </select>
                    </h3>
                    <a href="/Users/MyPage/UpdateForm">계정정보 설정</a>
                  </div>
                  <ul>
                    <li>
                      <img
                        src="/images/icon/Calendar.png"
                        alt="생년월일"
                      />${vo.USER_BIRTH}년생(${vo.USER_GENDER})
                    </li>
                    <li>
                      <img
                        src="/images/icon/Phone.png"
                        alt="전화번호"
                      />${vo.USER_PHONE}
                    </li>
                    <li>
                      <img src="/images/icon/Mail.png" alt="이메일" />
                      ${vo.USER_EMAIL}
                    </li>
                  </ul>
                </div>
              </div>
              <ul class="resume-details">
                <li>
                  <p>지역</p>
                  <select class="write-input" name="region_idx" required>
                    <option style="display: none;" value="">지역를 선택해주세요.</option>
                    <c:forEach var="item" items="${regionList}">
                    	<c:choose>
                    		<c:when test="${vo.REGION_NAME eq item.region_name}">
                    			<option value="${item.region_idx}" selected="selected">${item.region_name}</option>    
                    		</c:when>
                    		<c:otherwise>
                    			<option value="${item.region_idx}">${item.region_name}</option>                    		
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                  </select>
                  <input class="write-input" type="text" name="region_address" required="required" placeholder="상세 주소를 입력해주세요." style="margin-top : 8px" value="${vo.REGION_ADDRESS}">
                </li>
                <li>
                  <p>직무</p>
                  <select class="write-input" name="common_duty_idx" required>
                    <option style="display: none;" value="">직무를 선택해주세요.</option>
                    <c:forEach var="item" items="${dutyList}">
                    		<c:choose>
                    		<c:when test="${vo.COMMON_DUTY_NAME eq item.common_duty_name}">
                    			<option value="${item.common_duty_idx}" selected="selected">${item.common_duty_name}</option>    
                    		</c:when>
                    		<c:otherwise>
                    	    <option value="${item.common_duty_idx}">${item.common_duty_name}</option>               		
                    		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                  </select>
                </li>
                <li class="stack-input-li">
                  <p>기술스택(업무 툴/스킬)</p>
                  <ul class="select-stack-list">
                  	<c:forEach var="skill" items="${selectedSkills}" varStatus="status">
                  		<li data-skillidx="${skill.SKILL_IDX}">${skill.SKILL_NAME}<img src="/images/icon/stack-remove.png" alt="스택 제거" onclick="removeStack(${status.index})"></li>
                  	</c:forEach>
                  </ul>
                  <div class="write-input search-stack-input">
                    <img
                      src="/images/icon/stack-search.png"
                      alt="기술스택 검색"
                    />기술스택을 등록해주세요.
                    <div class="search-stack-list">
                      <div class="stack-inner">
                        <ul class="stack-type">
                          <c:forEach var="item" items="${stackList}">
                    				<li data-stackId="${item.skill_stack_idx}">${item.skill_stack_name}</li>
                    	  </c:forEach>
                        </ul>
                        <ul class="stack-list">
                          <c:forEach var="item" items="${initialSkillList}">
                    				<li data-skillidx="${item.skill_idx}">${item.skill_name}</li>
                    	  </c:forEach>
                        </ul>
                      </div>
                    </div>
                  </div>
                </li>
                <li>
                  <p class="punder">학력</p>
                  <div class="edu-inner">
                    <div>
                      <select name="education_status_idx" required="required">
 							<c:forEach var="item" items="${eduList }">
		                    		<c:choose>
			                    		<c:when test="${vo.EDUCATION_STATUS_TYPE eq item.education_status_type}">
			                    			<option value="${item.education_status_idx}" selected="selected">${item.education_status_type}</option>    
			                    		</c:when>
			                    		<c:otherwise>
			                    	    <option value="${item.education_status_idx}">${item.education_status_type}</option>            		
			                    		</c:otherwise>
		                    	</c:choose>
                    		</c:forEach>
                      </select>
                    </div>
                    <span><img src="/images/icon/space-bar.png" alt=""></span>
                    <input type="text" name="user_school_name" placeholder="학교명을 입력해주세요." value="${vo.USER_SCHOOL_NAME}" required="required">
                  </div>
                </li>
                <c:choose>
              		<c:when test="${vo.CAREER_TYPE eq 'exp'}">
              			<li class="career-li" style="display: block">
		                  <p class="punder">경력(업무경험)</p>
		                  <div class="career-inner">
		                    <div class="date-input">
		                      <input type="text" placeholder="YYYYMM" name="user_wooked_year_start" value="${vo.USER_WOOKED_YEAR_START}"  oninput="formatBirthNumber(this)" maxlength="6">
		                      <span>~</span>
		                      <input type="text" placeholder="YYYYMM" name="user_wooked_year_end" value="${vo.USER_WOOKED_YEAR_END}"   oninput="formatBirthNumber(this)" maxlength="6">
		                    </div>
		                    <span><img src="/images/icon/space-bar.png" alt="여백바"></span>
		                    <div class="career-info">
		                      <input type="text" name="user_wooked_company_name" placeholder="회사명을 입력해주세요." value="${vo.USER_WOOKED_COMPANY_NAME}"   required >
		                      <textarea name="user_career_contente" placeholder="주요업무 및 성과를 입력해주세요."  oninput="handleResizeHeight(this)" >${vo.USER_CAREER_CONTENTE}</textarea>
		                    </div>
		                  </div>
		                </li>
              		</c:when>
              		<c:otherwise>
            			<li class="career-li">
		                  <p class="punder">경력(업무경험)</p>
		                  <div class="career-inner">
		                    <div class="date-input">
		                      <input type="text" placeholder="YYYYMM" name="user_wooked_year_start" disabled oninput="formatBirthNumber(this)" maxlength="6">
		                      <span>~</span>
		                      <input type="text" placeholder="YYYYMM" name="user_wooked_year_end" disabled oninput="formatBirthNumber(this)" maxlength="6">
		                    </div>
		                    <span><img src="/images/icon/space-bar.png" alt="여백바"></span>
		                    <div class="career-info">
		                      <input type="text" name="user_wooked_company_name" placeholder="회사명을 입력해주세요." required disabled>
		                      <textarea name="user_career_contente" placeholder="주요업무 및 성과를 입력해주세요." oninput="handleResizeHeight(this)" disabled></textarea>
		                    </div>
		                  </div>
		                </li>
              		</c:otherwise>
              	</c:choose>
                <li class="intro-inner">
                  <p class="punder">자기소개서</p>
                  <input
                    type="text"
                    name = "user_resume_intro_title"
                    placeholder="자기소개서 제목을 입력해주세요"
                    value = "${vo.USER_RESUME_INTRO_TITLE}"
                    required
                  />
                  <textarea name="user_resume_intro_content" placeholder="내용을 입력해주세요." oninput="handleResizeHeight(this)" rows="4">${vo.USER_RESUME_INTRO_CONTENT}</textarea>
                </li>
              </ul>
            </div>
          </div>
          <aside>
          	<div class="aside-inner">
	            <h3>이력서 수정</h3>
	            <p>입력항목</p>
	            <ul>
	              <li><span>*</span>지역</li>
	              <li><span>*</span>직무</li>
	              <li><span></span>기술스택</li>
	              <li><span>*</span>학력</li>
	              <li><span></span>경력</li>
	              <li><span>*</span>자기소개서</li>
	            </ul>
	            <div class="write-btn-container">
	              <button class="write-btn">수정하기</button>
	              <a href="/Users/MyPage/Resume/List">취소하기</a>
	            </div>  	
          	</div>
          </aside>
        </div>
      </form>
    </main>
    <script>
      const $searchInput  = document.querySelector(".search-stack-input");
      const $stackList    = document.querySelector(".search-stack-list");
      const $stackItem    = document.querySelectorAll(".stack-list li");
      const $selectList   = document.querySelector(".select-stack-list");
      const $voSkills     = document.querySelectorAll(".select-stack-list li");
      let selectSkillList = []
			$voSkills.forEach((skill,i)=>{
				let li = skill;
				let obj = {"skill_idx" : li.dataset.skillidx , "skill_name" : li.textContent}
				selectSkillList.push(obj);
      })
      console.log(selectSkillList)
      let selectSkill = {};
      

      $searchInput.addEventListener("click", (e) => {
        e.stopPropagation();
        $stackList.style.display = "block";
      });

      document.addEventListener("click", (e) => {
        const element = e.target;
        if (!element.closest(".search-stack-list")) {
          $stackList.style.display = "none";
        }
      });
      
      const $skillListInner  = document.querySelector(".stack-list")

      $skillListInner.addEventListener('click', function(e) {
    	  if (e.target.tagName === 'LI') {
    	    // 클릭된 li 요소에 대한 처리
    		 	selectSkill = {"skill_idx" : e.target.dataset.skillidx , "skill_name" : e.target.textContent}

    	          selectSkillList.push(selectSkill);
    	        	selectSkillList =  [ ...new Map(selectSkillList.map((obj) => [obj["skill_idx"], obj])).values() ];
    	        	console.log(selectSkillList)
    	        	
    	          displaySelectStack(selectSkillList, $selectList);
    	  }
    	});
      
      /*
      $stackItem.forEach((item) => {
        item.addEventListener("click", (e) => {
        	selectSkill = {"skill_idx" : e.target.dataset.skillidx , "skill_name" : item.textContent}

          selectSkillList.push(selectSkill);
        	selectSkillList =  [ ...new Map(selectSkillList.map((obj) => [obj["skill_idx"], obj])).values() ];
        	console.log(selectSkillList)
        	
          displaySelectStack(selectSkillList, $selectList);
        });
      });
      */

      function displaySelectStack(arr, output) {
        let listInner = "";
        arr.forEach((a,i) => {
          listInner += `<li data-skillidx=`+ a.skill_idx+ `>`+a.skill_name+`<img src="/images/icon/stack-remove.png" alt="스택 제거" onclick="removeStack(`+ i +`)"></li>`;
        });
        output.innerHTML = listInner;
      }

      function removeStack(index){
        console.log(index)
        selectSkillList.splice(index,1);
        displaySelectStack(selectSkillList, $selectList);
      }

      const $textareas = document.querySelectorAll("textarea");
      function handleResizeHeight(item){
        item.style.height = "auto";
        item.style.height = item.scrollHeight + "px"
      }

      const $careerBtn = document.querySelector(".user-util h3 select")
      $careerBtn.addEventListener("change",(e)=>{
        const $careerLi = document.querySelector(".career-li")
        const $careerInput = document.querySelectorAll(".career-li input, .career-li textarea ")
        console.log($careerInput)
        console.log(e.target.value )
        if(e.target.value == ""){
          $careerLi.style.display = "none"
          $careerInput.forEach(input=>{
            input.disabled = true;
            input.required = false;
          })
        }else{
          $careerLi.style.display = "block"
          $careerInput.forEach(input=>{
            input.disabled = false;
            input.required = true;
          })
        }
      })
      
      const $form = document.querySelector("form");
      $form.addEventListener("submit",(e)=>{
        e.preventDefault();
        selectSkillList.forEach(skill=>{
          let stackInput = document.createElement("input")
          stackInput.type  = "hidden";
          stackInput.name  = "skill_idx";
          stackInput.value = skill.skill_idx
          $form.append(stackInput);
        })
        $form.submit()
      })
      
      const $searchStackList = document.querySelectorAll(".stack-type li")

      $searchStackList[0].classList.add("stack-active");
      $searchStackList.forEach(stack=>{
    	  stack.addEventListener("click",(e)=>{
    		  $searchStackList.forEach(a=>{
    			  a.classList.remove("stack-active")
    		  })
    	 		e.target.classList.add("stack-active");
    		 selectStackAjax(e.target.dataset.stackid)
    	  })
      })
      
      async function selectStackAjax(stackId) {
	    const res =  await fetch("/Users/MyPage/Resume/SkillFindById", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json",
	        },
	        body: JSON.stringify({ stackId: stackId })
	    });
	
	    if (!res.ok) {
	        throw new Error(`HTTP error status: ${res.status}`);
	    }
	
	    const result = await res.json();
	    const skillList = result.selectSkillList;
	    console.log(skillList)
	    let html = ""
	    skillList.forEach(skill=>{
	    	let li = "<li data-skillidx="+skill.skill_idx+">"+skill.skill_name+"</li>"
	    	html += li
	    })
	    $skillListInner.innerHTML = html;
	    return result;
	}
      
    </script>
  </body>
</html>
