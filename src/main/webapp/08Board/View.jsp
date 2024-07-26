<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num"); // 제목을 클릭햇을 때 넘어오는 번호
BoardDAO viewDAO = new BoardDAO(application); //1단계, 2단계
viewDAO.updateVisitCount(num); // 조회수 증가 3,4 단계
BoardDTO boardDTO = viewDAO.selectView(num); // 번호를 이용하여 객체가 넘어옴    
viewDAO.close(); // 5단계
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View.jsp : 제목 클릭시 상세 보기 페이지</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"></jsp:include><!--메뉴출력용 -->
	<h2>회원제 게시판 - 상세보기 페이지</h2>
	<script>
		/* 삭제판단 */
		function deletePost(){/* 하단에 삭제 버튼 클릭시 동작 */
			var confirmed = confirm("정말로 삭제하시겠습니까?"); // yes=true, no=false
			//document.write(confirmed);
			if(confirmed){ // confirm 창에서 true
				var form = document.writeFrm;/* 아래쪽에 form 객체를 변수에 넣음 */
				form.method = "post";
				form.action = "DeleteProcess.jsp";       
				form.submit();
			}
		}
	</script>

	<form name="writeFrm">
		<input type="hidden" name="num" value=<%= num %> />
		<table border=1 width="80%">
			<tr>
			 <td>번호</td> <td><%=boardDTO.getNum()%></td>
			 <td>작성자</td> <td><%=boardDTO.getName()%></td>
			</tr>
			
			<tr>
			 <td>작성일</td> <td><%=boardDTO.getPostdate()%></td>
			 <td>조회수</td> <td><%=boardDTO.getVisitcount()%></td>
			</tr>
			 
			<tr>
			<td>제목</td> <td colspan='3'><%=boardDTO.getTitle()%></td>
			</tr>
			
			<tr>
			<td>내용</td> <td colspan='3' height="100"><%=boardDTO.getContents().replace("\r\n", "<br>")%></td> <!-- 엔터처리 -->
			</tr>
			
			<tr>
			<td colspan="4" align="center"><!-- 수정, 삭제, 리스트 버튼 -->
			<%
			if(session.getAttribute("UserId") != null
				&& session.getAttribute("UserId").toString().equals(boardDTO.getId())){
			%>
			<button type ="button" onclick="location.href='Edit.jsp?num=<%=boardDTO.getNum()%>';">수정</button>
			<button type ="button" onclick="deletePost();">삭제</button>
			<%}%>
			<button type ="button" onclick="location.href='List.jsp';">목록</button>
			 </td>
			 </tr>
			
		</table>
	</form>

</body>
</html>