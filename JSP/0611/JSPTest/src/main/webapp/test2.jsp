<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#hi{
		width:200px;
		height:200px;
		border:1px solid blue;
	}
</style>
<script>
	function test(){
		var cx = event.clientX;
		var cy = event.clientY;
		
		var obj = document.getElementById("hi")
		obj.innerHTML = obj.style.width;
		obj.style.width = 200 + cx + "px";
		if(cx>450){
			obj.style = "background-color:red"
		}
		if(obj.style.width >= "500px"){
			obj.style.color = "orange"
		}
		else{
			obj.style.color = "green"
		}
	}
</script>
</head>
<body onmousemove="test()">
	<div id="hi">테스트용</div>
</body>
</html>