<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function goUpdateOk(){
		document.getElementById("goList").submit();
	}
</script>
</head>
<body>
	<form id="goList" action="./updateOk.jsp" method="post">
		<input type="text" id="number" name="number"/>
		<input type="text" id="text" name="text"/>
		<span onclick="goUpdateOk()">확인</span>
	</form>
</body>
</html>