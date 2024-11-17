<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
</head>
<body>
   <main>
    <h2>비밀번호 확인</h2>
	<form action="/Company/CheckPassword" method="POST">
    <input type="hidden" name="company_id" value="${param.company_id}" />
	    <table>
	        <tr>
	            <td>비밀번호</td>
	            <td><input type="password" name="inputPassword" required /></td>
	        </tr>
	        <tr>
	            <td colspan="2">
	                <input type="submit" value="확인" id="check"/>
	            </td>
	        </tr>
	    </table>
	</form>
   <script>
      // 서버에서 전달된 error 메시지가 있을 경우 alert로 출력
      <% if (request.getAttribute("error") != null) { %>
        alert("<%= request.getAttribute("error") %>");
      <% } %>
    </script>
  </main>
</body>
</html>
