<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ExeUpdate.jsp : 회원 추가 테스트 (executeUpdaet()사용)</title>
</head>
<body>
	
	<form action="RegisterMember.jsp" method="post">
		아 이 디 : <input type = "text" name = "user_id" />
		<br>
		패스워드 : <input type = "password" name = "user_pw"/>
		<br>
		이    름 : <input type = "text" name = "user_name"/>
		<input type="submit" value = "회원가입" />	
	
	</form>

</body>
</html>