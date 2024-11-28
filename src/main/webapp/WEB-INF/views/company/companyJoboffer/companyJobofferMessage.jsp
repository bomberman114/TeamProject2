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
	<%@include file="/WEB-INF/includes/headerCompanyUser.jsp"%>
	   <main class="write-form apply-form message-form">
	     <div class="inner">
	       <div class="display">
	         <div class="display-inner">
	           <div class="room-inner">
	             <h3><img src="/images/icon/message.png" alt="메시지" />메시지</h3>
	             <div class="audience-list">
	             <c:forEach var="jobOfferRoomCompanyUserList" items="${jobOfferRoomCompanyUserList}">
	               <div class="audience-item">
	                 <div class="audience-img"><img alt="" src="<c:url value='${jobOfferRoomCompanyUserList.USER_SFILE_NAME}'/>"> </div>
	                 <div class="audience-info">
	                   <div>
	                     <h4>상대 유저이름</h4>
	                     <p>${ jobOfferRoomCompanyUserList.MESSAGE_CONTENT	}</p>
	                     <c:if test="${ jobOfferRoomCompanyUserList.MESSAGE_CONTENT_JOB_OFFERS_REGDATE ne null }">
	                     <span>마지막 채탱시간 : ${ jobOfferRoomCompanyUserList.MESSAGE_CONTENT_JOB_OFFERS_REGDATE }</span>
	                     </c:if>
	                   </div>
	                   <img src="/images/icon/room-close.png" alt="" />
	                 </div>
	               </div>
	             
	             </c:forEach>
	             </div>
	           </div>
	           <div class="message-inner">
	           <form action="/Joboffer/JobOfferCompanyUserMessages" method="post">
	            <input type="hidden" name="joboffer_room_idx" value="${jobofferRoomIdx}">
	             <input
	             	name = "message_content"
	               class="messageInput"
	               type="text"
	               placeholder="메시지 보내기" />
	              
	            
	           
	           </form>
	             <h5>상대 유저이름</h5>
	             <div class="message-list">
	             <c:forEach var="jobOfferMessageList"  items="${jobOfferMessageList}">
	             <div class="message">
	                     <div class="user-img"><img alt="" src="<c:url value='${jobOfferMessageList.COMPANY_SFILE_NAME}'/>"></div>
	                     <div>
	                       <h5>나<span>${jobOfferMessageList.MESSAGE_CONTENT_JOB_OFFERS_REGDATE}</span></h5>
	                       <p class="my-message">
	                         ${jobOfferMessageList.MESSAGE_CONTENT}
	                       </p>
	                     </div>
	                   </div>
	             </c:forEach>
	             </div>
	           </div>
	         </div>
	       </div>
	     </div>
	   </main>
	   <script>
	     const $messageRoom = document.querySelector(".audience-list");
	
	     document.addEventListener("click", function (e) {
	       const $messageRoomList = document.querySelectorAll(".audience-item");
	       if ($messageRoomList && e.target.closest(".audience-item")) {
	         $messageRoomList.forEach((item) => {
	           item.classList.remove("room-active");
	         });
	         e.target.closest(".audience-item").classList.add("room-active");
	       }
	     });
	
	     let template = `<div class="audience-item">
	                 <div class="audience-img"></div>
	                 <div class="audience-info">
	                   <div>
	                     <h4>상대 유저이름</h4>
	                     <p>최신 대화내용asdadaasdaasdsdasdasd</p>
	                   </div>
	                   <img src="/images/icon/room-close.png" alt="" />
	                 </div>
	               </div>`;
	     let div = "";
	     /*
	     for (let i = 0; i < 10; i++) {
	       div += template;
	     }
	     $messageRoom.innerHTML = div;
	     */
	
	
	     const $messageList = document.querySelector(".message-list");
	
	     let template2 = `                <div class="message">
	                     <div class="user-img"></div>
	                     <div>
	                       <h5>나<span>2024.11.27 오전 9:42</span</h5>
	                       <p class="my-message">
	                         대화내용뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁
	                       </p>
	                     </div>
	                   </div>`;
	     let template2copy = template2
	     let div2 = "";
	     /*
	     for (let i = 0; i < 50; i++) {
	       if(i % 2 == 0){
	         template2 = `                <div class="message">
	                     <div class="user-img"></div>
	                     <div>
	                       <h5>상대<span>2024.11.27 오전 9:42</span</h5>
	                       <p>
	                         대화내용뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁뮁
	                       </p>
	                     </div>
	                   </div>`;
	       }else{
	         template2=template2copy
	       }
	       div2 += template2;
	     }
	     $messageList.innerHTML = div2;
	     */
	   </script>
  </body>
</html>
