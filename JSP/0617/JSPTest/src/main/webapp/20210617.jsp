<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%
		String strResult = request.getParameter("result");
		String strUserID = (String)session.getAttribute("user");
		String strUserName = (String)session.getAttribute("userName");
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
</style>
<script>
	function showList(){
			
		var	httpRequest = new XMLHttpRequest();
		
		httpRequest.onreadystatechange = listCallback;
		httpRequest.open("POST","./getGList.jsp",true);
		httpRequest.send(null);
		
		function listCallback()
		{ 
			//서버로부터 응답이 왔으므로 알맞은 작업을 수행 
			if (httpRequest.readyState == 4) 
			{ 
				if (httpRequest.status == 200) 
				{ 
					var datas = httpRequest.responseXML;
					setList(datas);
					
				} 
				else { alert("실패: " + httpRequest.status); }
			}
		}
		
		function setList(datas){
			
			var gName = datas.getElementsByTagName("gName");
			var gPrice = datas.getElementsByTagName("gPrice");
			var strHTML = "";
			
			strHTML += "<div class='listBox'>"
			strHTML += "<span class='chk'></span>"
			strHTML += "<span class='gName' name='gName'>게임명</span>"
			strHTML += "<span class='gPrice' name='gPrice'>가격</span>"
			strHTML += "</div>"
			
			for(var i=0; i<gName.length; i++){
				
				strHTML += "<div class='listBox'>"
				strHTML += "<span class='chk'><input type='checkbox' name='chk'/>　</span>"
				strHTML += "<span class='gName' name='gName'>" + gName[i].childNodes[0].nodeValue + "</span>"
				strHTML += "<span class='gPrice' name='gPrice'>" + gPrice[i].childNodes[0].nodeValue + "원</span>"
				strHTML += "</div>"
				
			}
			
			document.getElementById("showList").innerHTML = strHTML;
		}
		
	}
	
	function chkLogin(result){
		if(result == 'N'){
			alert("아이디 또는 패스워드가 일치하지 않습니다")
		}
	}	

</script>
</head>
<body onload="showList(); chkLogin('<%=strResult %>');">
	<div id="main">
		<div id="top">
				<% 
				if(strUserID == null){
				%>
				<form action="./login_ok.jsp" method="post">
					<div><img src="https://ww.namu.la/s/a09cdb2fadaef8fad8180f013d52ceaa89ee9b023cc5ba7f78bcd2febc5ce20843e4646c2529ec88a86988f8f79398f4f082f9036da6331d1fbcf80e6090f4b2502451c43255dadbad8a9bc9a136637dbfdd580fa6fc0ea82d80275f23f698e1aec1da3b64027fccf256774c931b0a26" id="top_img" class="top_img"/></div>
					<div id="top_title" class="top_title">GameStation</div>
					<div id="login_btn" class="login_btn">
						<input type="submit" value="로그인"/>
					</div>
					<div id="top_pass">
						<span id="in_pass">패스워드</span>
						<input type="text" name="userPass"/>
					</div>
					<div id="top_id">
						<span id="in_id">아이디</span>
						<input type="text" name="userID"/>
					</div>
				</form>
				<%
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

			<form action="" method="post">
				<div id="showList"></div>
				<div id="buyBtn">
					<input type="submit" value="구매"/>
				</div>
			</form>
			
		</div>
	</div>
</body>
</html>