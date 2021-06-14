<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

div{

	width:100px;
	height:20px;
	padding:5px;
	border: 1px solid blue;
	
}

</style>
<script>

	function a(num){
		
		alert(num)
		
	}
	
</script>
</head>
<body>
	<%="어서오세요" %>
	
	<a href="www.naver.com">네이버</a>
	
	<% 
		int result = 0;
		for(int i=1; i<=100; i++){
			if(i==2)
				continue;
	%>
	
	<div style="font-size:20px;color:red" onclick="a(<%= i %>);"><%= i %></div>
	
	<% 
		} 
	%>
	
</body>
</html>