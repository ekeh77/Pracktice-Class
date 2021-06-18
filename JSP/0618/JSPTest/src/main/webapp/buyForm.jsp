<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%
		String strResult = request.getParameter("result");
		String strUserID = (String)session.getAttribute("user");
		String strUserName = (String)session.getAttribute("userName");
		
		String gName = request.getParameter("buyGameName");
		String gPrice = request.getParameter("buyGamePrice");
	%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#main{
		width:95vw;
		height:80vh;
	}
	#top{
		width:95vw;
		height:70px;
		border:1px solid #777777;
	}
	#top span{
		font-size: 15px;
	}
	#top input{
		width:100px;
	}
	.top_img{
		width:60px;
		height:60px;
		float:left;
		margin: 0px 20px 0px 20px;
	}
	#top_id{
		float:right;
	}
	#top_pass{
		float:right;
		margin: 0px 20px 0px 20px;
	}
	.top_title{
		float:left;
		padding-top:30px;
		width: 100px;
		height: 15px;
		font-weight:bold;
		font-size: 20px;
	}
	#in_id{
		display:block;
		width: 100px;
		height: 15px;
		margin: 10px 0px 10px 0px;
	}
	#in_pass{
		display:block;
		width: 100px;
		height: 15px;
		margin: 10px 0px 10px 0px;
	}
	.login_btn{
		float:right;
		padding-top: 35px;
		margin: 0px 10px 0px 0px;
	}
	.login_btn input{
		width: 60px;
	}
	#top_login{
		float:right;
		margin: 0px 20px 0px 0px;
		padding-top:35px;
	}
	#mid{
		width:95vw;
		height:80vh;
		border:1px solid #777777;
	}
	#showList{
		margin: 0px 0px 0px 30px;
	}
	.listBox{
		clear:both;
		width:90vw;
	}
	.listBox:first-child span{
		text-align:center;
	}
	#showList span{
		display:block;
		float:left;
		border:1px solid #777777;
	}
	.chk{
		width:20px;
		height:20px;
		padding:3px;
	}
	.gName{
		width:700px;
		height:20px;
		padding:3px;
	}
	.gPrice{
		width:100px;
		height:20px;
		padding:3px;
	}
	#buyBtn{
		float:right;
		margin: 10px 40px 0px 0px;
	}
	#buyBtn input{
		padding:10px;
	}
	
	#whatBuy{
		border:1px solid #777777;
		width:80vw;
		height:70vh;
		margin: 0px 0px 0px 40px;
		padding: 15px;
	}
	#buyTitle{
		width:75vw;
		height:20xp;
		border: 1px solid #777777;
		border-width: 0px 0px 2px 0px;
		font-size: 25px;
		font-weight: bold;
		padding: 10px;
	}
	#buyLists{
		width:75vw;
		height:50vh;
		padding:10px;
	}
	#buyList{
		width:73vw;
		height:30px;
		padding: 5px 0px 0px 10px;
		clear:both;
	}
	#listName{
		display:block;
		width:60vw;
		border: 1px solid #777777;
		float:left;
		padding:5px;
	}
	#buyList:first-child span{
		text-align:center;
	}
	#listPrice{
		display:block;
		width:10vw;
		border: 1px solid #777777;
		float:left;
		padding:5px;
	}
	#buyGame{
		width:75vw;
		height:80px;
		padding:10px;
	}
	#totlaPrice{
		border: 1px solid #777777;
		width:75vw;
		border-width: 2px 0px 0px 0px;
		font-size: 15px;
		font-weight: bold;
		text-align:right;
		padding-top:10px;
		margin-bottom: 20px;
	}
	#buySubmit{
		float:right;
	}
	#buySubmit input:hover{
		border-color:blue;
		background-color:blue;
		color:#fff;
	}
	#cancel{
		float:right;
		margin:0px 0px 0px 10px;
	}
</style>
</head>
<body onload="chkLogin('<%=strResult %>');">
	<div id="main">
		<div id="top">
				<% 
				if(strUserID == null){
					response.sendRedirect("./20210617.jsp");
				}
				else{
				%>
				<form action="./logout.jsp" method="post">
					<div><img src="https://ww.namu.la/s/a09cdb2fadaef8fad8180f013d52ceaa89ee9b023cc5ba7f78bcd2febc5ce20843e4646c2529ec88a86988f8f79398f4f082f9036da6331d1fbcf80e6090f4b2502451c43255dadbad8a9bc9a136637dbfdd580fa6fc0ea82d80275f23f698e1aec1da3b64027fccf256774c931b0a26" id="Ltop_img" class="top_img"/></div>
					<div id="Ltop_title" class="top_title">GameStation</div>
					<div id="logout_btn" class="login_btn">
						<input type="submit" value="로그아웃"/>
					</div>
					<div id="top_login">
						<%=strUserName %>님 로그인
					</div>
				</form>
				<%
				}
				%>
		</div>
		<div id="mid">
			<div id="whatBuy">
				<div id="buyTitle"><%=strUserName%>님의 장바구니</div>
				<div id="buyLists">
					<div id="buyList">
						<span id="listName">게임명</span>
						<span id="listPrice">가격</span>
					</div>
					<div id="buyList">
						<span id="listName"><%=gName%></span>
						<span id="listPrice"><%=gPrice%>원</span>
					</div>
				</div>
				<div id="buyGame">
					<div id="totlaPrice">총가격 : <%=gPrice%>원</div>
					<div id="cancel"><a href="./20210617.jsp"><input type="button" value="취소"/></a></div>
					<form action="buy_ok.jsp" method="post">
						<div id="buySubmit"><input type="submit" value="구매"/></div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>