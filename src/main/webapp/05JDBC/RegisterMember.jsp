<%@page import="DAO.MemberDAO"%>
<%@page import="DTO.MemberDTO"%>
<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RegisterMember.jsp : 로그인 페이지에서 받은 정보를 DTO에 넣어 DAO로 전송</title>
</head>
<body>
 	<%
		DBConnPool pool = new DBConnPool(); // 1단계 2단계
		MemberDTO regiDTO = new MemberDTO(request.getParameter("user_id"), request.getParameter("user_pw"), request.getParameter("user_name"));
		MemberDAO regiDAO = new MemberDAO();
		regiDAO.memberInsert(regiDTO, pool.con);		
		pool.close();
	%>

</body>
</html>