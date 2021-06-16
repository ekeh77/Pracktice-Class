<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var a = function(){
		this.name = "하이열";
		
		this.b = function(){
			alert("메서드b");
			document.getElementById("a").innerHTML = a.name;
		}
	}
	
	var b = function(){
		alert("함수b");
		this.a = new a();
		a.b();
	}
</script>
</head>
<body>
	<input type="button" value="확인" onclick="b();"/>
	<div id="a"></div>
	<div id="b"></div>
</body>
</html>