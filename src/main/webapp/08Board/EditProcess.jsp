<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file='./IsLoggedIn.jsp' %> <!-- 로그인상태 확인 -->
<%
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDTO boardDTO = new BoardDTO();
boardDTO.setNum(num);
boardDTO.setTitle(title);
boardDTO.setContents(content);

BoardDAO boardDAO = new BoardDAO(application); //1,2단계
int affected = boardDAO.updateEdit(boardDTO); // 3,4단계
boardDAO.close();

//성공/실패 처리
if(affected == 1){
	//수정
	response.sendRedirect("View.jsp?num="+boardDTO.getNum()); // View.jsp?num=3
} else {
	//실패
	JSFunction.alertBack("수정실패", out);
}

%>