<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>   
 
<%
	String strTitle = (String)request.getAttribute("title");
	String[] strTitles = (String[])request.getAttribute("row1");
	String[] strTitles2 = (String[])request.getAttribute("row2");
	
	ArrayList arr = (ArrayList)request.getAttribute("rows");
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
		for(int i = 0; i<arr.size();i++){
			String[] strs = (String[])arr.get(i);
			
			for(int j = 0; j<strs.length; j++){
				out.print(strs[j]);
			}
		}
	%>
</body>
</html>