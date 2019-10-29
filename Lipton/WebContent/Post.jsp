<%@page import="com.mongodb.DBObject"%>
<%@page import="com.DBManage.LiptonDB"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = (String)session.getAttribute("name");
	String idx = request.getParameter("idx");
	String useridx = (String)session.getAttribute("useridx");
	useridx = useridx.split("\\'")[1];
	
	LiptonDB board = new LiptonDB("board");
	DBObject postInfo = board.find(String.format("{_id : %s}", "ObjectId('" + idx + "')")).get(0);
	
	int hit = (int)Double.parseDouble(postInfo.get("hit").toString()) + 1;
	board.update(String.format("{_id : %s}", "ObjectId('" + idx + "')"), String.format("{$set : {hit : %d}}", hit));
	postInfo.put("hit", hit);
	
	LiptonDB reply = new LiptonDB("reply");
	ArrayList<DBObject> replyInfo = reply.find(String.format("{postidx : %s}", "ObjectId('" + idx + "')"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=postInfo.get("name")%>님의 게시글</title>
<script src="./js/Post.js"></script>
<script src="./js/v.js"></script>
<link href="./CSS/style1.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<a href="Main.jsp" id="logo">Lipton</a>
		<div style="float:right;margin:5px 10px 0 0">
			<p style="margin:0 0 10px 0;text-align:right;font-size:20px;"><button id="v" onclick="v()"><%=name%></button></p>
			<div style="display:none" id="infodiv">
				<a href="Logout.jsp">[로그아웃]</a> |
				<a href="Modify.jsp">[회원정보 수정]</a> |
				<a href="Leave.jsp">[회원 탈퇴]</a>
			</div>
		</div>
	</header>
	<div style="padding-top:100px">
		<div id="postdiv" style="width:50%;margin:0 auto;background-color:#eee;padding:10px">
			<div>
				<h2 style="display:inline-block;margin:0"><%=postInfo.get("name").toString()%></h2>
				<p style="float:right;margin:0"><%=hit%></p>
			</div>
			<p style="margin:0"><%=postInfo.get("registdate").toString()%></p>
			<p><%=postInfo.get("content").toString()%></p>
			<%
			try {
				String postidx = "ObjectId('" + request.getParameter("idx") + "')";
				LiptonDB postlike = new LiptonDB("postlike");
				ArrayList<DBObject> post = postlike.find("{postidx : " + postidx + "}");
				ArrayList<Object> tmp = (ArrayList<Object>)post.get(0).get("useridxs");
				ArrayList<String> likeList = new ArrayList<>();
				for (Object i : tmp) likeList.add(i.toString());
				
				if (likeList.contains(useridx)) {
%>
					<button id="likebtn" onclick="like('<%=idx%>')" style="margin-right:10px;background-color:#FF9900">좋아요 <%=likeList.size()%></button>
<%
				} else {
%>
					<button id="likebtn" onclick="like('<%=idx%>')" style="margin-right:10px">좋아요 <%=likeList.size()%></button>
<%
				}
			} catch (Exception e) {
%>
				<button id="likebtn" onclick="like('<%=idx%>')" style="margin-right:10px">좋아요 0</button>
<%
			}
%>
			<script>
				if ("<%="ObjectId('" + postInfo.get("useridx").toString() + "')"%>" == "<%=(String)session.getAttribute("useridx")%>") {
					var delpostbtn = document.createElement("button")
					var modpostbtn = document.createElement("button")
					
					modpostbtn.innerText = "수정"
					modpostbtn.setAttribute("style","margin-right:10px")
					modpostbtn.setAttribute("onclick","location.href='Post_mod.jsp?idx=<%=idx%>&useridx=<%=postInfo.get("useridx").toString()%>'")
					document.getElementById("postdiv").appendChild(modpostbtn)
					
					delpostbtn.innerText = "삭제"
					delpostbtn.setAttribute("onclick","if(confirm('글을 삭제하시겠습니까?'))location.href='Post_del.jsp?idx=<%=idx%>&useridx=<%=postInfo.get("useridx").toString()%>'")
					
					document.getElementById("postdiv").appendChild(delpostbtn)
				}
			</script>
		</div>
		<div style="width:50%;margin:0 auto;background-color:#fff">
			<h3 style="margin-bottom:0">댓글</h3>
			<div id="reply">
			</div>
		</div>
	</div>
	<form name="replyForm" method="post" action="Reply_ok.jsp" style="width:50%;height:24px;margin:5px auto 10px auto">
		<input type="hidden" name="postidx" value="<%=idx%>">
		<input type="text" name="reply" placeholder="댓글을 달아보세요..." style="width:80%;height:24px;border-radius:2px;">
		<input type="button" value="댓글달기" style="width:18%;float:right" onclick="sendit()">
	</form>
</body>
</html>
<script>var sw = true</script>
<%
	for (int i = replyInfo.size() - 1; i >= 0; i--) {
%>
		<script>
			var wrapper = document.createElement("div")
				var header = document.createElement("div")
					var n = document.createElement("h4")
					var date = document.createElement("p")
				var cont = document.createElement("p")
				var drf = document.createElement("form")
					var hididx = document.createElement("input")
					var hiduseridx = document.createElement("input")
					var hidpostidx = document.createElement("input")
					var delreplybtn = document.createElement("button")
			
			n.innerText = "<%=replyInfo.get(i).get("name").toString()%>"
			date.innerText = "<%=replyInfo.get(i).get("registdate").toString()%>"
			cont.innerText = "<%=replyInfo.get(i).get("content").toString()%>"
			
			header.appendChild(n)
			header.appendChild(date)
			wrapper.appendChild(header)
			wrapper.appendChild(cont)
			
			n.setAttribute("style","margin:5px 0 0 0")
			date.setAttribute("style","margin:0")
			delreplybtn.innerText = "삭제"
			
			drf.appendChild(hididx)
			drf.appendChild(delreplybtn)
			drf.appendChild(hiduseridx)
			drf.appendChild(hidpostidx)
			
			if ("<%=(String)session.getAttribute("useridx")%>" == "<%="ObjectId('" + replyInfo.get(i).get("useridx").toString() + "')"%>") {
				drf.setAttribute("name","delreplyForm")
				drf.setAttribute("method","post")
				drf.setAttribute("action","Reply_del.jsp")
				drf.setAttribute("onSubmit","return false")
				
				hididx.setAttribute("type","hidden")
				hididx.setAttribute("name","idx")
				hididx.setAttribute("value","<%=replyInfo.get(i).get("_id").toString()%>")
				
				hiduseridx.setAttribute("type","hidden")
				hiduseridx.setAttribute("name","useridx")
				hiduseridx.setAttribute("value","<%=replyInfo.get(i).get("useridx").toString()%>")
				
				hidpostidx.setAttribute("type","hidden")
				hidpostidx.setAttribute("name","postidx")
				hidpostidx.setAttribute("value","<%=replyInfo.get(i).get("postidx").toString()%>")
				
				delreplybtn.setAttribute("onclick", "delReply()")				
				
				wrapper.appendChild(drf)
			}

			if (sw) {
				wrapper.setAttribute("style","background-color:white;padding:3px 10px; margin-top:10px; border-radius:5px;height:200px;border: 1px solid #f4b183;")
				sw = false
			} else {
				wrapper.setAttribute("style","background-color:white;padding:3px 10px; margin-top:10px; border-radius:5px;height:200px;border: 1px solid #f4b183;")
				sw = true
			}
			
			document.getElementById("reply").appendChild(wrapper)
		</script>
<%
	}
%>