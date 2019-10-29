<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구 추천</title>
<style>
.green_window {
	display: inline-block;
	width: 366px; height: 34px;
	border: 3px solid #2db400;
	background: white;
}
.input_text {
	width: 348px; height: 21px;
	margin: 6px 0 0 9px;
	border: 0;
	line-height: 21px;
	font-weight: bold;
	font-size: 16px;
	outline: none;
}
.sch_smit {
	width: 54px; height: 40px;
	margin: 0; border: 0;
	vertical-align: top;
	background: #22B600;
	color: white;
	font-weight: bold;
	border-radius: 1px;
	cursor: pointer;
}
.sch_smit:hover {
	background: #56C82C;
}
.header {
  height: 30px;
  padding: 30px;
  text-align: center;
  background: orange;
}
.card {
  background-color: pink;
  padding: 20px;
  margin-top: 20px;
}
.fakeimg {
  background-color: #aaa;
  width: 50px;
  height: 50px;
  padding: 20px;
  float: left;
}
</style>
</head>
<body>
<header class="header">
<span class='green_window'>
	<input type='text' class='input_text' />
</span>
<button type='submit' class='sch_smit'>검색</button>
</header>
<p>알 수도 있는 친구</p>
<%
	int i = 0;
	for(i=0;i<=3;i++){
%>
<div class="card">
	<div class="fakeimg">사진</div>
	<div><a href="#">이름</a></div>
	<p>설명</p>
</div>
<%
	}
%>
</body>
</html>