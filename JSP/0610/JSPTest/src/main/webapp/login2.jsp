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
			alert("���̵������ּ���");
			return
		}
		if(obj2.value == ""){
			alert("��й�ȣ�������ּ���");
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
		<span onclick="goDB()">Ȯ��<span>
	</form>
</body>
</html>