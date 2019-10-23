<%@page import="com.DBManage.LiptonDB"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("userid1") == null) {
		response.sendRedirect("Main.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");
	LiptonDB userdata = new LiptonDB("userdata");
	ArrayList<DBObject> userInfo = userdata.find(String.format("{$or : [{userid1 : '%s'}, {userid2 : '%s'}]}",
			(String)session.getAttribute("userid1"), (String)session.getAttribute("userid2")),
			"{name : true, userid1 : true, userid2 : true, gender : true}");
	
	StringTokenizer st = new StringTokenizer(userInfo.get(0).get("name").toString(), " ");
	String lastname = st.nextToken();
	String firstname = st.nextToken();
	String userid1 = userInfo.get(0).get("userid1").toString();
	String userid2 = null;
	String folderName = (String)session.getAttribute("useridx");
	folderName = folderName.split("\\'")[1];
	try {
		userid2 = userInfo.get(0).get("userid2").toString();
	} catch (NullPointerException e) {
		userid2 = "";
	}
	String gender = userInfo.get(0).get("gender").toString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정</title>
<script src="./js/Modify.js"></script>
<script src="./js/v.js"></script>
<link href="./CSS/style1.css" rel="stylesheet" type="text/css">
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
	<div id="modifydiv">
		<div>
			<h1>정보 수정</h1>
			<form name="modForm" method="post" action="Modify_ok.jsp" enctype="Multipart/form-data">
				<p>
					<label id="imgLabel">
						<input type="file" id="file" accept=".jpg,.jpeg,.png,.gif,.bmp" name="fileName1" onchange="fileCheck(this)">
					</label>
					<script>
						document.getElementById("imgLabel").setAttribute("style"
								,"background-image:url('./upload/<%=folderName%>/profileImg.png')")
					</script>
				</p>
				<div class="inputdiv">
					<input type="text" name="lastname" placeholder="성(姓)" class="modinput1" value="<%=lastname%>">
					<input type="text" name="firstname" placeholder="이름(성은 제외)" class="modinput1" value="<%=firstname%>">
				</div>
				<div class="inputdiv"><input type="text" name="userid1" class="modinput2" style="background-color:lightgray" value="<%=userid1%>" readonly></div>
<%
				if (userid2.equals("")) {
%>
					<div class="inputdiv"><input type="text" name="userid2" placeholder="휴대폰 번호 또는 이메일 2" class="modinput2" value="<%=userid2%>"></div>
<%
				} else {
%>
					<div class="inputdiv"><input type="text" name="userid2" placeholder="휴대폰 번호 또는 이메일 2" class="modinput2" style="background-color:lightgray" value="<%=userid2%>" readonly></div>
<%
				}
%>
				<div class="inputdiv"><input type="password" name="pw0" placeholder="기존 비밀번호" class="modinput2"></div>
				<div class="inputdiv"><input type="password" name="pw1" placeholder="새 비밀번호" class="modinput2"></div>
				<div class="inputdiv"><input type="password" name="pw2" placeholder="새 비밀번호 확인" class="modinput2"></div>
				<div class="inputdiv">
<%
				if (gender.equals("여성")) {
%>
					<input type="radio" name="gender" value="여성" checked>여성
					<input type="radio" name="gender" value="남성">남성
<%
				} else {
%>
					<input type="radio" name="gender" value="여성">여성
					<input type="radio" name="gender" value="남성" checked>남성
<%
				}
%>
				</div>
				<input type="button" value="수정하기" onclick="sendit()" style="width:200px;height:40px;">
			</form>
		</div>
	</div>
</form>
</body>
</html>



