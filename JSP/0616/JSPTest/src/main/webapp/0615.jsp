<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		clear:both;
	}
	span{
		border:1px solid #777;
		display:block;
		float:left;
		width:100px;
	}
</style>
<script>
	
var httpRequest = null;

function getHttpRequest(){
	
	httpRequest = new XMLHttpRequest();
	
}

function getList(){
	
	getHttpRequest();

	httpRequest.onreadystatechange = callback;
	httpRequest.open("POST","./PList.jsp",true);
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
	
	var menuTag = datas.getElementsByTagName("menu"); 
	var strHTML = "";
	
	var proName = "";
	var proCom  = "";
	var proAvg  = "";
	var proVol  = "";
	var proPoint  = "";
	
	
	for(var i=0; i<menuTag.length; i++){
		
		proName = menuTag[i].childNodes[0].childNodes[0].nodeValue;
		proCom = menuTag[i].childNodes[1].childNodes[0].nodeValue;
		proAvg = menuTag[i].childNodes[2].childNodes[0].nodeValue;
		proVol = menuTag[i].childNodes[3].childNodes[0].nodeValue;
		proPoint = menuTag[i].childNodes[4].childNodes[0].nodeValue;
		
		strHTML += "<div>"
		strHTML += "<span><input type='checkbox' name='chk'/>　</span>"
		strHTML += "<span name='proName'>" + proName + "</span>"
		strHTML += "<span>" + proCom + "</span>"
		strHTML += "<span>" + proAvg + "</span>"
		strHTML += "<span>" + proVol + "</span>"
		strHTML += "<span>" + proPoint + "</span>"
		strHTML += "</div>"
		
	}
	
	document.getElementById("showList").innerHTML = strHTML;
}

var startNum = 0;


function buyPro(){
	
	var getCheck = document.getElementsByName("chk");
	var getProName = document.getElementsByName("proName");
	var buyCheck = document.getElementsByName("buyThing");
	var buyNum = document.getElementsByName("buyNum");
	
	var strHTML = "";
	
	
	
	for(var i=0; i<getCheck.length; i++){
		
		if(getCheck[i].checked){
				strHTML += getProName[i].innerHTML + ",";	
		}
	}
	
	strHTMLs = strHTML.split(",")
	var finalHTML = "";
	countHTML = strHTMLs.length;
	
	
	if(startNum == 0)
		
	for(var k=0; k<countHTML-1; k++){
		finalHTML += "<div>";
		finalHTML += "<span id='proName' name='buyThing'>" + strHTMLs[k] + "</span>";
		finalHTML += "<span id='proCount'name='buyNum' >1</span>";
		finalHTML += "</div>";
		
		startNum += 1;
	}
	
	for(var j=0; j<buyCheck.length; j++){
		
		for(var l=0; l<countHTML-1; l++){
			if(buyCheck[j].innerHTML.trim() == strHTMLs[l].trim()){
				
				buyNum[j].innerHTML = Number(buyNum[j].innerHTML) + 1;
								
			}
			else{
				
				finalHTML += "<div>";
				finalHTML += "<span id='proName' name='buyThing'>" + strHTMLs[l] + "</span>";
				finalHTML += "<span id='proCount'name='buyNum' >1</span>";
				finalHTML += "</div>";
				
				
			}
		}
	}
	
	document.getElementById("whatBuy").innerHTML += finalHTML;
	
	
}

</script>
</head>
<body onload="getList();">
	<div>
		<input type="button" value="장바구니로" onclick="buyPro();"/>
	</div>
	<div>
			<span> </span>
			<span>상품명</span>
			<span>제조사</span>
			<span>가격</span>
			<span>용량</span>
			<span>포인트</span>
	</div>
	<div id="showList">
	
	</div>
	<div>
		<div>
			<span>장바구니</span>
			<span>　</span>
		</div>
		<div id="whatBuy">
			
		</div>
	</div>
</body>
</html>