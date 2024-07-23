<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!--지시어 : jsp 시그니쳐 필수-->
<%!/*! 선언부 : 변수 선언, 메서드 선언  */
String str1 = "JSP";
String str2 = "안녕하세요!";//필드처럼 변수선언
%>
<!DOCTYPE html><!--html5f로 시작하겠다.-->
<html><!--html 문서 시작-->
<head><!--head start(문서의 각종 설정 정보)-->
<meta charset="UTF-8"><!--문서의 메타 정보-->
<title>Hello JSP</title><!--browser title-->
</head><!--head end-->
<body><!--body(본문) : 브라우저의 안쪽 페이지 start-->
	<h2>처음 만들어 보는 <%= str1 %></h2><!--= 표현식 : 변수내용 출력(계산X) / h 태그는 제목태그로 글자크기가 1(max)~6까지 있다.  -->
	<p><!--문단 태크 println  -->
		<%/*스크립틀릿 : 원시적인 java 코드  */
		out.println(str2 + str1+ "입니다. 지금부터 시작 합시다.");
		%>
	</p>
</body><!--body end-->
</html><!--html 문서 끝-->