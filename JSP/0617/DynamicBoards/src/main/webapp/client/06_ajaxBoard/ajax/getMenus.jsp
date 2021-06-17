<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>

<% 

	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
	DBConn.setDBInfo(dbInfos);
	
	
	String strSql = "SELECT * FROM MENUS ORDER BY MENUID ASC";
	
	ResultSet rs = DBConn.getResultSet(strSql);
	
	String strXML = "<?xml version='1.0'?>";
	strXML += "<menus>";
	
	while(rs.next()){
		
		strXML += "<menu>";
		strXML += "<menuid>";
		strXML += rs.getString("MENUID");
		strXML += "</menuid>";
		strXML += "<menuname>";
		strXML += rs.getString("MENUNAME");
		strXML += "</menuname>";
		strXML += "</menu>";
		
	}
	
	strXML += "</menus>";
	
	response.setContentType("text/xml;");
	
	PrintWriter writer = response.getWriter();
	writer.print(strXML);

%>