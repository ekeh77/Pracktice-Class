/**
 * 
 */

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
			//strHTML += "<a href='javascript:getBoardList(&quot;" + menuIDs[i].childNodes[0].nodeValue + "&quot;);'>";
			strHTML += "<a href='./list.jsp?menuID=" + menuIDs[i].childNodes[0].nodeValue + "'>";
			strHTML += "<span>";
			strHTML += menuNames[i].childNodes[0].nodeValue;
			strHTML += "</span>";
			strHTML += "</a>";
		}
		
		document.getElementById("menus").innerHTML = strHTML;
		
		//getBoardList("M001")
		
	};