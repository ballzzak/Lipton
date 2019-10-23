<%@page import="com.DBManage.LiptonDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding("UTF-8");
	String idx = request.getParameter("idx");
	String useridx = request.getParameter("useridx");
	String content = request.getParameter("modpost");
	
	if (session.getAttribute("userid1") == null || !("ObjectId('" + useridx + "')").equals((String)session.getAttribute("useridx"))) {
		response.sendRedirect("Main.jsp");
	}
	
	LiptonDB board = new LiptonDB("board");
	board.update(String.format("{_id : %s}", "ObjectId('" + idx + "')"), String.format("{$set : {content : '%s'}}", content));
%>
	<script>
		alert("글이 수정되었습니다")
		location.href = "Post.jsp?idx=<%=idx%>"
	</script>