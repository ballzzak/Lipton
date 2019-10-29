<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
                 <li><a href="#Friend">친구</a></li>
                 </center>
                </ul>
               </nav>
            </section>
         <div id="container">   
          <section id="leftbar">             
            <div id="Introduce">
                 <h4><img style="width:10%;" src="./image/introduce.png"/> 소개</h4>
                 <p>서울시 강남구 거주</p>
                 <p>LIPTON 회사에 근무</p>
                 <p>홍차고등학교 출신</p>
            </div>
            <div id="Photo">
                 <h4><img style="width:8%;" src="./image/picture.png"/> 사진</h4>
            </div>
             <div id="Friend">
                 <h4><img style="width:8%;" src="./image/friend.png"/> 친구</h4>
            </div>
          </section>
          <section id="Mainbar">
            <div id="PostMake">
                 <li><img style="width:8%;" src="./image/postMakePen.png"/> 게시물 만들기</li>
                 <li>|</li>
                 <li><img style="width:8%;" src="./image/postMakeCamera.png"/> 사진/동영상</li>
                 <br><br><br><br>
                 <li>무슨 생각을 하고 계신가요?</li>
              </div>
            <div class="Timeline">
                <h4><img style="width:2%;" src="./image/timeline.png"/> 타임라인</h4>
            </div>
            <div id="Post">
                 <p>게시글</p>
                 <p style="word-spacing:3em;">
                    <img style="width:2%;" src="./image/like.png"/>좋아요(0명)
                    <img style="width:2%;" src="./image/comment.png"/>댓글(0개)   
                    작성:2019-10-27</p>
            </div>
            <div id="Post2">
                 <p>게시글</p>
                 <p style="word-spacing:3em;">
                    <img style="width:2%;" src="./image/like.png"/>좋아요(0명)
                    <img style="width:2%;" src="./image/comment.png"/>댓글(0개)   
                    작성:2019-10-27</p>
            </div>
            <div id="Post3">
                 <p>게시글</p>
                 <p style="word-spacing:3em;">
                    <img style="width:2%;" src="./image/like.png"/>좋아요(0명)
                    <img style="width:2%;" src="./image/comment.png"/>댓글(0개)   
                    작성:2019-10-27</p>
            </div>
          </section>
        </div>     
    </body>
</html>