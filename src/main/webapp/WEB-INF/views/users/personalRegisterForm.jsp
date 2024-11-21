<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>잡집사</title>
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <script src="/js/inputForm.js" defer></script>
  </head>
  <body>
    <%@ include file="/WEB-INF/includes/headerLogin.jsp" %>
    <main class="login-form register-form">
      <div class="inner">
        <a class="back-btn" href="javascript:window.history.back();"><img src="/images/icon/back-btn.png" alt="뒤로가기"> 취소하고 돌아가기</a>
        <h2><span>개인회원</span> 회원가입</h2>
        <form action="/Users/Register" method="post">
          <div class="form-inner">
            <ul>
              <li>
                <p>아이디</p>
                <input type="text" name="user_id" placeholder="아이디" required="required">
                <span class="dup id-dup"></span>
              </li>
              <li>
                <div class="registe-flex dup-passwd">
                  <div>
                    <p>비밀번호</p>
                    <input type="text" name="user_passwd" placeholder="비밀번호" required="required">
                  </div>
                  <div>
                    <p>비밀번호 확인</p>
                    <input type="text" name="user_pwdup" placeholder="비밀번호" required="required"> 
                  </div>
                </div>
                 <span class="dup pw-dup"></span>
              </li>
              <li>
                <div class="registe-flex">
                  <div>
                    <p>기본 정보</p>
                    <input type="text" name="user_name" placeholder="이름" required="required">
                    <input type="text" name="user_birth" maxlength="8" placeholder="생년월일(8자리)" required="required" oninput="formatBirthNumber(this)">
                    <select name="user_gender">
                    	<option>남</option>
                    	<option>여</option>
                    </select>
                  </div>
                  <div>
                    <p>연락처 정보</p>
                    <input type="tel" name="user_phone" maxlength="13" placeholder="휴대폰" required="required" oninput="formatPhoneNumber(this)">
                    <input type="email" name="user_email" placeholder="이메일" required="required">
                  </div>
                </div>
              </li>
            </ul>
            <button class="login-btn registe-btn">가입하기</button>
          </div>
        </form>
      </div>
    </main>
    <script>
    const $idInput = document.querySelector("input[name='user_id']")
    const $pawdInput = document.querySelector("input[name='user_passwd']")
    const $pawdupInput = document.querySelector("input[name='user_pwdup']")
    const $idDup   = document.querySelector(".id-dup")
    const $pwDup   = document.querySelector(".pw-dup")
    let idDuplicate = false;
    let isPassMatch = false;
	    $idInput.addEventListener("blur",(e)=>{
	    	if(e.target.value != ""){
		      isIdDupCheck(e.target.value)    		
	    	}
	    })
	    
	  const $passInputs = document.querySelectorAll(".dup-passwd input")
	  console.log($passInputs)
	  
	  $passInputs.forEach((input)=>{
		  input.addEventListener("input",(e)=>{
	    	if($pawdInput.value == $pawdupInput.value && $pawdInput.value != "" && $pawdupInput.value != "" ){
	    		$pwDup.style.color = "green"
		    	$pwDup.innerHTML   = " ※ 비밀번호가 일치합니다."
		    	isPassMatch        = false;
	    	}else if($pawdInput.value != $pawdupInput.value && $pawdInput.value != "" && $pawdupInput.value != "" ){
	    		$pwDup.style.color = "red"
			    $pwDup.innerHTML   = " ※ 비밀번호가 일치하지 않습니다." 
			    isPassMatch        = true;
	    	}
	    })
	  })
	  
	  const $form = document.querySelector("form")
	  
	  $form.addEventListener("submit",(e)=>{
		  if(idDuplicate){
			  e.preventDefault()
			  alert("중복된 아이디가 존재합니다.")
		  }
		  if(isPassMatch){
			  e.preventDefault()
			  alert("비밀번호가 일치하지 않습니다.")
		  }
	  })
	  
	    async function isIdDupCheck(userId){
	      try{
	        const res = await fetch("/Users/IdDupCheck",{
	          method : "POST",
	          headers : {
	           "Content-Type": "application/json",
	          },
	          body : JSON.stringify({userId : userId})
	        })
	        if(!res.ok){
	          throw new Error(`HTTP error status : ${res.status}`)
	        }
	        const result = await res.json();
	        if(result.isDuplicate){
	        		$idDup.style.color = "red"
	    	      $idDup.innerHTML   = "※ 중복된 아이디가 존재합니다."
	    	    	  idDuplicate      = true
	        }else{
	        	$idDup.style.color   = "green"
	        	$idDup.innerHTML     = "※ 사용가능한 아이디입니다."
	        	idDuplicate          = false
	        }
	      }catch(err){
	        console.log("Error Ajax",err)
	      }
	    }
    

	    
	    
	    
    </script>
  </body>
</html>
