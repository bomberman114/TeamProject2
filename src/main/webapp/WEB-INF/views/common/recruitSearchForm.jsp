<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>잡집사</title>
<link rel="icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/style.css" />
<script src="/js/headerMain.js" defer></script>
</head>
<body>
	<%@include file="/WEB-INF/includes/headerMain.jsp"%>
	<div class="filter-inner">
		<div class="inner">
			<ul>
				<li>
					<div class="write-input search-stack-input">
						기술스택
						<div class="search-stack-list">
							<div class="stack-inner">
								<ul class="stack-type">
									<c:forEach var="item" items="${stackList}">
										<li data-stackId="${item.skill_stack_idx }">${item.skill_stack_name }</li>
									</c:forEach>
								</ul>
								<ul class="stack-list">
									<c:forEach var="item" items="${initialSkillList}">
										<li data-skillidx="${item.skill_idx }">${item.skill_name }</li>
									</c:forEach>
								</ul>
							</div>
						  <ul class="select-stack-list"></ul>
						</div>
					</div>
				</li>
				<li><select name="region">
						<option selected="selected" value="">지역</option>
						<c:forEach var="item" items="${regionList}">
							<option value="${item.region_idx}">${item.region_name}</option>
						</c:forEach>
				</select></li>
				<li><select name="duty">
						<option selected="selected"  value="">직무</option>
						<c:forEach var="item" items="${dutyList}">
							<option value="${item.common_duty_idx}">${item.common_duty_name}</option>
						</c:forEach>
				</select></li>
				<li class="filter-reset-btn"></li>
			</ul>
			<ul>
				<li><input type="radio" name="filter" value="earliest" id="early" checked="checked"><label for="early">최신순</label></li>
				<li><input type="radio" name="filter" value="popular" id="popular"><label for="popular">인기순</label></li>
			</ul>
		</div>
	</div>
	<main class="home recruit-serarchForm">
		<div class="inner">
			<div class="recruit-list recruit-serarchForm-list">

			</div>
		</div>
	</main>
	<%@include file="/WEB-INF/includes/footer.jsp"%>
	<script>
	
		let $bookMarkUp   = null;
		let $bookMarkDown = null;
		let regionIdx     = "";
		let dutyIdx       = "";
		let filter        = document.querySelector("input[name='filter']").value
		let skillList     = null;
		let search        = "${search}" ? "${search}" : "";

    document.addEventListener("click", (e) => {
    		const clicked = e.target;
        if (clicked.matches(".bookmark")) {
          if ("${sessionScope.userLogin}") {
            const userIdx = "${sessionScope.userLogin.user_idx}";
            const recruitIdx = e.target.dataset.recruitidx;
            if (clicked.classList[1] == "mark-down") {
            	  clicked.classList.remove("mark-down");
            	  clicked.classList.add("mark-up");
                  recruitBookMarkAjax(userIdx, recruitIdx);
                  clicked.src = "/images/icon/mark-up.png";
            } else {
            	  clicked.classList.remove("mark-up");
            	  clicked.classList.add("mark-down");
                  recruitBookMarkAjax(userIdx, recruitIdx);
                  clicked.src = "/images/icon/mark-off.png";
            }
          } else {
            alert("로그인이 필요합니다.");
          }
        }
        
        if (!clicked.closest(".search-stack-list")) {
            $stackList.style.display = "none";
          }
        if (clicked.matches(".search-stack-list")) {
            $stackList.style.display = "none";
          }
        
        if (clicked.matches(".filter-reset-btn")) {
        		location.href="/Common/RecruitSearchForm?search="
          }
        
        
    })	
		async function recruitBookMarkAjax(userIdx, recruitIdx) {
	    const res = await fetch(`/Users/RecruitMarkUp`, {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json",
	        },
	        body: JSON.stringify({ userIdx : userIdx, recruitIdx : recruitIdx})
	    });
	
	    if (!res.ok) {
	        throw new Error(`HTTP error status: ${res.status}`);
	    }
	
	    const result = await res.json();
	    return result.vo;
	}
		
	      const $searchInputDiv = document.querySelector(".search-stack-input");
	      const $stackList      = document.querySelector(".search-stack-list");
	      const $stackItem      = document.querySelectorAll(".stack-list li");
	      const $selectList     = document.querySelector(".select-stack-list");

	      let selectSkill = {};
	      let selectSkillList = [];

	      $searchInputDiv.addEventListener("click", (e) => {
	        e.stopPropagation();
	        $stackList.style.display = "block";
	      });

	      const $skillListInner  = document.querySelector(".stack-list")

	      $skillListInner.addEventListener('click', function(e) {
	    	  if (e.target.tagName === 'LI') {
	    	    // 클릭된 li 요소에 대한 처리
	    	     $selectList.style.display = "flex";
	    		 	selectSkill = {"skill_idx" : e.target.dataset.skillidx , "skill_name" : e.target.textContent}
	    		 				if(skillList == null){
			              skillList = [];    		 					
	    		 				}
	    	          selectSkillList.push(selectSkill);
	    	        	selectSkillList =  [ ...new Map(selectSkillList.map((obj) => [obj["skill_idx"], obj])).values() ];
	    	        	skillList.push(e.target.dataset.skillidx)
	    	        	skillList = new Set(skillList)
	    	        	skillList = Array.from(skillList)
	    	        	
	    	          displaySelectStack(selectSkillList, $selectList);
	    	        	filterRecruitAjax(regionIdx,dutyIdx,skillList,filter,search);
	    	  }
	    	});
	      

	      function displaySelectStack(arr, output) {
	        let listInner = "";
	        arr.forEach((a,i) => {
	          listInner += `<li data-skillidx=`+ a.skill_idx+ `>`+a.skill_name+`<img src="/images/icon/stack-remove.png" alt="스택 제거" onclick="removeStack(`+ i +`)"></li>`;
	        });
	        output.innerHTML = listInner;
	      }

	      function removeStack(index){
	        selectSkillList.splice(index,1);
	        if(selectSkillList.length < 1){ $selectList.style.display = "none";}
	        displaySelectStack(selectSkillList, $selectList);
	        skillList.splice(index,1);
	        if(skillList.length == 0){
	        	skillList = null;
	        	filterRecruitAjax(regionIdx,dutyIdx,skillList,filter,search);
	        }else{
	        	filterRecruitAjax(regionIdx,dutyIdx,skillList,filter,search);
	        }
	      }

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
	    const skillVoList = result.selectSkillList;
	    let html = ""
	    	skillVoList.forEach(skill=>{
	    	let li = "<li data-skillidx="+skill.skill_idx+">"+skill.skill_name+"</li>"
	    	html += li
	    })
	    $skillListInner.innerHTML = html;
	    
	    return result;
	}
		      
      const $recruitlist = document.querySelector(".recruit-list")
      async function filterRecruitAjax(regionIdx,dutyIdx,skillList,filter,search) {
  	    const res =  await fetch("/Common/FilterRecruitList", {
  	        method: "POST",
  	        headers: {
  	            "Content-Type": "application/json",
  	        },
  	        body: JSON.stringify({ regionIdx: regionIdx, dutyIdx : dutyIdx, skillList : skillList, filter : filter, search : search})
  	    });
  	
  	    if (!res.ok) {
  	        throw new Error(`HTTP error status: ${res.status}`);
  	    }
  	
  	    const result       = await res.json();
  	    const recruitList  = result.fiterRecruitList;
  	    const bookmarkList = result.bookmarkList;	
  	    
  	    let html = "";
  	    recruitList.forEach(recruit=>{
  	    	let isbookmarked = false;
  	    	html += '<div class="recruit-card">'
  	    		if("${sessionScope.userLogin}"){
  	    			bookmarkList.forEach((bookmark)=>{
  	    				if(bookmark.company_recruit_idx == recruit.COMPANY_RECRUIT_IDX && bookmark.bookmark_check == 1){
  	    					isbookmarked = true;
  	    				}
  	    			})
  	    			if(isbookmarked){
  	    				html += '<img class="bookmark mark-up" src="/images/icon/mark-up.png" alt="북마크" data-recruitidx="'+ recruit.COMPANY_RECRUIT_IDX +'">'
  	    			}else{
  	    				html += '<img class="bookmark mark-down" src="/images/icon/mark-off.png" alt="북마크" data-recruitidx="' + recruit.COMPANY_RECRUIT_IDX + '">'
  	    			}	  	    			
  	    		}else{
  	    			html += '<img class="bookmark mark-down" src="/images/icon/mark-off.png" alt="북마크" data-recruitidx="' + recruit.COMPANY_RECRUIT_IDX + '">'
  	    		}
  	    	html += '<div class="recruit-img">'
  	    	if(recruit.COMPANY_SFILE_NAME != "/img/commonImage/null"){
  	    		html += '<a href="/Common/RecruitOneView?company_recruit_idx='+ recruit.COMPANY_RECRUIT_IDX +'"></a>'
  	    		html += '<img src ="'+recruit.COMPANY_SFILE_NAME+ '"></div>'
  	    	}else{
  	    		html += '<a class="not-image" href="/Common/RecruitOneView?company_recruit_idx='+ recruit.COMPANY_RECRUIT_IDX +'">등록된 이미지가 없습니다.</a></div>'
  	    	}
  	    	html += '<div class="recruit-info"><div class="company-info">'
  	    	html += '<p class="recruit-title"><a href="/Common/RecruitOneView?company_recruit_idx='+ recruit.COMPANY_RECRUIT_IDX +'">'+recruit.RECRUIT_TITLE+'</a></p>'
  	    	html += '<p class="company-name">'+ recruit.COMPANY_NAME + '</p></div>'
  	    	html += '<ul class="stack-list">'
  	    	if(recruit.SKILLS != null){
  	    		html +=	'<li>'+ recruit.REGION_NAME + ', ' + recruit.COMMON_DUTY_NAME +', ' + recruit.SKILLS + '</li>'
  	    	}else{
  	    		html += '<li>'+ recruit.REGION_NAME +', ' + recruit.COMMON_DUTY_NAME+ '</li>'
  	    	}
  	    	html += '</ul></div></div>'
  	    })
  	     $recruitlist.innerHTML = html;
  	    
				$bookMarkUp   = document.querySelectorAll(".mark-up");
				$bookMarkUp.forEach((item)=>{
					item.src = "/images/icon/mark-up.png"
				})
				
				$bookMarkDown   = document.querySelectorAll(".mark-down");
				$bookMarkDown.forEach((item)=>{
					item.src = "/images/icon/mark-off.png"
				})
		  	    
  	    
  	    return result;
  	}
      
      if("${search}"){
	      filterRecruitAjax(regionIdx,dutyIdx,skillList,filter,search);  	  
      }else{
	      filterRecruitAjax(regionIdx,dutyIdx,skillList,filter);  	      	  
      }
      
      document.addEventListener("change",(e)=>{
    	  if (e.target.matches("select[name='region']")) {
    		  regionIdx = e.target.value;
    	  }
    	  if (e.target.matches("select[name='duty']")) {
    		  dutyIdx = e.target.value;
    	  }
    	  if (e.target.matches("input[name='filter']")){
    		  filter = e.target.value;
    	  }
    	  
    	  filterRecruitAjax(regionIdx,dutyIdx,skillList,filter,search);
      })
		    
			document.addEventListener("keyup", (e) => {
				if (e.target.matches("input[name='search']") && e.keyCode == 13 && e.target.value != "") {
					displayRecent();
					$searchDiv.classList.add("recent")
					filterRecruitAjax(regionIdx,dutyIdx,skillList,filter,search);  	
				}else if(e.target.matches("input[name='search']") && e.keyCode == 13){
					search = "";
					filterRecruitAjax(regionIdx,dutyIdx,skillList,filter); 
				}
			})
		
	</script>
</body>
</html>

