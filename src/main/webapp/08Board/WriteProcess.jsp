<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "./IsLoggedIn.jsp"%> <!-- 로그인 여부 확인 -->
<%
	String title = request.getParameter("title");
	String contents = request.getParameter("content"); // Write.jsp에서 넘어온 값
	
	BoardDTO boardDTO = new BoardDTO();
	boardDTO.setTitle(title);
	boardDTO.setContents(contents);
	boardDTO.setId(session.getAttribute("UserId").toString());//세션영역에 있는 값은 객체임
	System.out.print(session.getAttribute("UserId").toString());
	//객체에 제목, 내용, 작성자가 보관
	
	BoardDAO boardDAO = new BoardDAO(application);//1,2 단계
	int result = boardDAO.insertWrite(boardDTO);//3,4 단계
	/* int result = 0;
	  for(int i=1 ; i<100 ;i++){
		boardDTO.setTitle(title+"-"+i);
		boardDTO.setContents(contents+"-"+i);
		result = boardDAO.insertWrite(boardDTO);
	} */
		
	boardDAO.close();//5 단계
	if(result==1){
		// insert 결과값이 1이면 성공
		response.sendRedirect("List.jsp"); //성공시 리스트로 감
	} else {
		// insert 결과값이 1이 아니면 실패
		JSFunction.alertBack("글저장실패 뒤로 갑니다", out);
	}
%>