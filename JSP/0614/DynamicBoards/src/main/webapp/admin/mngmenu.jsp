<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자모드 - 메뉴관리</title>
<style>
	#mList{
		
	}
	#mList div{
		clear:both;
	}
	#mList span{
		display:block;
		height:30px;
		border:1px solid #888888;
		float:left;
		padding:7px 0px 0px 0px;
		text-align:center;
	}
</style>
<script>
	var httpRequest = null;
	var httpRequest2 = null;
	
	
	function getHttpRequest(){
		
		//내장객체
		return new XMLHttpRequest();
		
	}
	
	function getList(){
		
		httpRequest = getHttpRequest();
		
		//server에 있는 list.jsp를 호출
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
		
		strHTML +="<div>"
		strHTML +="<span style='width:120px;'>메뉴아이디</span>"
		strHTML +="<span style='width:480px;'>메뉴이름</span>"
		strHTML +="<span style='width:100px;'></span>"
		strHTML +="</div>"
		
		for(var i = 0; i < menuCount; i++){
			
			menuID = menuTags[i].childNodes[0].childNodes[0].nodeValue;
			menuName = menuTags[i].childNodes[1].childNodes[0].nodeValue;
			
			strHTML +="<div>"
			strHTML +="<span style='width:120px;'>" + menuID + "</span>"
			strHTML +="<span style='width:480px;'>" + menuName + "</span>"
			strHTML +="<span style='width:100px;'><a href='javascript:setDel(&quot;" + menuID + "&quot;)'>삭제</a></span>"
			strHTML +="</div>"
				
				
		}
	
		document.getElementById("mList").innerHTML = strHTML;
		
	}
	function setDel(menuID){
		
		httpRequest2 = getHttpRequest();
		
		//server에 있는 list.jsp를 호출
		httpRequest2.onreadystatechange = getList;
		httpRequest2.open("GET","./ajax/delMenu.jsp?menuID=" + menuID ,true);
		httpRequest2.send(null);
		
	}
</script>
</head>
<body>
	<div id="wrap">
		<div id="buttons">
			<input type="button" value="리스트보기" onclick="getList()"/>
		</div>
		<div id="mList">
			<div>
				<span style="width:120px;">메뉴아이디</span>
				<span style="width:480px;">메뉴이름</span>
				<span style="width:100px;"></span>
			</div>
		</div>
	</div>
</body>
</html>