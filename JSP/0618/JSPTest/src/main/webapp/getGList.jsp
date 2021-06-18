<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="DB" class="PKG_DBHandler.DBHandler" scope="page"/>

<% 
	DB.setUrl("jdbc:oracle:thin:@localhost:1525:xe");
	DB.setUserId("games");
	DB.setUserPass("1");
	
	DB.DBCon();
	
	String strSql = "SELECT * FROM GAMES_TBL"; 
	
	ResultSet rs = DB.getResultSet(strSql);

	String strXML = "<?xml version='1.0'?>";
	
	strXML += "<lists>";
	while(rs.next()){
		
		strXML += "<list>";
		strXML += "<gName>";
		strXML += rs.getString("G_NAME");
		strXML += "</gName>";
		strXML += "<gPrice>";
		strXML += rs.getString("G_SALES_PRICE");
		strXML += "</gPrice>";
		strXML += "</list>";
	}
	strXML += "</lists>";
	
	response.setContentType("text/xml;");
	
	PrintWriter writer = response.getWriter();
	writer.print(strXML);

%>