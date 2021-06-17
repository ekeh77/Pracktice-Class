<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		width:900px;
		height:20px;
		clear:both;
		border:1px solid #444;
		border-width: 1px 1px 0px 1px;
	}
	div:last-child{
		border-width: 1px 1px 1px 1px;
	}
	div span{
		display:block;
		float:left;
		height:20px;
	}
	div span:nth-child(2){
		width:100px;
	}
	div span:nth-child(1){
		width:600px;
		color:blue;
		
	}
	div span:nth-child(3){
		width:100px;
	}
	div span:nth-child(4){
		width:100px;
	}
</style>
<script>
	var httpRequest = null;
	
	function getHttpRequest(){
		
		httpRequest = new XMLHttpRequest();
		
	}
	
	function getList(){
		msg = "무야호!"
		getHttpRequest();
		
		httpRequest.onreadystatechange = callback;
		httpRequest.open("GET","./XML.jsp?msg=" + msg,true);
		
		httpRequest.send(null);
		
	}
	
	function callback(){
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){
				var datas = httpRequest.responseXML;
				setList(datas);
			}
			else{
				alert("실패:" + httpRequest.status);
			}
		}
		
	}
	
	function setList(datas){
		
		var boards = datas.getElementsByTagName("row");
		
		var strHTML = "";
		
		for(var i=0; i<boards.length; i++){
			strHTML += "<div>"
			strHTML += "<span>" + boards[i].childNodes[0].childNodes[0].nodeValue + "</span>"
			strHTML += "<span>" + boards[i].childNodes[1].childNodes[0].nodeValue + "</span>"
			strHTML += "<span>" + boards[i].childNodes[2].childNodes[0].nodeValue + "</span>"
			strHTML += "<span>" + boards[i].childNodes[3].childNodes[0].nodeValue + "</span>"
			strHTML += "</div>"
			
		}
		
		
		document.getElementById("list").innerHTML = strHTML;
		console.log(strHTML);
	}
</script>
</head>
<body onload="getList();">
	<div id="list">
		
	</div>
</body>
</html>