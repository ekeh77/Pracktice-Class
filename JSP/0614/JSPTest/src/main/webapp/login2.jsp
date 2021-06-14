<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function goDB(){
		var obj = document.getElementById("id");
		var obj2 = document.getElementById("pass");
		
		
		if(obj.value == ""){
			alert("아이디를적어주세요");
			return
		}
		if(obj2.value == ""){
			alert("비밀번호를적어주세요");
			return
		}
		
		document.getElementById("form").submit();
	}
</script>
</head>
<body>
	<form id="form" action="./DB2.jsp" method="post">
		<input type="text" id="id" name="id"/>
		<input type="text" id="pass" name="pass"/>
		<span onclick="goDB()">확인<span>
	</form>
</body>
</html>