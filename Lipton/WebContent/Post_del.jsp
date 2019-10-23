<%@page import="com.DBManage.LiptonDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String idx = request.getParameter("idx");
	String useridx = request.getParameter("useridx");

	if (session.getAttribute("userid1") == null || !("ObjectId('" + useridx + "')").equals((String)session.getAttribute("useridx"))) {
		response.sendRedirect("Main.jsp");
	}
	
	LiptonDB board = new LiptonDB("board");
	board.remove(String.format("{_id : %s}", "ObjectId('" + idx + "')"));
	
	LiptonDB reply = new LiptonDB("reply");
	reply.remove(String.format("{postidx : %s}", "ObjectId('" + idx + "')"));
%>
	<script>
		alert("글이 삭제되었습니다")
		location.href = "Main.jsp"
	</script>