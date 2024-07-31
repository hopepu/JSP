<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="common.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!-- jstl core tag use -->
<!-- Core tag : 변수 선언, 조건문, 반복문, url 처리용 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- jstl formatting tag -->
<!-- formatting : 숫자, 날짜, 시간 포멧 지정(다국어) -->
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %><!-- jstl xml tag -->
<!-- xml : 확장자가 xml인 데이터 파싱 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><!-- jstl function tag -->
<!-- function : 컬렉션, 문자열 처리 -> EL에서 사용 가능한 method 제공-->
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %><!-- jstl sql tag -->
<!-- sql : 데이터베이스 연결 및 쿼리 실행 -> JDBC api를 사용하기 때문에 활용성이 없음.-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Set1.jsp : jstl test</title>
</head>
<body>
	<!-- 변수 선언 -->
	<c:set var="directVar" value="100"/>
	<c:set var="elVar" value="${directVar mod 5}" /> <%-- ${el표기법} / mod는 뒤의 값으로 나누었을때 나머지 --%>
	<c:set var="expVar" value="<%= new Date() %>"/> <%-- jsp 표현식과 내장된 객체 출력  --%>
	<c:set var="betweenVar">변수값 이렇게도 설정 가능</c:set><%-- tag 안쪽 글짜가 value로 입력됨. --%>
	
	<!-- 변수출력 -->
	<h4> EL을 이용한 출력 테스트</h4>
		<ul>
			<li>directVar : ${ pageScope.directVar } </li>
			<li>elVar : ${ elVar }</li>
			<li>expVar : ${ expVar }</li>
			<li>betweenVar : ${ betweenVar }</li>
		</ul>
		
		<!-- 객체 처리 테스트 : 생성 -->
		<h4> 자바빈즈생성 - 생성자(Person)</h4>
		<c:set var="personVal1" value='<%= new Person("엠비씨", 12) %>' scope="request"/>
		
		
		<h5> 자바 빈즈 출력 - EL </h5>
		<ul>
			<li>이름 : ${requestScope.personVal1.name }</li>
			<li>나이 : ${requestScope.personVal1.age }</li>
		</ul>
		
		
		<h4> 자바 빈즈 생성 - target, property 사용 " 큰 따옴표"</h4>
		<c:set var="personVal2" value="<%= new Person()  %>" scope="request" />
		<c:set target="${ personVal2 }" property="name" value="김기원" />
		<c:set target="${ personVal2 }" property="age" value="44" />
		
		<h5> 자바 빈즈 target 출력 - EL </h5>
		<ul>
			<li>이름 : ${ personVal2.name }</li>
			<li>나이 : ${ requestScope.presonVal2.age }</li>
		</ul>
		
		
		<h5> 컬렉션(List)를 사용해 생성 </h5>
		<%
			ArrayList<Person> pList = new ArrayList<>();
			pList.add(new Person("함시은", 24)); //[0]
			pList.add(new Person("이영훈", 31)); //[1]
			/* 리스트에 2개의 객체 생성 연결 */		
		%>
		
		<c:set var="personList" value="<%= pList %>" scope = "request" />
		<ul>
			<li> 이름 : ${requestScope.personList[0].name }</li>
			<li> 나이 : ${requestScope.personList[1].age }</li>
		</ul>
		
		<h5> 컬렉션(Map)을 이용해 생성 </h5>
		<%
			Map<String, Person> pMap = new HashMap<String, Person>();
			pMap.put("person1", new Person("함시은", 24));
			pMap.put("person2", new Person("이영훈", 31));
		%>
		
		<c:set var="pMap" value="<%= pMap %>" scope = "request"/>
		<ul>
			<li> 이름 : ${requestScope.pMap.person2.name = "김기원"}</li>
			<li> 나이 : ${requestScope.pMap.person1.age }</li>
		</ul>
		
		<h5> 삭제 후 출력 테스트 </h5>
		<c:remove var="personVal2" scope = "request"/>
				
		<ul>
			<li>이름 : ${ personVal2.name }</li>
			<li>나이 : ${ requestScope.presonVal2.age }</li>
		</ul>
		
		
		
		
</body>
</html>