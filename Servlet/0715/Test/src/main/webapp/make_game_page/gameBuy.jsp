<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	
	#loginBox > span{
		margin-right: 10px;
		font-weight:bold;
	}
	
	#loginBox > input:text{
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
		height: 30px;
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
<script src="../jquery/jquery-3.6.0.min.js"></script>
<script>

	$(document).ready(
		function(){
			showGameList();	
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
				//ajax????????? ?????? ???????????? ????????? data
				
				 var gameLists = data["GAMELISTS"];
                 
				 strHTML += '<div id="GListMenu">';
                 strHTML += '<span >????????????</span>';
                 strHTML += '<span>?????????</span>';
                 strHTML += '<span>?????????</span>';
                 strHTML += '<span>??????</span>';
                 strHTML += '<span>??????</span>';
                 strHTML += '</div>';
				
                 strHTML += '<div id="GList">';
                 
                 for(var i=0;i<gameLists.length;i++){
                    
                    var gameList = gameLists[i];
                    
                    var G_ID = gameList["G_ID"];
                    var G_NAME = gameList["G_NAME"];
                    var G_MAKER = gameList["G_MAKER"];
                    var G_RELEASE = gameList["G_RELEASE"];
                    var G_SALES_PRICE = gameList["G_SALES_PRICE"];
                    var G_GENRE = gameList["G_GENRE"];
                    
                    strHTML += '<div class="lists" id="lists'+ i +'">';
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
                 
                 strHTML += '</div>';
                 strHTML += '<div id="Buybutton">';
                 strHTML += '<input type="button" value="????????????"/>'
                 strHTML += '</div>';
                 $("#contentList").html(strHTML);
			},
			error:function(xhr,status,error){
				//?????? ????????? ??????
				alert("err")
			},
			complete:function(data,textStatus){
				//???????????? ??? ??????
				
			}
		});
		
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
				<span>ID</span><input class="inputText" type="text"/>
				<span>Password</span><input class="inputText" type="password"/>
				<input type="button" id="login_btn" value="Login"/>
			</div>
		</div>
		<div id="body">
			<div id="menuList">
				<div onclick="showGameList();">??????</div>
				<div>????????????</div>
				<div>?????????</div>
				<div>????????????</div>
				<div>????????????</div>
				<div>Game Station ??????</div>
			</div>
			<div id="contentList">
			
			</div>
		</div>
	</div>
</body>
</html>