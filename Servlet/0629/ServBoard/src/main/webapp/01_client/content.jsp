<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="PKG_DAO.listDAO" %>
<%
	listDAO content = (listDAO)request.getAttribute("content");
	String strIdx = content.getIdx();
	String strTitle = content.getTitle();
	String strContent = content.getContents();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div>
		<%=strTitle%>
	</div>
	<div>
		<%=strContent%>
	</div>
	<div>
		<a href="/ServBoard/BoardWrite">�۾���</a>
		<a href="/ServBoard/BoardList">����Ʈ</a>
		<a href="/ServBoard/BoardDelete?idx=<%=strIdx%>">����</a>
		<a href="">����</a>
	</div>
</body>
</html>