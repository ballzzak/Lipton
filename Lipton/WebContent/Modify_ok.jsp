<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.DBManage.AES256Util"%>
<%@page import="com.mongodb.DBObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DBManage.LiptonDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("userid1") == null) {
		response.sendRedirect("Main.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");
	String uploadPath = request.getRealPath(".") + "\\upload";
	String useridx = (String)session.getAttribute("useridx");
	uploadPath += "\\" + useridx.split("\\'")[1];
	int maxSize = 1024 * 1024 * 5;
	String name = "";
	String userid1 = "";
	String userid2 = "";
	String prepw = "";
	String pw = "";
	String gender = "";
	MultipartRequest multi = null;
	String fileName = "";
	File newProfileImg = null;
	boolean sw = true;
	
	try {
		multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		name = multi.getParameter("lastname") + " " + multi.getParameter("firstname");
		userid1 = multi.getParameter("userid1");
		userid2 = multi.getParameter("userid2");
		prepw = multi.getParameter("pw0");
		pw = multi.getParameter("pw1");
		gender = multi.getParameter("gender");
		
		Enumeration files = multi.getFileNames();
		while (files.hasMoreElements()) {
			String file1 = (String)files.nextElement();
			fileName = multi.getFilesystemName(file1);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	if (userid1.equals(userid2)) {
		sw = false;
%>
		<script>
			alert("다른 휴대폰 번호 또는 이메일을 입력해 주세요")
			location.href = "Modify.jsp"
		</script>
<%
	}
	
	newProfileImg = new File(uploadPath + "\\" + fileName);
	if (sw) {
		LiptonDB userdata = new LiptonDB("userdata");
		ArrayList<DBObject> userInfo = userdata.find(String.format("{$and : [{userid1 : '%s'}, {pw : '%s'}]}",
				userid1, AES256Util.aesEncode(prepw)), "{_id : true}");
		
		if (userInfo.size() == 0) {
%>
			<script>
				alert("기존 비밀번호를 확인해 주세요")
				history.back()
			</script>
<%
		} else {
			userdata.update(String.format("{userid1 : '%s'}", userid1),
					String.format("{$set : {name : '%s', pw : '%s', gender : '%s'}}", name, AES256Util.aesEncode(pw), gender));
			if (!userid2.equals("")) {
				userdata.update(String.format("{userid1 : '%s'}", userid1), String.format("{$set : {userid2 : '%s'}}", userid2));
				session.setAttribute("userid2", userid2);
			}
			new File(uploadPath + "\\profileImg.png").delete();
			newProfileImg.renameTo(new File(uploadPath + "\\profileImg.png"));
%>
			<script>
				alert("정보가 정상적으로 수정되었습니다")
				location.href = "Main.jsp"
			</script>
<%
		}
	} else {
		try {
			newProfileImg.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>
