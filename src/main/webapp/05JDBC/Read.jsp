<%@page import="model1.DAO.MemberDAO"%>
<%@page import="model1.DTO.MemberDTO"%>
<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Read.jsp :</title>
</head>
<body>
 	<%
		DBConnPool pool = new DBConnPool(); // 1단계 2단계
		MemberDAO readDAO = new MemberDAO();
		readDAO.memberRead(pool.con);
		
		pool.close();
	%>

</body>
</html>