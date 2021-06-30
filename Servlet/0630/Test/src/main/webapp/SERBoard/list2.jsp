<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String strTitle = (String)request.getAttribute("title");
	String[] strTitles = (String[])request.getAttribute("row1");
	String[] strTitles2 = (String[])request.getAttribute("row2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%=strTitle%>
	<%
		for(int i = 0; i<strTitles.length; i++){
			out.print(strTitles[i] + "<br/>");
		}
		for(int i = 0; i<strTitles2.length; i++){
		out.print(strTitles2[i] + "<br/>");
		}
	%>
</body>
</html>