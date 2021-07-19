<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	function goList(){
		location.href="/Test/goList"
	}
	function goWrite(){
		location.href="/Test/goWrite"
	}
</script>
<style>
	div > span{
		display:block;
		border:1px solid #777;
		width: 100px;
		height: 50px;
		float: left;
	}
</style>
</head>
<body>
	<div>
		<span onclick="goList();">리스트로가기</span>
	</div>
	<div>
		<span onclick="goWrite();">글쓰기</span>
	</div>
</body>
</html>