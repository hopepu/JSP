<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestParameter.jsp : RequestMain.jsp에서 넘어온 값 처리</title>
</head>
<body>
<%//스크립틀릿 : 자바의 원시코드
	request.setCharacterEncoding("utf-8"); //post방식의 한글 처리법
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	String[] favo = request.getParameterValues("favo");
	String favoSTR = ""; //배열에 문자열을 추출
	if(favo != null){//관심사항이 빈것이 아니면
		for(int i = 0; i<favo.length; i++){
			favoSTR += favo[i] + " ";
		} //배열에 있는 문자열을 추출해서 붙여 1개로 반듬
	}
	String intro = request.getParameter("intro").replace("\r\n ", "<br>");
	//키보드의 엔터는 라인피드, 캐리지리턴이 결합된 코드 -> 브라우저에서는 <br>로 교체
%>

	<ol>
	<li> 아이디 : <%=id%></li><br>
	<li> 성별 : <%=sex%></li><br>
	<li> 관심사 : <%=favoSTR%></li><br>
	<li> 자기소개 </li><br>
	<textarea rows="4" cols="30"><%=intro%></textarea>
	</ol>

</body>
</html>