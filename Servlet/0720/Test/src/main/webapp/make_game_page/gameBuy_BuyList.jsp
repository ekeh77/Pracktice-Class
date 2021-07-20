<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% 
//세션값인 로그인 여부 및 유저ID와 이름을 가져옴
	String strResult = request.getParameter("result");
	String strUserID = (String)session.getAttribute("user");
	String strUserName = (String)session.getAttribute("userName");
%>
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
	#lists{
		width:100vw;
		border:1px solid black;
	}
	.lists{
		display:flex;
		align-items: center;
		height: 27px;
	}
	.lists:last-child{
		margin-bottom:20px;
	}
	.lists  span:nth-child(1)  input{
		width:300px;
		margin-left:40px;
	}
	.lists  span:nth-child(2)  input{
		width:50px;
		margin-left:3px;
	}
	.lists span input:hover{
		cursor:pointer;
	}
	
	#Buybutton{
		margin-top: 30px;
		margin-left: 320px;
	}
	#Buybutton input{
		padding: 5px 15px;
		margin-right: 20px;
		background-color:orange;
		border:1px solid orange;
		border-radius: 5px;
		color:#ffffff;
		cursor: pointer;
	}
	#Buybutton input:active{
	background-color:#db881d;
		
	}
	#buyBox{
		width:90vw;
		height: 72vh;
	}
	#buyTitle{
		color:black;
		font-size: 20px;
		font-weight: bold;
		width: 40vw;
		border:1px solid black;
		border-width: 0px 0px 2px 0px;
		padding: 10px;
		margin-left: 40px;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	#buyTitleMenu{
		color:black;
		width:90vw;
		display:flex
	}
	#buyTitleMenu > span{
		display:block;
		margin-left:40px;
		margin-right:220px;
		width: 50px;
	}
	#totalPrice{
		margin-left:232px;
	}
</style>
<script src="make_game_page/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(
		function(){
			showBuyList();
			//고른 게임의 리스트를 보여주는 함수
		}
	);
	
	var showBuyList = function(){
		
		
		var userName = '<%= strUserName %>';
		var strHTML = "";
		var G_PRICE_ALL = 0
		
		var obj = $.parseJSON('${data}');
		
		var buyLists = obj["GAMEBUYLISTS"]
		
		strHTML += '<div id="buyBox">';
		strHTML += '<div id="buyTitle">';
		strHTML += '<span>'+ userName +'님의 장바구니<span/>';
		strHTML += '</div>';
		strHTML += '<div id="buyTitleMenu">';
		strHTML += '<span>게임명</span>';
		strHTML += '<span>금액<span>';
		strHTML += '</div>';
		
		
		strHTML += '<form action="../GS_BuyGames" method="post" id="buyGame">'
		for(var i=0; i<buyLists.length; i++){
			
			var buyList = buyLists[i];	
			
		    var G_NAME = buyList["G_NAME"];
            var G_SALES_PRICE = buyList["G_SALES_PRICE"];
            G_PRICE_ALL = buyList["G_PRICE_ALL"];
			
            strHTML += '<div class="lists" id="lists'+ i +'" onclick="">';
            strHTML += '<span ><input type="text" name="GName" class="GListInput" value="' + G_NAME + '" readonly/></span>';
            strHTML += '<span><input type="text" name="GSalesPrice" class="GListInput" value="' + G_SALES_PRICE + '" readonly/></span>';
            strHTML += '</div>';
		}
		 strHTML += '<div id="totalPrice">';
		 strHTML += '<span ><input type="text" name="GSTotalPrice" class="GListInput" style="text-align:right;" value="합계 금액 : ' + G_PRICE_ALL + '" readonly/></span>';
		 strHTML += '</div>';
		 strHTML += '<div id="Buybutton">';
         strHTML += '<input type="button" value="구매하기" onclick=""/>'
         strHTML += '<input type="button" value="돌아가기" onclick="location.href=&quot;./make_game_page/gameBuy.jsp&quot;"/>'
         strHTML += '</div>';
		 strHTML += '</form>'
		 strHTML += '</div>';
         strHTML += '</div>';
	     $("#contentList").html(strHTML);
		 
	};
	
var logout =function(){
		//로그아웃함수
		$("#logoutForm").submit();
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
				<%if(strUserName == null){
					response.sendRedirect("./gameBuy.jsp");
				%>
				<%}else{ %>
				<form action="GS_Logout" method="post" id="logoutForm">
					<span><%=strUserName%>님 환영합니다</span>
					<input type="button" id="logout_btn" value="Logout" onclick="logout();"/>
				</form>
				<% } %>
			</div>
		</div>
		<div id="body">
			<div id="menuList">
				<div onclick="location.href='./make_game_page/gameBuy.jsp'">게임</div>
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