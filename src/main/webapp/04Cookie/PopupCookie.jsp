<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PopupCookie.jsp : get으로 받은 결과로 쿠키 생성</title>
</head>
<body>
	<!-- $.ajax({
						url : './PopupCookie.jsp',
						type : get,
						data : {inactiveToday : chkval}
						dataType : "text",
						success : function(resData){
							if(resData != ''){
								location.reload();
							}
						}
					}); -->
	<%
	String chkVal = request.getParameter("inactiveToday");
	System.out.println(chkVal);
	
	if(chkVal!=null&&chkVal.equals("1")){
		Cookie cookie = new Cookie("PopupClose", "off"); // 쿠키 생성(이름, 값);
		cookie.setPath(request.getContextPath());
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		System.out.println("쿠키생성완료");
	}
	
	%>

</body>
</html>