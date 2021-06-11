<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#move{
		width:50px;
		height:50px;
		border:1px solid blue;
		z-index:9999;
	}
	#inside{
		position:absolute;
		top:400px;
		left: 200px;
		width:200px;
		height:200px;
		border:1px solid orange;
	}
</style>
<script>
	var num = 0;

	function getdiv(){
		var obj = document.getElementById("inside");
		var cx = event.clientX;
		num += 1;
		var obj2 = document.getElementById("move");
		var obj2Value = obj2.innerHTML;
		if(((obj2.style.left).substring(0,3) >= "200px" && (obj2.style.left).substring(0,3) <= "350px") && ((obj.style.top).substring(0,3) >= "400px" && (obj.style.top).substring(0,3) <= "550px")){
			obj.innerHTML = obj2Value
		}

	}
	function movediv(){
			var cx = event.clientX;
			var cy = event.clientY;
			
			if(num%2 == 1){
				
				var obj = document.getElementById("move");
				var objValue = obj.innerHTML;
				obj.style = "position:absolute;top:" + (cy-20) +"px;left:" + (cx-20) +"px;";
			}
			if(((cx-20) >= 200 && (cx-20) <= 350) && ((cy-20) >= 400 && (cy-20) <= 550)){
				var obj2 = document.getElementById("inside");
				obj2.innerHTML = objValue;
			}
			else{
				var obj2 = document.getElementById("inside");
				obj2.innerHTML = "나갔다";
			}

	}
	
</script>
</head>
<body >
	
	<div id="inside"></div>
	<div id="move" onmousedown="getdiv();" onmousemove="movediv();">M001</div>
</body>
</html>