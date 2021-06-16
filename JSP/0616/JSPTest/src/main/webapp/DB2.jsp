<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DB" class="PKG_DBHandler.DBHandler" scope="page"/>
<% 
	String getID = request.getParameter("id");
	String getPass = request.getParameter("pass");
	int alertNum = 0;
	DB.setUrl("jdbc:oracle:thin:@localhost:1525:xe");
	DB.setUserId("dopractice");
	DB.setUserPass("1");
	
	DB.DBCon();
	
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	String strSql = "SELECT COUNT(*) AS COUNT FROM G_MEMBERS WHERE MID = '" + getID + "' AND MAGE = '" +  getPass + "'";
	
	
	
	rs = DB.getResultSet(strSql);
	
	rs.next();
	
	String countLogin = rs.getString("COUNT");
	
	
	if(countLogin.equals("1")){
		alertNum = 1;
		
		strSql = "SELECT * FROM G_MEMBERS WHERE MID = '" + getID + "' AND MAGE = '" +  getPass + "'";
		
		rs = DB.getResultSet(strSql);
		
		rs.next();
		
		String strSql2 = "SELECT * FROM G_GAMES";
		
		rs2 = DB.getResultSet(strSql2);
		
	}else{
		response.sendRedirect("./login2.jsp");
	}	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#update{
		border:1px solid #444;
		padding: 10px;
		text-align:center;
	}
</style>
<script>
<%
try {
%>
	function wellCome(){
		if(<%=alertNum%> == "1"){
			alert("<%=rs.getString("MNAME")%>" + "님 환영합니다");
		}
	}

<%
	}
	catch (Exception e) {
	
}
%>
	function goUpdate(){
		document.getElementById("gup").submit();
	}
</script>
</head>
<body onload ="wellCome()">
	<% 
		try {
		while(rs2.next()) { 
	%>
	
		<div><%=rs2.getString("GNAME")%></div>
	
	<%
		}
			}
		catch (Exception e) {
		}
	%>
	<div id="update" onclick="goUpdate()">수정</div>
	<form id="gup" action="./update.jsp" method="post"></form>
</body>
</html>