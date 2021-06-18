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
	
	 function a(){
		 
		 var obj  = document.getElementsByTagName("gi");
		 alert(obj[0].ggi);
		 
		 
	 } 
	
</script>
</head>
<body onclick = "ar">
	<%="어서오세요" %>
	<div>
		<input type="button" onclick="a();"/>
		<menu>
			<menuid></menuid>
			<menuname></menuname>
		</menu>
	</div>
	
	
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