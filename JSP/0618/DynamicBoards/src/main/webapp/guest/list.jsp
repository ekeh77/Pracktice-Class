<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
<%
	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
	DBConn.setDBInfo(dbInfos);
	
	String strSql = "SELECT GID,GTITLE FROM GUEST ORDER BY GID DESC";
	
	ResultSet rs = DBConn.getResultSet(strSql);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="600" cellpadding="0" cellspacing="0" align="center" border="1">
		<tr>
			<td width="100" align="center" height="30">
				아이디
			</td>
			<td width="500" align="center" height="30">
				제목
			</td>
		</tr>
		<%
		while(rs.next()){
		%>
		<tr>
			<td width="100" align="center" height="30">
				<%=rs.getString("GID") %>
			</td>
			<td width="500" align="center" height="30">
				<a href="./content.jsp?gid=<%=rs.getString("GID") %>"><%=rs.getString("GTITLE") %></a>
			</td>
		</tr>
		<%}%>
	</table>
</body>
</html>