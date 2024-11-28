<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
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
	   <main class="write-form apply-form message-form">
	     <div class="inner">
	       <div class="display">
	         <div class="display-inner">
	           <div class="room-inner">
	             <h3><img src="/images/icon/message.png" alt="메시지" />메시지</h3>
	             <div class="audience-list">
	             <c:forEach var="jobOfferRoomUserList" items="${jobOfferRoomUserList}">
	               <div class="audience-item">
	                 <div class="audience-img"><img alt="" src="<c:url value='${jobOfferRoomUserList.COMPANY_SFILE_NAME}'/>"> </div>
	                 <div class="audience-info">
	                   <div>
	                   	<a href="/Joboffer/JobOfferRoomOneView?joboffer_room_idx=${jobOfferRoomUserList.JOBOFFER_ROOM_IDX } ">
	                     <h4>${jobOfferRoomUserList.COMPANY_USER_NAME }</h4>
	                     <p>${ jobOfferRoomUserList.MESSAGE_CONTENT	}</p>
	                     <c:if test="${ jobOfferRoomUserList.MESSAGE_CONTENT_JOB_OFFERS_REGDATE ne null }">
	                     <span>마지막 채탱시간 : ${ jobOfferRoomUserList.MESSAGE_CONTENT_JOB_OFFERS_REGDATE }</span>
	                     </c:if>
	                   	</a>
	                   </div>
	                   <img src="/images/icon/room-close.png" alt="" />
	                 </div>
	               </div>
	             </c:forEach>
	             </div>
	           </div>
	           <div class="message-inner">
	           <form action="/Joboffer/JobOfferUserMessages" method="post">
	            <input type="hidden" name="joboffer_room_idx" value="${jobofferRoomIdx}">
	             <input
	             	name = "message_content"
	               class="messageInput"
	               type="text"
	               placeholder="메시지 보내기" />
	           </form>
	             <h5 class="audience">대화내용</h5>
	             <div class="message-list">
	             <c:forEach var="jobOfferMessageList"  items="${jobOfferMessageList}">
		             <div class="message">
		             	<c:if test="${jobOfferMessageList.COMPANY_USER_IDX ne null}">
		                     <div class="user-img"><img alt="" src="<c:url value='${jobOfferMessageList.COMPANY_SFILE_NAME}'/>"></div>
		                     <div>
		                       <h5>${jobOfferMessageList.COMPANY_USER_NAME}<span>${jobOfferMessageList.MESSAGE_CONTENT_JOB_OFFERS_REGDATE}</span></h5>
		                       <p>
		                         ${jobOfferMessageList.MESSAGE_CONTENT}
		                       </p>
		                     </div>
		            	 </c:if>
		             	<c:if test="${jobOfferMessageList.USER_IDX ne null}">
		                     <div class="user-img"><img alt="" src="<c:url value='${jobOfferMessageList.USER_SFILE_NAME}'/>"></div>
		                     <div>
		                       <h5>${jobOfferMessageList.USER_NAME}<span>${jobOfferMessageList.MESSAGE_CONTENT_JOB_OFFERS_REGDATE}</span></h5>
		                       <p class="my-message">
		                         ${jobOfferMessageList.MESSAGE_CONTENT}
		                       </p>
		                     </div>
		            	 </c:if>
									</div>
	             </c:forEach>
	             </div>
	           </div>
	         </div>
	       </div>
	     </div>
	   </main>
	   <script>

	      document.addEventListener("click", function (e) {
          const $messageRoomList = document.querySelectorAll(".audience-item");
          if ($messageRoomList && e.target.closest(".audience-item")) {
            $messageRoomList.forEach((item) => {
              item.classList.remove("room-active");
            });
            e.target.closest(".audience-item").classList.add("room-active");
          }
        });
	       
	     let cachedData = null;

	     async function fetchDataAndUpdate() {
	        try{
	        	 const res = await fetch("/Joboffer/GetJobOfferUserMessages",{
			          method : "POST",
			          headers : {
			           "Content-Type": "application/json",
			          },
			          body : JSON.stringify({joboffer_room_idx : '${jobofferRoomIdx}'})
			        })
	        	  if(!res.ok){
			          throw new Error(`HTTP error status : ${res.status}`)
			        }
			        const result   = await res.json();
			        const newData = result.jobOfferMessageList;
			        console.log(newData)
			        if (JSON.stringify(newData) !== JSON.stringify(cachedData)) {
			             cachedData = newData;
			             updateUI(newData);
			           }
			        
	        }catch(err){
	        	console.log("Error Ajax",err)
	        }finally{
	        	setTimeout(fetchDataAndUpdate, 1000);
	        }
	      }
	        
	     function updateUI(data) {
	       // UI 업데이트 로직
	       let html = "";
	       data.forEach((message)=>{
	    	   html += '<div class="message">'
	    	   if(message.USER_IDX != null){
		    	   html += '<div class="user-img"><img src="'+ message.USER_SFILE_NAME +'"></div>'
		    	   html += '<div><h5>'+ message.USER_NAME +'<span>'+message.MESSAGE_CONTENT_JOB_OFFERS_REGDATE+'</span></h5>'
	    		   html += '<p class="my-message">'+message.MESSAGE_CONTENT+'</p></div>'
	    	   }else if(message.COMPANY_USER_IDX != null){
	    		   html += '<div class="user-img"><img src="'+ message.COMPANY_SFILE_NAME +'"></div>'
		    	   html += '<div><h5>' + message.COMPANY_USER_NAME + '<span>'+message.MESSAGE_CONTENT_JOB_OFFERS_REGDATE+'</span></h5>'
	    		   html += '<p>'+message.MESSAGE_CONTENT+'</p></div>'
	    	   }
		    	   html += '</div>'
	       })
	       const $messageList = document.querySelector(".message-list")
	       $messageList.innerHTML = html;
		    
	     }
	         
	     // 폴링 시작
	     fetchDataAndUpdate();

	   </script>
  </body>
</html>
