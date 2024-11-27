<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  </head>
  <body>
  	<%@include file="/WEB-INF/includes/headerUser.jsp" %>
  	   <main class="write-form apply-form">
      <div class="inner">
        <aside>
          <ul class="aside-inner">
            <li>
              <h3>지원내역</h3>
              <a class="applyall-btn" href="/Users/MyPage/Apply/List">전체 지원내역</a>
            </li>
            <li>
              <img src="/images/icon/resume-dropdown.png" alt="" />등록한 이력서
            </li>
            <li class="apply-resume-list">
            	<c:forEach var="resume" items="${resumeList}">
	              <p data-resumeidx="${resume.USER_RESUME_IDX}">${resume.USER_TITLE}</p>            	
            	</c:forEach>
            </li>
          </ul>
        </aside>
        <div class="resume-container apply-container">
          <div class="resume-conten apply-content">
            <div class="apply-status">
              <ul>
                <li data-applystatus="5"></li>
                <li data-applystatus="6"></li>
                <li data-applystatus="7"></li>
                <li data-applystatus="8"></li>
              </ul>
            </div>
            <div class="apply-list">
              <table>
                <colgroup>
                  <col width="25%" />
                  <col width="55%" />
                  <col width="20%" />
                </colgroup>
                <thead>
                  <tr>
                    <td>지원정보</td>
                    <td colspan="2">지원공고</td>
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </main>
    <script>
	  const $tbody       = document.querySelector("tbody");
	  const $applyStatus = document.querySelector(".apply-status ul");
		const $applyList   = document.querySelectorAll(".apply-status ul li");
    const $resumeList  = document.querySelectorAll(".apply-resume-list p");

    let nowStatus      = "";
    let selectedResume = "";
	  let applyStatus    = "";
    
		async function getUserApplyList(userIdx, applyStatus = "",selectedResume="") {
	    const res = await fetch("/Users/GetApplyList", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/json",
	        },
	        body: JSON.stringify({ userIdx : userIdx, applyStatus : applyStatus, selectedResume : selectedResume})
	    });
	
	    if (!res.ok) {
	        throw new Error(`HTTP error status: ${res.status}`);
	    }
	
	    const result = await res.json();
	    
	    let tr = "";
	    result.userApplyList.forEach((a,i)=>{
	    	    tr += "<tr><td class='apply-date'>" + a.APPLYDATE + "지원</td>"
	    	    tr += "<td class='apply-recruit'><a href='/Common/RecruitOneView?company_recruit_idx="+a.COMPANY_RECRUIT_IDX+"' target='blank'>"+ a.RECRUIT_TITLE+"</a></td>"
	    	    tr += "<td><span class='apply-cancle-btn' data-user_resume_idx=" + a.USER_RESUME_IDX+ "  data-company_recruit_idx="+a.COMPANY_RECRUIT_IDX+">지원취소</span></td></tr>"
	    })
	    $tbody.innerHTML = tr;
	    let statusNames = ["지원완료","서류통과","최종합격","불합격"]
	    let statusList = [result.userApplyCountList.SUBMITTED,result.userApplyCountList.PAPER_PASSED,result.userApplyCountList.PASS,result.userApplyCountList.FAIL]
	    for(let i = 0; i < 4; i++){
	    	$applyList[i].innerHTML = statusNames[i] + "("+statusList[i]+")"
	    }
	    return result;
	}
		const userIdx = "${sessionScope.userLogin.user_idx}"
		
		const initialResult = getUserApplyList(userIdx);
	
		$applyList[0].classList.add("apply-active");
		
		$applyList.forEach((item,index)=>{
			item.addEventListener("click",()=>{
				$applyList.forEach(li=>{
					li.classList.remove("apply-active")
				})
				$applyList[index].classList.add("apply-active");
				nowStatus = document.querySelector(".apply-active").dataset.applystatus
				getUserApplyList(userIdx, nowStatus, selectedResume)
			})
		})
		
		$resumeList.forEach((item,index)=>{
			item.addEventListener("click",(e)=>{
				$resumeList.forEach(p=>{
					p.classList.remove("selected")
				})
				$resumeList[index].classList.add("selected");
				nowStatus  = document.querySelector(".apply-active").dataset.applystatus
				selectedResume = e.target.dataset.resumeidx
				getUserApplyList(userIdx, nowStatus, selectedResume)
			})
		})
    
		document.addEventListener("click", function(e) {
	  if (e.target.matches(".apply-cancle-btn")) {
		  const resumeIdx  = e.target.dataset.user_resume_idx;
			const recruitIdx = e.target.dataset.company_recruit_idx;
			deleteUserApplyAjax(resumeIdx,recruitIdx).then(()=>{
			getUserApplyList(userIdx, applyStatus, selectedResume)				
			})
	  }
	 });
				
	  async function deleteUserApplyAjax(resumeIdx,recruitIdx) {
		    const res = await fetch("/Users/ApplyCancle", {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/json",
		        },
		        body: JSON.stringify({ resumeIdx : resumeIdx, recruitIdx : recruitIdx})
		    });
		
		    if (!res.ok) {
		        throw new Error(`HTTP error status: ${res.status}`);
		    }
		
		    const result = await res.json();
		    alert(result.result)
		}
    </script>
  </body>
</html>

