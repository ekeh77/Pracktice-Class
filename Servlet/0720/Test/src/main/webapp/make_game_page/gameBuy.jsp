<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<% 
		//세션값인 로그인 여부 및 유저ID와 이름을 가져옴
		String strResult = request.getParameter("result");
		String strUserID = (String)session.getAttribute("user");
		String strUserName = (String)session.getAttribute("userName");
	%>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		display:flex;
		justify-content:center;
		width:99%;
		color: #ffffff;
	}
	#container{
		width:95vw;
		height:90vh;
	}
	#header{
		width:90vw;
		height:10vh;
		display:flex;
		justify-content:space-between;
		background-color: #333333;
		border: 1px solid #333333;
	}
	#body{
		width:90vw;
		height:85vh;
		border: 1px solid #333333;
	}
	
	#titleBox{
		margin:22px 10px 10px 0px;
		display:flex;
	}
	
	#loginBox{
		margin:25px 10px 10px 10px;
	}
	
	#loginForm > span{
		margin-right: 10px;
		font-weight:bold;
	}
	
	#loginForm > input:text{
		border: 2px solid black;
	}
	
	#title{
		font-weight:bold;
		font-size: 20px;
		
	}
	
	#logo img{
		width: 100px;
		height: 100px;
		position:absolute;
	}
	
	#login_btn{
		padding: 4px;
		background-color: #ffffff;
		border: 1px solid #ffffff;
		border-radius: 5px;
		font-weight:bold;
	}
	#login_btn:active{
		
		background-color: #111111;
		border: 1px solid #111111;
		color: #ffffff;
	}
	.inputText{
		width:120px;
	}
	#menuList{
		display:flex;
		justify-content:space-between;
		height: 10vh;
		margin-top: 20px; 
	}
	#menuList > div{
		width: 15vw;
		padding-top: 25px;
		border: 1px solid orange;
		border-width: 0px 1px 0px 1px;
		text-align: center;
		font-weight:bold;
		background-color: #333333;
	}
	#menuList > div:hover{
		background-color: orange;
		cursor:pointer;
	}
	#contentList{
		width: 100%;
		height: 83%;
	}
	
	#GListMenu{
		margin-top: 5px;
		color:black;
		height: 25px;
		border:1px solid black;
		border-width: 1px 0px 1px 0px;
		display:flex;
		justify-content: space-between;
		align-items: center;
	}
	#GListMenu > span{
		display:block;
		width: 10vw;
	}
	#GListMenu > span:first-child{
		margin-left:70px;
		margin-right: 280px;
	}
	#GListMenu > span:nth-child(2){
		margin-right: 110px;
	}
	#GListMenu > span:nth-child(3){	
		margin-right: 20px;
	}
	#GListMenu > span:last-child{
		margin-right: 70px;
	}
	#GList{
		display:flex;
		flex-direction: column;
		align-items: center;
		margin-top: 10px;
		margin-bottom: 10px;
	}
	.lists:hover{
		background-color:orange;
		cursor:pointer;
	}
	.lists{
		display:flex;
		align-items: center;
		height: 27px;
	}
	.lists  span:nth-child(2)  input{
		width:350px;
		margin-right:3px;
	}
	.lists  span:nth-child(3)  input{
		margin-right:3px;
	}
	.lists  span:nth-child(4)  input{
		text-align:center;
		width:100px;
		margin-right:3px;
	}
	.lists  span:nth-child(5)  input{
		text-align:right;
		width:70px;
		margin-right:3px;
	}
	.lists  span:nth-child(6)  input{
		text-align:center;
		width:100px;
		margin-right:3px;
	}
	.lists span input:hover{
		cursor:pointer;
	}
	
	#Buybutton{
		position:absolute;
		top:780px;
		left:870px;
	}
	#Buybutton input{
		padding: 5px 15px;
		background-color:orange;
		border:1px solid orange;
		border-radius: 5px;
		color:#ffffff;
	}
	#Buybutton input:active{
	background-color:#db881d;
		
	}
</style>
<script src="jquery-3.6.0.min.js"></script>
<script>
	
	var userID = '<%=strUserID%>';
	
	$(document).ready(
		function(){
			chkLogin('<%=strResult%>');
			//로그인 체크
			
			showGameList();
			//게임리스트 보여주는 함수
		}
	)

	var showGameList = function(){
		
		var strHTML = "";
		
		$.ajax({
			type: "post",
			async: "true",
			url: "/Test/GS_GameList",
			data:"",
			dataType:"json",
			success:function(data){
				
				 var gameLists = data["GAMELISTS"];
                 
				 strHTML += '<div id="GListMenu">';
                 strHTML += '<span >게임이름</span>';
                 strHTML += '<span>제조사</span>';
                 strHTML += '<span>출시일</span>';
                 strHTML += '<span>가격</span>';
                 strHTML += '<span>장르</span>';
                 strHTML += '</div>';
				
                 strHTML += '<div id="GList">';
                 strHTML += '<form action="../GS_BuyGames" method="post" id="buyGame">'
                 for(var i=0;i<gameLists.length;i++){
                    
                    var gameList = gameLists[i];
                    
                    var G_ID = gameList["G_ID"];
                    var G_NAME = gameList["G_NAME"];
                    var G_MAKER = gameList["G_MAKER"];
                    var G_RELEASE = gameList["G_RELEASE"];
                    var G_SALES_PRICE = gameList["G_SALES_PRICE"];
                    var G_GENRE = gameList["G_GENRE"];
                    
                    strHTML += '<div class="lists" id="lists'+ i +'" onclick="">';
                    strHTML += '<span>';
                    strHTML += '<input type="checkbox" name="GLchk" class="GListInput" id="" value="' + G_ID + '">';
                    strHTML += '</span>';
                    strHTML += '<span ><input type="text" name="GName" class="GListInput" value="' + G_NAME + '" readonly/></span>';
                    strHTML += '<span><input type="text" name="GMaker" class="GListInput" value="' + G_MAKER + '" readonly/></span>';
                    strHTML += '<span><input type="text" name="GRelease" class="GListInput" value="' + G_RELEASE + '" readonly/></span>';
                    strHTML += '<span><input type="text" name="GSalesPrice" class="GListInput" value="' + G_SALES_PRICE + '" readonly/></span>';
                    strHTML += '<span><input type="text" name="GGenre" class="GListInputs" value="' + G_GENRE + '" " readonly/></span>';
                    strHTML += '</div>';
                    
                 }
                 strHTML += '</form>'
                 strHTML += '</div>';
                 strHTML += '<div id="Buybutton">';
                 strHTML += '<input type="button" value="구매하러가기" onclick="chk_buy(&quot;' + userID + '&quot;);"/>'
                 strHTML += '</div>';
                 $("#contentList").html(strHTML);
			},
			error:function(xhr,status,error){
				alert("err")
			},
			complete:function(data,textStatus){
				
			}
		});
		
	}
	
	var login = function(){
		//로그인값이 공백인경우를 체크
		if($("#userID").val() == "" || $("#userPass").val() == ""){
			alert("아이디 또는 비밀번호를 입력해주세요")
		}
		else{
			$("#loginForm").submit();
		}
		
	}
	var logout =function(){
		//로그아웃 함수
		$("#logoutForm").submit();
	}
	
	var chkLogin = function(result){
		//만약 아이디와 비밀번호가 다른경우
		if(result == 'N'){
			alert("아이디 또는 패스워드가 일치하지 않습니다")
		}
	}
	
	
	function chk_buy(strID){
		//구매함수
		var strBuyList = "";
		if(strID == 'null'){
			alert("구매는 회원만 가능합니다 로그인을 해주세요")
		}
		else{
			//게임이 하나도 체크가 안되있을경우 경고창을 띄움
			var countBuy = 0;
			
			var chk = document.getElementsByName("GLchk");
			
			for(var i = 0; i < chk.length; i++){
				
				if(chk[i].checked){
					
					countBuy += 1;
					
				}
			}
			
			if(countBuy <= 0){
				alert("구매체크된 물건이 없습니다")
			}
			else{
				
				$("#buyGame").submit();
				
			}
			
		}
		
	}
	
</script>
</head>
<body>
	<div id="container">
		<div id="header">
				<div id="logo"><img src="https://upload.wikimedia.org/wikipedia/ko/thumb/a/a6/Pok%C3%A9mon_Pikachu_art.png/200px-Pok%C3%A9mon_Pikachu_art.png"/></div>
			<div id="titleBox">
				<div id="title">Game Station</div>
			</div>
			<div id="loginBox">
			<!-- 로그인 안되었을 때 -->
				<%if(strUserName == null){%>
				<form action="../GS_ChkLog" method="post" id="loginForm">
					<span>ID</span><input class="inputText" id="userID" name="userID" type="text"/>
					<span>Password</span><input class="inputText" id="userPass" name="userPass" type="password"/>
					<input type="button" id="login_btn" value="Login" onclick="login();"/>
				</form>
			<!-- 로그인 되었을 때 -->
				<%}else{ %>
				<form action="../GS_Logout" method="post" id="logoutForm">
					<span><%=strUserName%>님 환영합니다</span>
					<input type="button" id="logout_btn" value="Logout" onclick="logout();"/>
				</form>
				<% } %>
			</div>
		</div>
		<div id="body">
			<div id="menuList">
				<div onclick="showGameList();">게임</div>
				<div>게임리뷰</div>
				<div>이벤트</div>
				<div>공지사항</div>
				<div>고객지원</div>
				<div>Game Station 소개</div>
			</div>
			<div id="contentList">
			
			</div>
		</div>
	</div>
</body>
</html>