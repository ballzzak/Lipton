<%@page import="com.mongodb.DBObject"%>
<%@page import="com.DBManage.LiptonDB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = (String)session.getAttribute("name");
	String idx = request.getParameter("idx");
	String useridx = request.getParameter("useridx");
	
	if (session.getAttribute("userid1") == null || !("ObjectId('" + useridx + "')").equals((String)session.getAttribute("useridx"))) {
		response.sendRedirect("Main.jsp");
	}
	
	LiptonDB board = new LiptonDB("board");
	DBObject postInfo = board.find(String.format("{_id : %s}", "ObjectId('" + idx + "')")).get(0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=request.getParameter("n")%>님의 게시글</title>
<script src="./js/ModifyPost.js"></script>
<script src="./js/v.js"></script>
<link href="./CSS/style1.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<a href="Main.jsp" id="logo">Lipton</a>
		<div style="float:right;margin:5px 10px 0 0">
			<p style="margin:0 0 10px 0;text-align:right"><button id="v" onclick="v()"><%=name%></button></p>
			<div style="display:none" id="infodiv">
				<a href="Logout.jsp">[로그아웃]</a> |
				<a href="Modify.jsp">[회원정보 수정]</a> |
				<a href="Leave.jsp">[회원 탈퇴]</a>
			</div>
		</div>
	</header>
	<div style="padding-top:30px">
		<div id="postdiv" style="width:50%;margin:0 auto;background-color:#eee;padding:10px">
			<div>
				<h2 style="display:inline-block;margin:0"><%=postInfo.get("name")%></h2>
			</div>
			<p style="margin:0"><%=postInfo.get("registdate")%></p>
			<form name="modpostForm" method="post" action="Post_mod_ok.jsp">
				<input type="hidden" name="idx" value='<%=idx%>'>
				<input type="hidden" name="useridx" value='<%=useridx%>'>
				<textarea name="modpost" style="width:100%;resize:none"><%=postInfo.get("content")%></textarea>
				<input type="button" value="수정하기" onclick="sendit()">
			</form>
		</div>
	</div>
</body>
</html>