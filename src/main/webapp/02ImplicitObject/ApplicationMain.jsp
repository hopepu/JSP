<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationMain.jsp : web.xml 값 가져오기</title></head><body>
	<h2> web.xml 값 출력</h2>
	<%= application.getInitParameter("INIT_PARAM")%>
	
	<h2> 토도도도도톰켓이 사용하는 경로 알아보기 </h2>
	<%= application.getRealPath("/02ImplictObject") %>
	<!-- D:\jsp_workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\board-jsp\02ImplictObject -->
</body>
</html>