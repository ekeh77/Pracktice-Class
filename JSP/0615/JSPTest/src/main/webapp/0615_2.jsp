<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.mList{
		
	}
	.mList div{
		clear:both;
	}
	.mList span{
		display:block;
		height:30px;
		border:1px solid #888888;
		float:left;
		padding:7px 0px 0px 0px;
		text-align:center;
	}
	.txtBox1 {
		width:100px;
		border-width:0px;
		text-align:center;
	}
	.txtBox2 {
		width:470px;
		border-width:0px;
		text-align:center;
	}
</style>
<script>
var httpRequest = null;

var Board = function(){
	
	this.httpRequest = new XMLHttpRequest();
	
	function getList(){
		
		httpRequest.onreadystatechange = callback;
		httpRequest.open("POST","./ajax/mngMenus.jsp",true);
		httpRequest.send(null);
		
	}
	
	function callback()
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
		
		var menuTags = datas.getElementsByTagName("menu");
		
		var menuCount = menuTags.length
			
		var menuID = "";
		var menuName = "";
		var strHTML = "";
		
		for(var i = 0; i < menuCount; i++){
			
			menuID = menuTags[i].childNodes[0].childNodes[0].nodeValue;
			menuName = menuTags[i].childNodes[1].childNodes[0].nodeValue;

			strHTML +="<div>"
			strHTML +="<span style='width:50px;'><input type='checkbox' name='checkOne' onclick='clickOne(this);'/></span>"
			strHTML +="<span style='width:120px;'><input type='text' name='menuID' class='txtBox1' value='" + menuID + "' readonly='true'/></span>"
			strHTML +="<span style='width:480px;'><input type='text' name='menuName' class='txtBox2' value='" + menuName + "' onchange='chg(" + i + ")'/></span>"
			strHTML +="<span style='width:100px;'><a href='javascript:setDel(&quot;" + menuID + "&quot;)'>삭제</a></span>"
			strHTML +="</div>"
			
		}

		document.getElementById("menuList").innerHTML = strHTML;
		
	}
}


	
</script>
</head>
<body onload="Board.getList();">
	<div id="wrap">
		<div id="buttons">
			<input type="button" value="메뉴추가" onclick=""/>
			<!-- <input type="button" value="리스트보기" onclick="getList()"/> -->
			<input type="button" value="저장" onclick=""/>
			<input type="button" value="수정" onclick=""/>
		</div>
		<div class="mList">
			<span style='width:50px;'></span>
			<span style='width:120px;'>메뉴아이디</span>
			<span style='width:480px;'>메뉴이름</span>
			<span style='width:100px;'></span>
		</div>
		<div class="mList" id="menuList">
			
		</div>
	</div>
</body>
</html>