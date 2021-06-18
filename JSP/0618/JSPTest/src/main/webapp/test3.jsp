<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="DB" class="PKG_DBHandler.DBHandler" scope="page"/>

<% 
	DB.setUrl("jdbc:oracle:thin:@localhost:1525:xe");
	DB.setUserId("test");
	DB.setUserPass("1");
	
	DB.DBCon();
	
	String strSql = "SELECT * FROM DRIVERS_TBL"; 
	
	ResultSet rs = DB.getResultSet(strSql);

	String strXML = "<?xml version='1.0'?>";
	
	strXML += "<lists>";
	while(rs.next()){
		
		strXML += "<list>";
		strXML += "<dName>";
		strXML += rs.getString("DR_NAME");
		strXML += "</dName>";
		strXML += "<dTel>";
		strXML += rs.getString("DR_TEL");
		strXML += "</dTel>";
		strXML += "</list>";
	}
	strXML += "</lists>";
	
	response.setContentType("text/xml;");
	
	PrintWriter writer = response.getWriter();
	writer.print(strXML);

%>