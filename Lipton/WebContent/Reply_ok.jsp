<%@page import="com.DBManage.LiptonDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	if (session.getAttribute("userid1") == null) {
		response.sendRedirect("Main.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");
	String idx = request.getParameter("postidx");
	String content = request.getParameter("reply");
	String useridx = (String)session.getAttribute("useridx");
	String name = (String)session.getAttribute("name");
	
	LiptonDB reply = new LiptonDB("reply");
	reply.insert(String.format("{useridx : %s, postidx : %s, name : '%s', content : '%s'}", useridx, "ObjectId('" + idx + "')", name, content));
%>
	<script>
		alert("댓글이 등록되었습니다")
		location.href = "Post.jsp?idx=<%=idx%>"
	</script>