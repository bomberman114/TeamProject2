<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개인회원 목록</title>
        <link rel="icon" type="image/png" href="https://github.com/bomberman114/TeamProject1/blob/develop/src/main/resources/static/img/apple-touch-icon.png" />
    <script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
    <script>
        function confirmDeletion(user_id) {
            return confirm("개인회원 " + user_id + "을(를) 정말 삭제하시겠습니까?");
        }
    </script>
</head>
<body>
    <main>  
        <h2>개인회원 목록</h2>
        <table>
            <tr>
                <td>아이디</td>
                <td>이름</td>
                <td>이메일</td>
                <td>연락처</td>
                <td>가입일</td>
                <td>삭제</td>
                <td>수정</td>
            </tr>
            <tr>
                <td colspan="7">
                    [<a href="/Users/RegisterForm">개인회원 등록</a>]	      
                </td>
            </tr>
            
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.user_id}</td>
                    <td>${user.user_name}</td>
                    <td>${user.user_email}</td>
                    <td>${user.user_phone}</td>
                    <td>${user.user_regdate}</td>
                    <td>
                        <a href="/Users/Delete?user_id=${user.user_id}" 
                           onclick="return confirmDeletion('${user.user_id}');">삭제</a>
                    </td>
                    <td><a href="/Users/CheckPassword?user_id=${user.user_id}">수정</a></td>
                </tr> 
            </c:forEach>	    
        </table>
    </main>
</body>
</html>
