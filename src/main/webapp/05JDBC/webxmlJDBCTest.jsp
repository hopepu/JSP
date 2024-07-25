<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webxmlJDBCTest.jsp : application영역을 활용한 접속 테스트용</title>
</head>
<body>
	<h2>JDBC 연결 테스트(application + jsp</h2>
	<%	/* 매번 페이지마다 필수 코드가 존재하게 된다. */
		String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("Oracle_id");
		String pwd = application.getInitParameter("Oracle_pwd");
		
		JDBConnect jdbConnect = new JDBConnect(driver, url, id, pwd);
		// 1단계, 2단계 완성
		// 3단계 (쿼리문 생성)
		// 4단계 (쿼리문 실행)
		// 5단계 (닫기)
		jdbConnect.close();
	%>
	
</body>
</html>