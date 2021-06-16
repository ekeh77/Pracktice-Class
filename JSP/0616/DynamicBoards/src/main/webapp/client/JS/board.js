/**
 * 
 */

	var httpRequest = null;
	var httpRequest2 = null;
	var selectedMenuID = "";
	
	function getHttpRequest(){
		
		//내장객체
		return new XMLHttpRequest();
		
	}
	
	function getMenus(selectedMenuIDs){
		selectedMenuID = selectedMenuIDs;
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
		
		getBoardList(selectedMenuID);
		
	};
	
	function getBoardList(selectedMenuID){
		
		httpRequest2 = getHttpRequest();
		getMenuID = selectedMenuID;
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
		
		var titles = datas.getElementsByTagName("title");
		
		var idxs = datas.getElementsByTagName("idx");
				
		var strHTML = "";
		
		strHTML +=	"<div class='row'>"
		strHTML += "<span>글번호</span>"
		strHTML += "<span>글제목</span>"
		strHTML +=	"</div>"
		
		for(var i=0; i<bnums.length; i++){
			
			var bnum = bnums[i].childNodes[0].nodeValue
			var title = titles[i].childNodes[0].nodeValue
			var idx = idxs[i].childNodes[0].nodeValue
			
			var param = "?idx=" + idx + "&menuid=" + getMenuID;
			
			strHTML +=	"<div class='row' style='clear:both;'>"
			strHTML += "<div class='row'>"
			strHTML += "<span>" + bnum + "</span>"
			//strHTML += "<span><a href='javascript:goRead(&quot;" + bnums[i].childNodes[0].nodeValue + "&quot;);'>" + titles[i].childNodes[0].nodeValue + "</a></span>"
			strHTML += "<span><a href='content.jsp" + param + "'>" + title + "</a></span>"
			strHTML += "</div>"
		}
		
		document.getElementById("bBody").innerHTML = strHTML;
		
	}