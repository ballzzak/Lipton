<%@page import="com.mongodb.DBObject"%>
<%@page import="com.DBManage.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lipton - 로그인 또는 가입</title>
<%
	if (session.getAttribute("name") != null) {
%>
		<script>
			document.getElementsByTagName("title")[0].innerText = "Lipton"
		</script>
<%
	}
%>
<script src="./js/Main.js"></script>
<script src="./js/v.js"></script>
<link href="./CSS/style1.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	String name = "";
	if(session.getAttribute("name") != null){
		name = (String)session.getAttribute("name");
	}
	if (name.equals("")) {
%>

		<header>
			<a href="Main.jsp" id="logo">Lipton</a>
			<form name="LoginForm" id="loginform" method="post" action="Login_ok.jsp">
				<div class="logindiv">
					<label for="id">이메일 또는 휴대폰</label>
					<input type="text" name="userid" maxlength="20" id="id">
					<div> </div>
				</div>
				<div class="logindiv" style="width:260px;">
					<label for="pw">비밀번호</label>
					<div>
						<input type="password" id="pw" name="pw" maxlength="20">
						<input type="button" value="로그인" onclick="sendit1()" style="font-weight:bolder;margin-left:8px;border-radius:2px;background-color:#039e69;border:1px solid black;color:white;">
					</div>
					<div><a href="#">계정을 잊으셨나요?</a></div>
				</div>
			</form>
		</header>
		<div id="registdiv" style="padding-top: 150px;">
			<div>
				<h1>가입하기</h1>
				<p>빠르고 쉽습니다.</p>
				<form name="regForm" method="post" action="Regist_ok.jsp">
					<div class="inputdiv">
						<input type="text" name="lastname" placeholder="성(姓)" class="registinput1">
						<input type="text" name="firstname" placeholder="이름(성은 제외)" class="registinput1">
					</div>
					<div class="inputdiv"><input type="text" name="userid" placeholder="휴대폰 번호 또는 이메일" class="registinput2"></div>
					<div class="inputdiv"><input type="password" name="pw" placeholder="새 비밀번호" class="registinput2"></div>
					<div class="inputdiv">
						<input type="radio" name="gender" value="여성" checked>여성
						<input type="radio" name="gender" value="남성">남성
					</div>
					<input type="button" value="가입하기" onclick="sendit2()" style="background-color: #f4b183;width:250px;height:40px;border:none;color:white;border-radius:2px; height: 50px;">
				</form>
			</div>
		</div>
		<div id="footerdiv">
			<h3>Lipton.com</h3>
			<h5>team: 곽종헌, 박찬주, 박혜원, 서재성, 이상헌, 조준형</h5>
			<h5>Group: 3조</h5>
			<h5>Call: Lipton@gmail.com</h5>
		</div>
<%
	} else {
		LiptonDB board = new LiptonDB("board");
		ArrayList<DBObject> postInfo = board.find();
%>
		<header id="bar">
			<a href="Main.jsp" id="logo">Lipton</a>
			<div style="float:left;margin-left:400px;margin-top:20px;"><input type="text" placeholder="검색해보기..." style="width:350px;border:none; border-radius:2px; height:30px;"></div>
			<div style="float:left;margin-top:20px;"><input type="button" value="검색" style="border:none; border-radius:2px; width:50px;height:30px;background-color:orange;"></div>
			<div style="float:right;margin:5px 10px 0 0">
				<p style="margin:0 0 10px 0;text-align:right"><button id="v" onclick="v()"><%=name%></button></p>
				<div style="display:none" id="infodiv">
					<a href="Logout.jsp">[로그아웃]</a> |
					<a href="Modify.jsp">[회원정보 수정]</a> |
					<a href="Leave.jsp">[회원 탈퇴]</a>
					<a href="myPage/myPage.jsp">[마이페이지]</a>
				</div>
			</div>
		</header>
		<div style="padding-top:100px">
			<div id="boarddiv">
				<h1 style="margin-top:0"></h1>
				<form name="postForm" method="post" action="Post_ok.jsp" style="margin-bottom: 30px;">
				<div style="border:1px solid orange;border-radius:2px;">
				<p style="height:100%; margin:0;background-color:orange; width:100%; color:white;padding:8px;">
					게시물 만들기
				</p>
					<textarea name="post" placeholder="<%=name%>님, 게시글을 올려보세요" style="height:150px;border:none;"></textarea>
					<input type="button" value="게시하기" style="font-size:20px;color: white;width:100%;height:50px;border:none;border-radius:2px;background-color: #c5e0b4;" onclick="sendit3()">
				</div>
				</form>
			</div>
		</div>
		<div>
			<div id="leftsidebar" style="background-color:#fdeada; 
	width:20%; 
	height:750px; 
	color:blue; 
	top:122px; 
	position:fixed;
	border-right:1px solid grey; 
	border-radius:2px;
	margin-left:100px;
	text-align:center;">
	<div id="leftsidebartitle">
			<p style="height:100%; margin:0;background-color:orange; width:100%; color:white;padding:8px; text-align:center;">카테고리 및 친구 리스트</p>
		</div>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
				<h4>SideBar</h4>
			</div>
		</div>
		<div>
			<div id="rightsidebar" style="float:right;margin-left:75%;background-color:white; width:20%; height:400px; margin-right:10%; color:blue;top:122px; position:fixed;">
				<p style="height:20%; margin:0;background-color:orange; width:100%; color:white;padding:8px;">광고</p>
				<div style="background-color:white; height:80%;">
					광고 내용
				</div>
			</div>
		</div>
		<script>var sw = true</script>
<%
		for (int i = postInfo.size() - 1; i >= 0; i--) {
%>
			<script>
				var wrapper = document.createElement("div");
					var header = document.createElement("div");
						var n = document.createElement("h3");
						var hit = document.createElement("span");
						var date = document.createElement("p");
					var contentdiv = document.createElement("div");
						var cont = document.createElement("a");
				
				n.innerText = "<%=postInfo.get(i).get("name")%>"
				hit.innerText = "<%=(int)Double.parseDouble(postInfo.get(i).get("hit").toString())%>"
				date.innerText = '<%=postInfo.get(i).get("registdate")%>'
				cont.innerHTML = "<%=postInfo.get(i).get("content")%>"
				
				header.appendChild(n)
				header.appendChild(hit)
				header.appendChild(date)
				contentdiv.appendChild(cont)
				
				wrapper.appendChild(header)
				wrapper.appendChild(contentdiv)
				
				n.setAttribute("style","display:inline-block;width:50%;margin:10px 0 0 0")
				hit.setAttribute("style","float:right;display:block;margin-top:10px")
				date.setAttribute("style","clear:both;margin:0")
				cont.setAttribute("style","display:block;margin:16px 0;color:black;text-decoration-line:none")
				cont.setAttribute("href","Post.jsp?idx=<%=postInfo.get(i).get("_id").toString()%>")
				
				if (sw) {
					wrapper.setAttribute("style","background-color:white;padding:3px 10px; margin-top:10px; border-radius:5px;height:200px;border: 1px solid #f4b183;")
					sw = false
				} else {
					wrapper.setAttribute("style","background-color:white;padding:3px 10px; margin-top:10px; border-radius:5px;height:200px;border: 1px solid #f4b183;")
					sw = true
				}
				
				document.getElementById("boarddiv").appendChild(wrapper)
			</script>
<%
		}
%>
<%
	}
%>
</body>
</html>