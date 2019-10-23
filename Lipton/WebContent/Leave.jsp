<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("userid1") == null) {
		response.sendRedirect("Main.jsp");
	}
%>
<%
	String userid = (String)session.getAttribute("userid1");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<link href="./CSS/style1.css" rel="stylesheet" type="text/css">
<script src="./js/Leave.js"></script>
<script src="./js/v.js"></script>
</head>
<body>
	<header>
		<a href="Main.jsp" id="logo">Lipton</a>
		<div style="float:right;margin:5px 10px 0 0">
			<p style="margin:0 0 10px 0;text-align:right"><button id="v" onclick="v()"><%=(String)session.getAttribute("name")%></button></p>
			<div style="display:none" id="infodiv">
				<a href="Logout.jsp">[로그아웃]</a> |
				<a href="Modify.jsp">[회원정보 수정]</a> |
				<a href="Leave.jsp">[회원 탈퇴]</a>
			</div>
		</div>
	</header>
	<div id="registdiv">
		<div>
			<h1>탈퇴</h1>
			<form name="leaveForm" method="post" action="Leave_ok.jsp">
				<div class="inputdiv"><input type="text" name="userid" style="background-color:lightgray" placeholder="휴대폰 번호 또는 이메일" class="registinput2" value="<%=userid%>" readonly></div>
				<div class="inputdiv"><input type="password" name="pw" placeholder="비밀번호" class="registinput2"></div>
				<input type="button" value="탈퇴하기" onclick="sendit()" style="width:200px;height:40px">
			</form>
		</div>
	</div>
</body>
</html>