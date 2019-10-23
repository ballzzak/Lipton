<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="com.DBManage.AES256Util"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DBManage.LiptonDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("lastname") + " " + request.getParameter("firstname");
	String userid = request.getParameter("userid");
	String pw = request.getParameter("pw");
	String gender = request.getParameter("gender");
	String uploadPath = request.getRealPath(".") + "\\upload";
	
	LiptonDB userdata = new LiptonDB("userdata");
	ArrayList<DBObject> overlapCheck = userdata.find(String.format("{$or : [{userid1 : '%s'}, {userid2 : '%s'}]}", userid, userid), "{_id : true}");
	
	if (overlapCheck.size() > 0) {
%>
		<script>
			alert("중복된 휴대폰 또는 이메일이 존재합니다")
			location.href = "Main.jsp"
		</script>
<%
	} else {
		userdata.insert(String.format("{name : '%s', userid1 : '%s', pw : '%s', gender : '%s'}",
				name, userid, AES256Util.aesEncode(pw), gender));
		
		String useridx = userdata.find("{userid1 : '" + userid + "'}").get(0).get("_id").toString();
		String path = uploadPath + "\\" + useridx;
		File Folder = new File(path);
		if (!Folder.exists()) {
			try{
			    Folder.mkdir();
		    } catch(Exception e){
			    e.getStackTrace();
			}
		}
		File defaultProfileImg = new File(uploadPath + "\\profileImg.png");
		File profileImg = new File(path + "\\profileImg.png");
		try {
			FileInputStream fis = new FileInputStream(defaultProfileImg);
			FileOutputStream fos = new FileOutputStream(profileImg);
			int fileByte = 0;
			while ((fileByte = fis.read()) != -1) fos.write(fileByte);
			fis.close();
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
%>
		<script>
			alert("정상적으로 가입되었습니다")
			location.href = "Main.jsp"
		</script>
<%
	}
%>
