<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DB" class="PKG_DBHandler.DBHandler" scope="page"/>
<%
	String strUserID = request.getParameter("userID");
	String strUserPass = request.getParameter("userPass");
	
	DB.setUrl("jdbc:oracle:thin:@localhost:1525:xe");
	DB.setUserId("games");
	DB.setUserPass("1");
	
	DB.DBCon();
	
	String strSql = "SELECT DECODE(MAX(CT_ID),NULL,'N','Y')AS MAXID, MAX(CT_NAME)AS MAXNAME FROM CUSTOMERS_TBL WHERE CT_ID = '" + strUserID + "' AND CT_BIRTH = '" + strUserPass + "'";
	System.out.println(strSql);
	ResultSet rs = DB.getResultSet(strSql);
	
	rs.next();
	
	String Login = rs.getString("MAXID");
	
	System.out.println(Login);
	
	if(Login.equals("Y")){
		session.setAttribute("user", strUserID);
		session.setAttribute("userName", rs.getString("MAXNAME"));
		response.sendRedirect("./20210617.jsp?result=Y");
	}
	else{
		response.sendRedirect("./20210617.jsp?result=N");
	}
	

	
%>