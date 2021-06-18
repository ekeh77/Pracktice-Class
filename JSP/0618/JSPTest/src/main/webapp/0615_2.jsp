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

var Board = function(){
	
	var httpRequest = null
	
	this.getList = function(){
		
		httpRequest = new XMLHttpRequest();
		
		httpRequest.onreadystatechange = callback;
		httpRequest.open("POST","./test3.jsp",true);
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
		
		var dName = datas.getElementsByTagName("dName");
		var dTel = datas.getElementsByTagName("dTel");
		
		var strHTML = "";
		
		for(var i=0; i<dName.length; i++){
			
			strHTML += "<div>";
			strHTML += "<span>";
			strHTML += dName[i].childNodes[0].nodeValue;
			strHTML += "</span>";
			strHTML += "<span>";
			strHTML += dTel[i].childNodes[0].nodeValue;
			strHTML += "</span>";
			strHTML += "</div>";
		}
		
		document.getElementById("wrap").innerHTML = strHTML;
	}
}

var boradExe = function(){
	
	this.Board1 = new Board;
	
	Board1.getList();
}

</script>
</head>
<body onload="boradExe();">
	<div id="wrap">
			
	</div>
</body>
</html>