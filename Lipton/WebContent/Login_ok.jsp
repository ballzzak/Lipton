<%@page import="com.DBManage.AES256Util"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DBManage.LiptonDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String pw = AES256Util.aesEncode(request.getParameter("pw"));
	
	LiptonDB userdata = new LiptonDB("userdata");
	ArrayList<DBObject> userInfo = userdata.find(String.format("{$and : [{$or : [{userid1 : '%s'}, {userid2 : '%s'}]}, {pw : '%s'}]}",
			userid, userid, pw), "{_id : true, name : true, userid1 : true, userid2 : true}");

	if (userInfo.size() > 0) {
		session.setAttribute("useridx", "ObjectId('" + userInfo.get(0).get("_id").toString() + "')");
		session.setAttribute("name", userInfo.get(0).get("name").toString());
		session.setAttribute("userid1", userInfo.get(0).get("userid1").toString());
		try {
			session.setAttribute("userid2", userInfo.get(0).get("userid2").toString());
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		response.sendRedirect("Main.jsp");
	} else {
%>
		<script>
			alert("아이디 또는 패스워드를 확인해 주세요.")
			location.href="Main.jsp"
		</script>
<%
	}
%>