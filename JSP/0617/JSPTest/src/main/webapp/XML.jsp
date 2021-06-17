<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="DBConn" class="PKG_DBHandler.DBHandler" scope="page" />

<%
	String msg = request.getParameter("msg");

	//1.client에서 날려준 파라메터들을 받아야죠
	DBConn.setUrl("jdbc:oracle:thin:@localhost:1525:xe");
	DBConn.setUserId("games");
	DBConn.setUserPass("1");
	
	DBConn.DBCon();
	
	String strSql = "SELECT * FROM GAMES_TBL T1, COMMONS_TBL T2 WHERE T1.G_GENRE = T2.CMS_ID";
	
	ResultSet rs = DBConn.getResultSet(strSql);
	
	String strXML = "<?xml version='1.0'?>";
	
	strXML += "<rows>";
	
	while(rs.next()){
		
		strXML += "<row>";
		strXML += "<GNAME>" + rs.getString("G_NAME") + "</GNAME>";
		strXML += "<GSP>" + rs.getString("G_SUPPLY_PRICE") + "</GSP>";
		strXML += "<GSP2>" + rs.getString("CMS_NAME") + "</GSP2>";
		strXML += "<site>" + msg + "</site>";
		strXML += "</row>";
		
	}
	
	strXML += "</rows>";
	
	response.setContentType("text/xml;");
	
	PrintWriter writer = response.getWriter();
	writer.print(strXML);
	
%>