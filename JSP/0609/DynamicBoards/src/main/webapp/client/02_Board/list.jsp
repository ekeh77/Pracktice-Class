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
		//�����͸� ��������
		
		//DB��������
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String userID = "C##JavaDB";
    	String userPass = "1";
    	String url = "jdbc:oracle:thin:@localhost:1525:xe";
    	
		Class.forName("oracle.jdbc.driver.OracleDriver");
    	
		String strSql = "SELECT * FROM BOARD ORDER BY IDX DESC";
		
    	con = DriverManager.getConnection(url, userID, userPass);
    	stmt = con.createStatement();
    	
    	rs = stmt.executeQuery(strSql);
    	
	%>
	
		<table border="1" cellpadding="0" cellspacing="0" width="900" align="center">
			<tr>
				<td width="700" align="right" colspan="6">
					<a href="./write.jsp">�۾���</a>
				</td>
			</tr>
			<tr>
				<td width="70" align="center">�۹�ȣ</td>
				<td width="330" align="center">������</td>
				<td width="100" align="center">�ۼ���</td>
				<td width="200" align="center">�ۼ���</td>
				<td width="100" align="center"></td>
				<td width="100" align="center"></td>
			</tr>
			<% 
	    		while(rs.next()) {
			%>
			<tr>
				<td width="70" align="center"><%= rs.getString("IDX") %></td>
				<td width="330">
					<a href="./content.jsp?idx=<%= rs.getString("IDX") %>"><%= rs.getString("TITLE") %></a>
				</td>
				<td width="100" align="center"><%= rs.getString("MEMID") %></td>
				<td width="200" align="center"><%= rs.getString("REGDATE") %></td>
				<td width="100" align="center"><a href="./delete.jsp?idx=<%= rs.getString("IDX") %>">����</a></td>
				<td width="100" align="center"><a href="./update.jsp?idx=<%= rs.getString("IDX") %>">����</a></td>
			</tr>
			<% 
	    		}
			
				rs.close();
				con.close();
			%>
		</table>
</body>
</html>