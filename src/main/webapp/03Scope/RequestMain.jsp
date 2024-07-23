<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setAttribute("reqStr", "문지현");
request.setAttribute("reqPerson", new Person("조용재", 35));
//request 영역에 속성값 생성
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestMain.jsp : Request영역은 요청을 처리하는 동안 값이 유지</title>
</head>
<body>
	<h2>request 영역값 가져오기</h2>
	<%
	request.removeAttribute("reqStr"); // 문지현 지우기 -> 지워짐
	request.removeAttribute("reqInt"); // 정수 지우기 -> 값이 없었다!!!!! -> 에러 안뜸
	//removeAttribute는 값이 없어도 오류가 안뜸
	%>
	<hr>
	<h2>request 영역값 출력해보기</h2>
	<%
	String requestStr = (String) request.getAttribute("reqStr");
	Person requestPerson = (Person) request.getAttribute("reqPerson");
	%>
	<ul>
		<Li>String 객체 : <%=requestStr%></Li>
		<Li>Person 객체 : <%=requestPerson.getName()%>, <%=requestPerson.getAge()%></Li>
	</ul>
	
	<h2>포워드된 페이지에서 request 영역 속성값 읽기</h2>
	<%//.getRequestDispatcher는 바로 url로 넘긴다
	request.getRequestDispatcher("./RequestForward.jsp?han=한글&eng=English").forward(request, response);
	%>
</body>
</html>