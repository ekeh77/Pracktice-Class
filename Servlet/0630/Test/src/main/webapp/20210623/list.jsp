<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="PKG_20210623DAO.listDAO" %>
<%
	ArrayList<listDAO> arr = (ArrayList<listDAO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#list{
		border:1px solid #777;
		width: 500px;
		height: 50px;
	}
</style>
</head>
<body>

		<%
			for(int i=0; i<arr.size(); i++){
				
				listDAO row = arr.get(i);
				String gid = row.getG_ID();
				String gname = row.getG_NAME();
				
		%>
		<div id="list">
			<span><%=gid%></span>
			<span><%=gname%></span>
			<input type="button" value="삭제"/>
		</div>
		<%
			}
		%>

</body>
</html>