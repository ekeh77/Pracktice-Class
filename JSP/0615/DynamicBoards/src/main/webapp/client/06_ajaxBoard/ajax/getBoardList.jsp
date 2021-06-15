<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>

<% 
	String strMenuID = request.getParameter("menuid");

	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
	DBConn.setDBInfo(dbInfos);
	
	String strSql = "SELECT * FROM BOARDS WHERE MENUID='" + strMenuID + "'"; //WHERE MENUID='" + strMenuID + "'";
	
	ResultSet rs = DBConn.getResultSet(strSql);
	
	String strXML = "<?xml version='1.0'?>";
	strXML += "<borards>";
	
	while(rs.next()){	
		strXML += "<list>";
		strXML += "<bnum>";
		strXML += rs.getString("BNUM");
		strXML += "</bnum>";
		strXML += "<title>";
		strXML += rs.getString("TITLE");
		strXML += "</title>";
		strXML += "</list>";
	}	
	
	strXML += "</borards>";
	
	System.out.println(strXML);
	
	response.setContentType("text/xml;");
	
	PrintWriter writer = response.getWriter();
	writer.print(strXML);

%>