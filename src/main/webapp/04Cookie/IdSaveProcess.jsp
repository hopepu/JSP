<%@page import="utils.CookieManager"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	String save_check = request.getParameter("save_check");

		if("kkw".equals(user_id)&&"1234".equals(user_pw)){
			// id와 pw가 같으면
			if(save_check != null && save_check.equals("Y")){
				//id 저장하기가 check 이면
				CookieManager.makeCookie(response, "loginID", user_id, 86400);
				//쿠키생성
			} else {
				//id 저장하기가 check 안되면
				CookieManager.deleteCookie(response, "loginID");
			}
			JSFunction.alertLocation("로그인 성공!", "IdSaveMain.jsp", out);
		} else {
			// id와 pw가 다르면
			JSFunction.alertBack("로그인 실패 - id/pw가 다릅니다.", out);
		}
%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>IdSaveProcess.jsp : 로그인처리(성공, 실패 + 쿠키 + alert)</title></head><body>
	
</body>
</html>