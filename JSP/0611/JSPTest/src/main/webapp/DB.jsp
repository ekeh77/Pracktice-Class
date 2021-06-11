<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="con" class="PKG_DBCon.DBCon" scope="page"/>
<jsp:useBean id="stmt" class="PKG_DBCon.DBStatement" scope="page"/>
	<%  
	
		String MID = request.getParameter("id");
		String MPass = request.getParameter("pass");
		ResultSet rs = null;
		ResultSet rs2 = null;
		String SF = "";
		con.setUrl("jdbc:oracle:thin:@localhost:1525:xe");
		con.setUserId("dopractice");
		con.setUserPass("1");
		
		Connection cons = con.getConnection();
		
		String strSql = "SELECT COUNT(*) AS COUNT FROM G_MEMBERS WHERE MID = '" + MID + "' AND MAGE = '" + MPass + "'";
		String strSql2 = "SELECT * FROM G_MEMBERS WHERE MID = '" + MID + "' AND MAGE = '" + MPass + "'";
		
		stmt.setStrSql(strSql);
		
		rs = stmt.getStatement(cons); 
		
		rs.next();
		
	 	String member = rs.getString("COUNT");
		
	 	stmt.setStrSql(strSql2);
	 	
	 	rs2 = stmt.getStatement(cons);
	 	
	 	rs2.next();
	 	
	 	System.out.println(rs2.getString("MID"));
	 	
	 	if(Integer.parseInt(member) == 1){
	 		
	 	}
	 	else{
	 		response.sendRedirect("./login.jsp");
	 	}
	 	
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>자바스크립트</title>
</head>
<body onload ="gogo()">
	<form id="goForm" action="./index.jsp" method="post">
		<input type="hidden"  name="Count" value="<%=member%> "/>
		<input type="hidden"  name="Name" value="<%=rs2.getString("MNAME")%>"/>
	</form>
</body>
<script>
	function gogo(){
		document.getElementById("goForm").submit();
	}
</script>
</html>
<% rs.close();
%>