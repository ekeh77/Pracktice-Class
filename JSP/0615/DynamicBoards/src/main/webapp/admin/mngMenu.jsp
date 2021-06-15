<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자모드 - 메뉴관리</title>
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
	var httpRequest2 = null;
	var httpRequest3 = null;
	var httpRequest4 = null;
	
	/*
	var Board = function(a,b){
		
		 this.a = a;
		 this.b = b;
			
	     var save = function(){
	    	 
	     }
	}
	*/
	
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
		
		for(var i = 0; i < menuCount; i++){
			
			menuID = menuTags[i].childNodes[0].childNodes[0].nodeValue;
			menuName = menuTags[i].childNodes[1].childNodes[0].nodeValue;
			
			/*
			strHTML +="<div>"
			strHTML +="<span style='width:50px;'><input type='checkbox' name='checkOne' onclick='clickOne(this);'/></span>"
			strHTML +="<span style='width:120px;'>" + menuID + "</span>"
			strHTML +="<span style='width:480px;'>" + menuName + "</span>"
			strHTML +="<span style='width:100px;'><a href='javascript:setDel(&quot;" + menuID + "&quot;)'>삭제</a></span>"
			strHTML +="</div>"
			*/
				
			strHTML +="<div>"
			strHTML +="<span style='width:50px;'><input type='checkbox' name='checkOne' onclick='clickOne(this);'/></span>"
			strHTML +="<span style='width:120px;'><input type='text' name='menuID' class='txtBox1' value='" + menuID + "' readonly='true'/></span>"
			strHTML +="<span style='width:480px;'><input type='text' name='menuName' class='txtBox2' value='" + menuName + "' onchange='chg(" + i + ")'/></span>"
			strHTML +="<span style='width:100px;'><a href='javascript:setDel(&quot;" + menuID + "&quot;)'>삭제</a></span>"
			strHTML +="</div>"
			
		}
	
		document.getElementById("menuList").innerHTML = strHTML;
		
	}
	function setDel(menuID){
		
		httpRequest2 = getHttpRequest();
		
		//server에 있는 list.jsp를 호출
		httpRequest2.onreadystatechange = getList;
		httpRequest2.open("GET","./ajax/delMenu.jsp?menuID=" + menuID ,true);
		httpRequest2.send(null);
		
	}
	
	function addMenu(){
		
		var strHTML = "";
		
		strHTML +="<div>"
		strHTML +="<span style='width:50px;'></span>"
		strHTML +="<span style='width:120px;'><input style='width:110px;' type='text' name='menuID'/></span>"
		strHTML +="<span style='width:480px;'><input style='width:460px;' type='text'name='menuName'/></span>"
		strHTML +="<span style='width:100px;'></span>"
		strHTML +="</div>"
		
		document.getElementById("menuList").innerHTML += strHTML;
	}
	
	function menuSave(){
		var  menuIDs = document.getElementsByName("menuID");
		var  menuNames = document.getElementsByName("menuName");
		var strParams = "";
		for(var i=0; i<menuIDs.length; i++){
			
			strParams += "&menuID=" + menuIDs[i].value;
			strParams += "&menuName=" + menuNames[i].value;
			
		}
		
		strParams = strParams.substr(1);
		
		httpRequest3 = getHttpRequest();
		
		httpRequest.onreadystatechange = afterSave;
		httpRequest.open("GET","./ajax/saveMenus.jsp?" + strParams ,true);
		httpRequest.send(null);
		
	}
	
	function afterSave(){
		
		if (httpRequest.readyState == 4) 
		{ 
			if (httpRequest.status == 200) 
			{ 
				//alert(httpRequest.responseText);
				//var datas = httpRequest.responseXML;
				//setList(datas);
				
				var result = httpRequest.responseText
				
				if(result.trim() == "Y"){
					
					getList();
					
				}
				else{
					
					alert(result)
					
				}
				
			} 
			else { alert("실패: " + httpRequest.status); }
		}
		
	}
	
	function clickOne(obj){
		
		var getbox = document.getElementsByName("checkOne");
		
		for(var i=0; i<getbox.length; i++){
			getbox[i].checked = false;
		}
		
		obj.checked = true;
		
	}
	
	/*
	function onlyChk(i){
		
		var chkObj = docuemnt.getElementsByName("chk");
		//내가 체크한것만 checked = true, 나머지는 checked = false;
		//일단 전부다 checked = false;
		for(var j=0; j<chkObj.length; j++){
			chkObj[j].checked = false;
		}
		
		chkObj[i].checked = true;
		
	}
	*/
	
	function menuMod(){
		
		var getbox = document.getElementsByName("checkOne");
		var chkNumber = 0;	
		
		for(var j=0; j<getbox.length; j++){
			
			if(getbox[j].checked){
				
				chkNumber = j;
				
			}
		}	
		
		var objMenuIDs = document.getElementsByName("menuID");
		var objMenuNames = document.getElementsByName("menuName");
		
		var chkMenuID = objMenuIDs[chkNumber].value;
		var chkMenuName = objMenuNames[chkNumber].value;
		
		httpRequest4 = getHttpRequest();
		
		var strParams = "menuID=" + chkMenuID + "&menuName=" + chkMenuName;
		
		httpRequest4.onreadystatechange = afterMod;
		httpRequest4.open("GET","./ajax/modMenus.jsp?" + strParams ,true);
		httpRequest4.send(null);
		
		function afterMod(){
			
			if (httpRequest4.readyState == 4) 
			{ 
				if (httpRequest4.status == 200) 
				{ 
					getList();
					
				} 
				else { alert("실패: " + httpRequest.status); }
			}
			
		}
		
	}
	
	function chg(i){
		
		var getbox = document.getElementsByName("checkOne");
		
		getbox[i].checked = true;
		
		menuMod();
	}
</script>
</head>
<body onload="getList()">
	<div id="wrap">
		<div id="buttons">
			<input type="button" value="메뉴추가" onclick="addMenu();"/>
			<!-- <input type="button" value="리스트보기" onclick="getList()"/> -->
			<input type="button" value="저장" onclick="menuSave();"/>
			<input type="button" value="수정" onclick="menuMod();"/>
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