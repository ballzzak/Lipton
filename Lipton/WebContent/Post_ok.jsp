<%@page import="com.DBManage.LiptonDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	if (session.getAttribute("userid1") == null) {
		response.sendRedirect("Main.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");
	String idx = (String)session.getAttribute("useridx");
	String name = (String)session.getAttribute("name");
	String content = request.getParameter("post").replaceAll("\r\n", "<br>");
	
	LiptonDB board = new LiptonDB("board");
	board.insert(String.format("{useridx : %s, name : '%s', content : '%s', hit : 0}", idx, name, content));
%>
	<script>
		alert("글이 등록되었습니다")
		location.href = "Main.jsp"
	</script>