<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String strIdx = request.getParameter("idx");
	
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String userID = "C##JavaDB";
		String userPass = "1";
		String url = "jdbc:oracle:thin:@localhost:1525:xe";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String strSql = "SELECT * FROM BOARD WHERE IDX=" + strIdx;
		
		con = DriverManager.getConnection(url, userID, userPass);
		stmt = con.createStatement();
		
		rs = stmt.executeQuery(strSql);
		
		rs.next();
	%>
	
	<table border="1" cellpadding="0" cellspacing="0" width="600" align="center">
		<tr>
			<td width="100" align="center" height="">
				������
			</td>
			<td width="500" align="center" height="">
				<%=rs.getString("TITLE") %>
			</td>
		</tr>
		<tr>
			<td width="100" align="center" height="">
				�۳���
			</td>
			<td width="500" align="center" height="">
				<%=rs.getString("CONTENTS") %>
			</td>
		</tr>
		<tr>
			<td width="100" align="center" height="">
				�ۼ���
			</td>
			<td width="500" align="center" height="">
				<%=rs.getString("MEMID") %>
			</td>
		</tr>
	</table>
	<% 
		rs.close();
		con.close();
	%>
</body>
</html>