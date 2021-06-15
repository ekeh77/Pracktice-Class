<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#menus{
		width:1200px;
		clear:both;
	}
	
	#menus span{
		display:block;
		width:120px;
		border:1px solid #888888;
		float:left;
		padding:8px 0px 8px 0px;
		text-align:center;
	}
	
	#boards{
		width:1200px;
		height:600px;
		border:1px solid #999999;
		padding:20px;
		clear:both;
	}
	
	#boards span{
		display:block;
		width:100px;
		border:1px solid #888888;
		float:left;
		padding:6px 0px 6px 0px;
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
	
	function getMenus(){
		
		httpRequest = getHttpRequest();
		
		//server에 있는 list.jsp를 호출
		httpRequest.onreadystatechange = menuList;
		httpRequest.open("POST","./ajax/getMenus.jsp",true);
		httpRequest.send(null);
		
	}
	
	function menuList(){
		if (httpRequest.readyState == 4) 
		{ 
			if (httpRequest.status == 200) 
			{ 
				var datas = httpRequest.responseXML;
				setMenus(datas);
				
			} 
			else { alert("실패: " + httpRequest.status); }
		}
	}
	
	var setMenus = function(datas){
		
		var menuIDs = datas.getElementsByTagName("menuid");
		var menuNames = datas.getElementsByTagName("menuname");
		
		var strHTML = "";
		
		for(var i=0; i<menuIDs.length; i++){
			strHTML += "<a href='javascript:getBoardList(&quot;" + menuIDs[i].childNodes[0].nodeValue + "&quot;);'>";
			strHTML += "<span>";
			strHTML += menuNames[i].childNodes[0].nodeValue;
			strHTML += "</span>";
			strHTML += "</a>";
		}
		
		document.getElementById("menus").innerHTML = strHTML;
		
	};
	
	function getBoardList(selectedMenuID){
		
		httpRequest2 = getHttpRequest();
		
		//server에 있는 list.jsp를 호출
		httpRequest2.onreadystatechange = boardList;
		httpRequest2.open("POST","./ajax/getBoardList.jsp?menuid=" + selectedMenuID,true);
		httpRequest2.send(null);
		
	}
	
	function boardList(){
		if (httpRequest2.readyState == 4) 
		{ 
			if (httpRequest2.status == 200) 
			{ 
				var datas = httpRequest2.responseXML;
				setBoards(datas);
				
			} 
			else { alert("실패: " + httpRequest2.status); }
		}
	}
	
	function setBoards(datas){
		
		var bnums = datas.getElementsByTagName("bnum");
		
		console.log(bnums)
		var titles = datas.getElementsByTagName("title");
		
		var strHTML = "";
		
		strHTML +=	"<div class='row'>"
		strHTML += "<span>글번호</span>"
		strHTML += "<span>글제목</span>"
		strHTML +=	"</div>"
		
		for(var i=0; i<bnums.length; i++){
			strHTML +=	"<div class='row' style='clear:both;'>"
			strHTML += "<div class='row'>"
			strHTML += "<span>" + bnums[i].childNodes[0].nodeValue + "</span>"
			strHTML += "<span>" + titles[i].childNodes[0].nodeValue + "</span>"
			strHTML += "</div>"
		}
		
		document.getElementById("boards").innerHTML = strHTML;
		
	}
</script>
</head>
<body onload="getMenus();">
	<div id="wrap">
		<div id="menus">
			
		</div>
		<div id="boards">
			
		</div>
	</div>
</body>
</html>