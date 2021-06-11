<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function b(){
		var val = document.getElementsByName("hobby").value;
		
		alert(val[0]);
	}
	function c(){
		var val = document.getElementById("sel").value;
		alert(val);
	}
	function a(){
		var txtLength = document.getElementById("a").value.length;
		document.getElementById("msg").innerHTML = txtLength;
	}
	function i(){
		var txtLength = document.getElementById("i").value.length;
		document.getElementById("msg").innerHTML = txtLength;
	}
	function j(){
		var txtLength = document.getElementById("j").value.length;
		document.getElementById("msg").innerHTML = txtLength;
	}
</script>
</head>
<body>
	<div id="msg" style="font-size:25px; width:500px; height:50px; border:1px solid red;"></div>
	<div>
		<input type="checkbox" name="hobby" value="1" onchange="b();"/>먹기
		<input type="checkbox" name="hobby" value="2" />자기
		<input type="checkbox" name="hobby" value="3" />놀기
	</div>
	<div>
		<select id="sel" onchange="c()">
			<option value="">선택하세요</option>
			<option value="10">10대</option>
			<option value="20">20대</option>
			<option value="30">30대</option>
		</select>
	</div>
	<div>
		<input type="text" id="a" onkeydown="a();"/>
		<input type="text" id="i" onkeyup="i();"/>
		<input type="text" id="j" onkeypress="j();"/>
	</div>
	
</body>
</html>