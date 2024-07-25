<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String popupMode = "on"; //쿠키 제어용
	Cookie[] cookies = request.getCookies();//쿠키의 모든 정보를 배열로
	if(cookies != null){
		for(Cookie c : cookies){ // 쿠키 배열에서 한개씩 가져와 
			String name = c.getName(); // 배열에서 이름 가져옴
			String value = c.getValue(); //배열에서 값 가져옴
			if(name.equals("PopupClose")){
				popupMode = value; // on, off 존재
			}
		}
		 
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PopupMain_v0.1.jsp : 쿠키를 활용한 팝업제어 테스트</title>
<!-- html(문서태그), css3, javascript -->
</head>
<body>
	<style>
		div#popup{
			position:absolute; top:100px; left:50px; color:yellow;
			width:270px; height:100px; background-color: gray;
		}
		div#popup>div{
			pos ition: relative; background-color: #ffffff;
			border : 1px solid gray; padding : 10px ; color : black; 
		}
	</style><!-- css3를 적용하는 블럭 : 색, 크기, 도형 -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!-- 외부에서 제공하는 jquery라이브러리 cdn -->
<!-- jqquery : 자바스크립트를 조금더 편하게 개선한 코드 -->
	<script>
		$(function(){/* jquery의 기본 프레임 */
			$('#closeBtn').click(function(){/* id가 #closeBtn인 것을 클릭했을때 실행되는 동작 */
				$('#popup').hide();/* id가 popup인 객체를 숨김. */
					var chkval = $("input:checkbox[id=inactiveToday]:checked").val();
					/* input 태그에 checkbox타입에 id가 inactiveToday가 체크인지 값을 chkval에 삽입 */
					
					$.ajax({
						url : './PopupCookie.jsp',
						type : 'get',
						data : {inactiveToday : chkval},
						dataType : "txt",
						success : function(resData){
							if(resData != ''){
								location.reload();
							}
						}
					});
					
			});			
		});/*jquery code*/
			
	</script><!-- 자바 스크립트를 적용하는 블럭 : 동적문서 -->

	<h2>팝업 메인 페이지(v0.1)</h2>
	<%
		out.print("현재 팝업창은 " + popupMode+"상태입니다.");
		if(popupMode.equals("on")){
	%>

	<div id="popup">
		<h2 align="center"><!-- 가운데 정렬 -->
			공지사항
		</h2>
		<div align="right"><!-- 오른쪽 정렬 -->
			<form name="popFrm">
				<input type=checkbox " id="inactiveToday" value="1" /> 하루동안 열지 않음 <input
					type="button" value="닫기" id="closeBtn" />
				
			</form>

		</div>

	</div><!-- 사각형 메모지 -->
	<% }// if문 close %>
</body>
</html>