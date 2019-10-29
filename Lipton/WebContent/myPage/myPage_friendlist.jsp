<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <title>프로필</title>
    	<link href="../CSS/mypage.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <header>
			<nav><a href="Main.jsp" id="logo">Lipton</a>
                    <ul id="content">
                        <li><a href="Profile" id="Profile">name님</a></li>
                        <li>||</li>
                        <li><a href="Home" id="Home">HOME</a></li>
                        <li>||</li>
                        <li><a href="FriendFind" id="FriendFind">친구찾기</a></li>
                        <li>||</li>
                        <li><a href="joinmembership" id="joinmembership">회원가입</a></li>
                    </ul>
                </nav>
        </header>
			<div id="ProfileBackground">
				<div>	
                 <li><img style="width:50%;" src="./image/profile.png"/><a href="Profile" id="name2">name</a></li>
                </div>
            </div>
            <section id="Profilebar">
               <nav>
                <ul id="listbar">
                <center>
                 <li><a href="#Timeline">타임라인</a></li>
                 <li>|</li>
                 <li><a href="#Introduce">소개</a></li>
                 <li>|</li>
                 <li><a href="#Photo">사진</a></li>
                 <li>|</li>
                 <li><a href="#Friend" class="current">친구</a></li>
                 </center>
                </ul>
               </nav>
            </section>
            <div id="friendlistTable" style="width:800px; height: 3000px; background-color:white; border:1px solid gray; top: 50px; border-bottom:none;margin-left: 23%;margin-bottom:20px;">
            	<div id="friendlistLine" style="width:100%; height: 200px; border: none;">
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:left; width: 370px; height:60%;margin:5px 5px;">
            			<img src="./image/profile.png" style="margin-left:1px; float:left; height:80%;">
            			<p style="float:left; overflow:hidden; margin-left:10px;"><strong>서재성</strong></p>
            			<p><input type="button" style="border-radius:2px; color:white;float:right; background-color:green;align:center;margin-right:5px;" value="√친구"></p>
            		</div>
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:right; width: 370px; height:60%;margin:5px 5px;">d</div>
            	</div>
            	<div id="friendlistLine" style="width:100%; height: 200px; border: none;">
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:left; width: 370px; height:60%;margin:5px 5px;">d</div>
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:right; width: 370px; height:60%;margin:5px 5px;">d</div>
            	</div>
            	<div id="friendlistLine" style="width:100%; height: 200px; border: none;">
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:left; width: 370px; height:60%;margin:5px 5px;">d</div>
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:right; width: 370px; height:60%;margin:5px 5px;">d</div>
            	</div>
            	<div id="friendlistLine" style="width:100%; height: 200px; border: none;">
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:left; width: 370px; height:60%;margin:5px 5px;">d</div>
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:right; width: 370px; height:60%;margin:5px 5px;">d</div>
            	</div>
            	<div id="friendlistLine" style="width:100%; height: 200px; border: none;">
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:left; width: 370px; height:60%;margin:5px 5px;">d</div>
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:right; width: 370px; height:60%;margin:5px 5px;">d</div>
            	</div>
            	<div id="friendlistLine" style="width:100%; height: 200px; border: none;">
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:left; width: 370px; height:60%;margin:5px 5px;">d</div>
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:right; width: 370px; height:60%;margin:5px 5px;">d</div>
            	</div>
            	<div id="friendlistLine" style="width:100%; height: 200px; border: none;">
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:left; width: 370px; height:60%;margin:5px 5px;">d</div>
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:right; width: 370px; height:60%;margin:5px 5px;">d</div>
            	</div>
            	<div id="friendlistLine" style="width:100%; height: 200px; border: none;">
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:left; width: 370px; height:60%;margin:5px 5px;">d</div>
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:right; width: 370px; height:60%;margin:5px 5px;">d</div>
            	</div>
            	<div id="friendlistLine" style="width:100%; height: 200px; border: none;">
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:left; width: 370px; height:60%;margin:5px 5px;">d</div>
            		<div id="friendlistBox" style="border: 1px solid gray; text-align:left; float:right; width: 370px; height:60%;margin:5px 5px;">d</div>
            	</div>
            </div>

</body>
</html>