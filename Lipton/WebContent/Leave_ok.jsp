<%@page import="java.io.File"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DBManage.AES256Util"%>
<%@page import="com.DBManage.LiptonDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("userid");
	String pw = request.getParameter("pw");
	String useridx = (String)session.getAttribute("useridx");
	String userFolderPath = request.getRealPath(".") + "\\upload\\" + useridx.split("\\'")[1];
	System.out.println(userFolderPath);
	File folder = new File(userFolderPath);
	
	LiptonDB userdata = new LiptonDB("userdata");
	LiptonDB board = new LiptonDB("board");
	LiptonDB reply = new LiptonDB("reply");
	
	ArrayList<DBObject> userInfo = userdata.find(String.format("{$and : [{$or : [{userid1 : '%s'}, {userid2 : '%s'}]}, {pw : '%s'}]}",
			id, id, AES256Util.aesEncode(pw)), "{_id : true}");
	
	if (userInfo.size() > 0) {
		userdata.remove(String.format("{_id : %s}", (String)session.getAttribute("useridx")));
		try {
			board.remove(String.format("{useridx : %s}", (String)session.getAttribute("useridx")));
			reply.remove(String.format("{useridx : %s}", (String)session.getAttribute("useridx")));
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		File[] folderList = folder.listFiles();
		for (File i : folderList) i.delete();
		folder.delete();
		session.invalidate();
%>
		<script>
			alert("탈퇴가 완료되었습니다.")
			location.href="Main.jsp"
		</script>
<%
	} else {
%>
		<script>
			alert("패스워드를 확인해 주세요.")
			history.back()
		</script>
<%
	}
%>
