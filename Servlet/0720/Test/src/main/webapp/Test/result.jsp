<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String getId = (String)request.getAttribute("ID");
	String getPass = (String)request.getAttribute("PASS");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%=getId %>
	<%=getPass %>
</body>
</html>