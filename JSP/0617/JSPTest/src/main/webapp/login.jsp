<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function submitBtn(){
		document.getElementById("form").submit();
	}
</script>
</head>
<body>

	<form id="form" action="./DB.jsp" method="post">
		<div>
			<input type="text" id="id" name="id" />
			<input type="text" id="pass" name="pass" />
			<span onclick="submitBtn()">확인</span>
		</div>
	</form>
	
</body>
</html>